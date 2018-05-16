require 'rails_helper'

describe 'User visits /dashboard' do
  xscenario "user sees all the jobs sorted by level of interest" do
    company1 = Company.create!(name: "ESPN")
    company2 = Company.create!(name: "Turing")
    company3 = Company.create!(name: "Google")
    company4 = Company.create!(name: "Apple")
    category = Category.create!(title: 'Developer')
    job1 = company1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
    job2 = company1.jobs.create!(title: "QA Analyst", level_of_interest: 40, city: "Denver", category_id: category.id)
    job3 = company2.jobs.create!(title: "Developer", level_of_interest: 20, city: "Chicago", category_id: category.id)
    job4 = company2.jobs.create!(title: "QA Analyst", level_of_interest: 0, city: "Dallas", category_id: category.id)
    job5 = company3.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
    job6 = company3.jobs.create!(title: "QA Analyst", level_of_interest: 30, city: "New York City", category_id: category.id)
    job7 = company4.jobs.create!(title: "Developer", level_of_interest: 90, city: "Chicago", category_id: category.id)
    job8 = company4.jobs.create!(title: "QA Analyst", level_of_interest: 85, city: "Dallas", category_id: category.id)

    visit '/dashboard'

    expect(page).to have_content(job1.title)
    expect(page).to have_content(job2.title)
    expect(page).to have_content(job5.title)
    # expect(page).to have_content(company1.level_of_interest)
    # expect(page).to have_content(company3.level_of_interest)
    # expect(page).to have_content(company4.level_of_interest)
  end

  describe 'user visits /jobs?location=Denver' do
    scenario "user sees all the jobs for specific city" do
      company1 = Company.create!(name: "ESPN")
      company2 = Company.create!(name: "Turing")
      company3 = Company.create!(name: "Google")
      company4 = Company.create!(name: "Apple")
      category = Category.create!(title: 'Developer')
      job1 = company1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job2 = company1.jobs.create!(title: "QA Analyst", level_of_interest: 40, city: "Denver", category_id: category.id)
      job3 = company2.jobs.create!(title: "Developer", level_of_interest: 20, city: "Chicago", category_id: category.id)
      job4 = company2.jobs.create!(title: "QA Analyst", level_of_interest: 0, city: "Dallas", category_id: category.id)
      job5 = company3.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
      job6 = company3.jobs.create!(title: "QA Analyst", level_of_interest: 30, city: "New York City", category_id: category.id)
      job7 = company4.jobs.create!(title: "Developer", level_of_interest: 90, city: "Chicago", category_id: category.id)
      job8 = company4.jobs.create!(title: "QA Analyst", level_of_interest: 85, city: "Dallas", category_id: category.id)

      visit '/jobs?location=Denver'

      expect(page).to have_content(job1.title)
      expect(page).to have_content(job2.title)
      expect(page).to have_content(job5.title)
      # expect(page).to have_content(company1.level_of_interest)
      # expect(page).to have_content(company3.level_of_interest)
      # expect(page).to have_content(company4.level_of_interest)
    end
  end
  describe 'user visits /jobs?sort=interest' do
    scenario "user sees all the jobs for specific city" do
      company1 = Company.create!(name: "ESPN")
      company2 = Company.create!(name: "Turing")
      company3 = Company.create!(name: "Google")
      company4 = Company.create!(name: "Apple")
      category = Category.create!(title: 'Developer')
      job1 = company1.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver", category_id: category.id)
      job2 = company1.jobs.create!(title: "QA Analyst", level_of_interest: 40, city: "Denver", category_id: category.id)
      job3 = company2.jobs.create!(title: "Developer", level_of_interest: 20, city: "Chicago", category_id: category.id)
      job4 = company2.jobs.create!(title: "QA Analyst", level_of_interest: 0, city: "Dallas", category_id: category.id)
      job5 = company3.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver", category_id: category.id)
      job6 = company3.jobs.create!(title: "QA Analyst", level_of_interest: 30, city: "New York City", category_id: category.id)
      job7 = company4.jobs.create!(title: "Developer", level_of_interest: 90, city: "Chicago", category_id: category.id)
      job8 = company4.jobs.create!(title: "QA Analyst", level_of_interest: 85, city: "Dallas", category_id: category.id)

      visit '/jobs?sort=interest'
      save_and_open_page

      expect(page).to have_content(job1.title)
      expect(page).to have_content(job2.title)
      expect(page).to have_content(job5.title)
      # expect(page).to have_content(company1.level_of_interest)
      # expect(page).to have_content(company3.level_of_interest)
      # expect(page).to have_content(company4.level_of_interest)
    end
  end
end