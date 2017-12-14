class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  belongs_to :company
  belongs_to :category, optional: true
  has_many :comments

  def self.location
    order("city ASC")
  end

  def self.level_of_interest
    order("level_of_interest ASC")
  end

  def self.city(city)
    where(city: city)
  end
end
