class User < ActiveRecord::Base
	attr_accessible :name, :email, :password, :password_confirmation
	has_secure_password
	has_many :subscribe_lists
	has_many :programs, :through => :subscribe_lists
	has_many :subscriptions, dependent: :destroy
	has_many :tags, through: :subscriptions

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token

	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,
		format:     { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }
	validates :password_confirmation, presence: true
  def subscribe!(sTag)
	subscriptions.create!(tag_id: sTag.id)
  end
  def unsubscribe!(sTag)
    subscriptions.find_by_tag_id(sTag.id).destroy
  end
	def send_mail( program_id, email)
		Gmail.new("remotecontroller1", "remotecontroller") do |gmail|
			gmail.deliver do
				to email
				prog = Program.find(program_id)
				subject "You just subscribed to " + prog.title
				text_part do
					body "You just subscribed to " + prog.title  + " from the TVG"
				end
			end
		end
	end

	def read_mail email_id
		Gmail.new("remotecontroller1", "remotecontroller") do |gmail|
			gmail.inbox.emails(:unread).each do |email|
				query = email.text_part.body.decoded
    		query = '%' + (query.upcase.gsub /s+/, "%") + '%'
    		programs = Program.where("UPPER(title) LIKE '#{query}'")
				puts programs.first
				send_mail(programs.first.id , email_id)
			end
		end
	end

	private

	def create_remember_token
		self.remember_token = SecureRandom.urlsafe_base64
	end
end

