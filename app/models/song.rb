class Song < ActiveRecord::Base
  validates :title, presence: true, uniqueness: {scope: :artist_name}
  validates :artist_name, presence: true
  validates :release_year, presence: true, if: -> {self.released == true }, numericality: { less_than_or_equal_to: DateTime.now.strftime("%Y").to_i}
  validates :released, inclusion: {in: [true, false]}

end
