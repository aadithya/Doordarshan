class Program < ActiveRecord::Base
  attr_accessible :category, :channel, :date, :title
def self.search(search)
	where("channel like ?","%#{search.upcase()}%")
  #find_all_by_channel(search) 
end
end

