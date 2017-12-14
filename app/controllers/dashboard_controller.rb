class DashboardController < ApplicationController

  def index
    @job_count = Job.count_by_interest_level
    @job_location = Job.count_by_location
    @company = Company.top_three_companies_by_average_interest_level
  end
end