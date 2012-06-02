class Program < ActiveRecord::Base
  attr_accessible :category, :channel, :date, :title, :start, :stop
self.per_page = 6 
def self.search(search, page)
	where("channel like ?","%#{search.upcase()}%").paginate(:page => page).order("start, channel")
end
end

