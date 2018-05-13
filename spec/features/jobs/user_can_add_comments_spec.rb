require 'rails_helper'

describe 'user visits a specific job page' do
  describe 'user can add a job specific comment' do
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver')

    visit company_job_path(company, job)
  end
end