class Program < ActiveRecord::Base
  has_many :subscribe_lists
  has_many :users , :through => :subscribe_lists
  attr_accessible :category, :channel, :date, :title, :start, :stop
  self.per_page = 6 
  def self.search(search, page)
    where("channel like ?","%#{search.upcase()}%").paginate(:page => page).order("start, channel")
  end
end

