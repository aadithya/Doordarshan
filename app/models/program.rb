class Program < ActiveRecord::Base
  belongs_to :category
  has_many :schedules
  has_many :subscribe_lists
  has_many :users , :through => :subscribe_lists
  attr_accessible :description, :image, :title, :category, :schedules, :users
end
