require 'rails_helper'

describe 'user edits an existing job' do
  scenario 'a user can edit a job' do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Development')
    job = company.jobs.create!(title: "test", level_of_interest: 70, city: "test", category_id: category.id)
    visit edit_company_job_path(company, job)
    title = "Developer"
    fill_in "job[title]", with: title
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"
    click_button "Update"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{job.id}")
    expect(page).to have_content(title)
  end
end
