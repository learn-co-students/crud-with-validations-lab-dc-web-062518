class Song < ActiveRecord::Base

  validates :title, presence: true
  validates :released, inclusion: { in: [true, false] }
  # validates :released, exclusion: { in: [nil]}
  validates :release_year, presence: true, if: -> {self.released}, numericality: { less_than_or_equal_to: Date.today.year }
  # validates :release_year, numericality: { less_than_or_equal_to: 2018 }
  validates :title, uniqueness: { scope: :release_year }
  # validates :artist_name, presence: true

end

# class Song < ActiveRecord::Base
#   validates :title, presence: true
#   validates :release_year, presence: true, if: -> {self.released}
#   validates :title, uniqueness: true, if: -> {Song.where(release_year: self.release_year)}
#   validate :valid_year
#
#  def valid_year
#    if self.release_year
#      unless self.release_year < Time.now.year
#        errors.add(:release_year, "Year most be same or minor than current")
#      end
#     end
#   end
# end
