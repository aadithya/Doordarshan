class Subscription < ActiveRecord::Base
  attr_accessible :tag_id
  
  belongs_to :tag
  belongs_to :user
  
  validates :tag_id, presence: true
  validates :user_id, presence: true
  
end
