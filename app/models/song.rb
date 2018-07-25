class Song < ActiveRecord::Base
  validates :title, presence: true
  validate  :valid_release
  validates :release_year, presence: true, if: -> {self.released == true}
  validates :title, uniqueness: true


  def valid_release
    if self.release_year
      if self.release_year > Time.now.year
        errors.add(:release_year, "Can't be in the future")
      end
    end
  end
end
