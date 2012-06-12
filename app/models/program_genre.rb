class ProgramGenre < ActiveRecord::Base
  belongs_to :program
  belongs_to :genre
end
