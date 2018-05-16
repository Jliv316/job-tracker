class DashboardController < ApplicationController
  def index
    @level_of_interest = Job.by_level_of_interest
    render :index
  end
end