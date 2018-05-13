require 'rails_helper'

describe 'user visits a specific job page' do
  it 'user can add a job specific comment' do
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver')

    visit company_job_path(company, job)
    body = 'Spoke to hiring manager, Jacob. Plan to follow up Monday.'
    fill_in 

  end
end