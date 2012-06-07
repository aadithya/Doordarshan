class SubscribeList < ActiveRecord::Base
  attr_accessible :program_id, :user_id
  belongs_to :user
  belongs_to :program
end
