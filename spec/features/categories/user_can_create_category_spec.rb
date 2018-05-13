require 'rails_helper'

describe 'User creates a new category' do
  scenario 'a user can create a new job' do
    category = 'Development'
    company = Company.create!(name: 'ESPN')
    job = company.jobs.create!(title: 'Developer', level_of_interest: 70, city: 'Denver')
    visit new_category_path

    fill_in 'Name', with: category
    click_button 'Save'

    expect(current_path).to eq(categories)
    expect(page).to have_content(category)
    expect(Categories.count).to eq(1)
  end
end

 # The user can create a new Category by filling out a form. Each Category has
 # a title (e.g. “Web Development”, “Education”, “Finance”)
