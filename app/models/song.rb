class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: -> {self.released}
  validates :title, uniqueness: true, if: -> {Song.where(release_year: self.release_year)}
  validate :valid_year

 def valid_year
   if self.release_year
     unless self.release_year < Time.now.year
       errors.add(:release_year, "Year most be same or minor than current")
     end
    end
  end
end
