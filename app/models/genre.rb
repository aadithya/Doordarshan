class Genre < ActiveRecord::Base
  attr_accessible :name
  has_many :program_genres
  has_many :programs, :through => :program_genres
  before_destroy :ensure_not_referenced_by_any_program

  private

  def ensure_not_referenced_by_any_program
    if programs.empty?
      return true
    else
      errors.add(:base, 'Programs present')
      return false
    end
  end

end
