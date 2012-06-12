class Schedule < ActiveRecord::Base
  belongs_to :program
  belongs_to :channel
  attr_accessible :end, :finale, :premiere, :recurrence, :start, :program, :channel
end
