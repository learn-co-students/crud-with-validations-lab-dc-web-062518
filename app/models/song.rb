class Song < ActiveRecord::Base
  validates :title, presence: true
  validates :release_year, presence: true, if: -> {self.released}, numericality: {less_than_or_equal_to: Date.today.year}
  validates :released, inclusion: { in: [true, false] }
  validates :title, uniqueness: {scope: :artist_name}


end
