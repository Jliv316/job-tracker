require 'rails_helper'

describe 'User visits /jobs?sort=location' do
  scenario "user sees all the jobs sorted by city" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City")
    company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Chicago")
    company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "Dallas")

    visit '/jobs?sort=loca'

    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("QA Analyst")
  end
end