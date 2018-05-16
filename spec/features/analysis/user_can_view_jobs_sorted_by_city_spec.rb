require 'rails_helper'

describe 'User visits /jobs?sort=location' do
  scenario "user sees all the jobs sorted by city" do
    company = Company.create!(name: "ESPN")
    category = Category.create!(title: 'Developer')
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "New York City", category_id: category.id)
    job3 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Chicago", category_id: category.id)
    job4 = company.jobs.create!(title: "QA Analyst", level_of_interest: 70, city: "Dallas", category_id: category.id)
    
    visit '/jobs?sort=location'

    expect(page).to have_content(job1.city)
    expect(page).to have_content(job2.city)
    expect(page).to have_content(job3.city)
    expect(page).to have_content(job4.city)
  end
end