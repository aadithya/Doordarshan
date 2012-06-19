class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :subscriptions
  has_many :users , :through => :subscriptions
end
