require 'rails_helper'

describe 'User adds category while creating job' do
  scenario 'User sees category drop down menu on job new job form' do
    category_title = 'Development'
    category_title_two = 'Science'
    category = Category.create!(title: category_title)
    category_two = Category.create!(title: category_title_two)
    company = Company.create!(name: "ESPN")

    visit new_company_job_path(company)
    save_and_open_page

    select(category.title, from: 'Category')
    fill_in "job[title]", with: "Developer"
    fill_in "job[description]", with: "So fun!"
    fill_in "job[level_of_interest]", with: 80
    fill_in "job[city]", with: "Denver"

    click_button "Create"

    expect(current_path).to eq("/companies/#{company.id}/jobs/#{Job.last.id}")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
    expect(page).to have_content("80")
    expect(page).to have_content(category_title)
  end
end

# When the user creates a new Job, they are required to select its Category from
# a drop down menu of existing categories. They also see a link to create a new Category.
