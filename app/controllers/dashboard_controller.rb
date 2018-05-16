class DashboardController < ApplicationController
  def index
    @level_of_interest = Job.by_level_of_interest
    @job_locations = Job.by_location
    render :index
  end
end