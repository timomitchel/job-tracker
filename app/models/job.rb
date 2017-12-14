class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.location
    order("city DESC")
  end

  def self.level_of_interest
    order("level_of_interest DESC")
  end

  def self.city(city)
    where(city: city.capitalize)
  end

  def self.count_by_interest_level
    group("level_of_interest").order("level_of_interest DESC").count
  end

  def self.count_by_location
    group("city").order("count(city) DESC").count
  end
end
