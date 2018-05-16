require 'rails_helper'

describe 'User sees all jobs with category for show page' do
  scenario 'visits /category and sees all jobs in that category' do
    company = Company.create!(name: 'ESPN')
    category_title = 'Development'
    category_title_2 = 'Superist'
    category = Category.create!(title: category_title)
    category_2 = Category.create!(title: category_title_2)
    job = company.jobs.create!(title: 'Rocket Developer', level_of_interest: 70, city: 'Scranton', category_id: category.id)
    job_2 = company.jobs.create!(title: 'super', level_of_interest: 60, city: 'your mom', category_id: category_2.id)

    visit category_path(category)

    expect(page).to have_content(job.title)
    expect(page).to_not have_content(job_2.title)
  end
end
