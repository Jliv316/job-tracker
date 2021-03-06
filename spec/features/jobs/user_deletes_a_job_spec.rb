require 'rails_helper'

describe 'user deletes an existing job' do
  scenario 'a user can delete a job from company index' do
    message = 'Developer was successfully deleted!'
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Development')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)
    visit company_jobs_path(company, job)

    click_link 'Delete'

    expect(page).to have_content(message)
    expect(page).to have_content(company.name)
    expect(page).to_not have_content("#{job.title} at #{company.name}")
  end

  scenario 'a user can delete a job from show page' do
    message = 'Developer was successfully deleted!'
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Development')
    job_1 = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)
    job_2 = company.jobs.create!(title: 'QA Analyst', level_of_interest: 70, city: 'New York City', category_id: category.id)

    visit company_jobs_path(company)

    click_link 'Developer'
    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job_1.id}")
    expect(page).to have_content(job_1.title)

    click_link 'Delete'
    expect(page).to have_content(message)
    expect(page).to have_content(company.name)
    expect(page).to_not have_content("#{job_1.title} at #{company.name}")
  end
end
