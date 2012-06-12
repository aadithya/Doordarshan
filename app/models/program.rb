class Program < ActiveRecord::Base
  belongs_to :category
  has_many :schedules
  attr_accessible :description, :image, :title, :category, :schedules
end
