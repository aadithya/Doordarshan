class Program < ActiveRecord::Base
  attr_accessible :category, :channel, :date, :title
def self.search(search)
  all()
end
end

