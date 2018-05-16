class Dashboard < ApplicationRecord
  def self.by_level_of_interest
    Dashboard.all.group(:level_of_interest).count
  end
end