require 'rails_helper'

describe 'user visits a specific job page' do
  it 'user can add a job specific comment' do
    company = Company.create!(name: 'ESPN')
    category = Category.create!(title: 'Development')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver', category_id: category.id)

    visit company_job_path(company, job)
    body = 'Spoke to hiring manager, Jacob. Plan to follow up Monday.'
    fill_in 'comment[body]', with: body
    click_button "Create Comment"

    expect(current_path).to eq(company_job_path(company, job))
    expect(page).to have_content(body)
  end
end
