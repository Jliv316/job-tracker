class DashboardController < ApplicationController
  def index
      @level_of_interest = Job.by_level_of_interest
      @jobs_by_location = Job.by_location
      render :index
    end
  end
end