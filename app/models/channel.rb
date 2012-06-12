class Channel < ActiveRecord::Base
  attr_accessible :description, :image, :name
  has_many :schedules
end
