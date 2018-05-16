class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments
  belongs_to :company
  belongs_to :category

  def self.sort_by_city
    Job.order('city ASC')
  end

  def self.by_level_of_interest
    Job.all.group(:level_of_interest).count
  end

  def self.by_location
    Job.all.group(:city).count
  end
end
