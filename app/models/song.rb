class Song < ActiveRecord::Base
validates :title, presence: true
validates :title, uniqueness: true
validates :release_year, presence: true, if:-> {self.released == true}
# validates :release_year, numericality: {less_than_or_equal_to: 2018}
validate :no_year

def no_year
  if self.release_year
    if self.release_year > Time.now.year
      errors.add(:release_year, "Invalid Release Year")
    end
  end
end


end
