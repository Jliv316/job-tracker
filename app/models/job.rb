class Job < ApplicationRecord
  validates :title, :level_of_interest, :city, presence: true
  has_many :comments
  belongs_to :company
  belongs_to :category

  def self.sort_by_city
    Job.order('city ASC')
  end
end
