class Company < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :jobs, dependent: :destroy
  has_many :contacts

  def self.top_three_companies_by_average_interest_level
    joins(:jobs)
    .order("avg(level_of_interest) DESC")
    .limit(3)
    .group(:name)
    .average(:level_of_interest)
  end

end
