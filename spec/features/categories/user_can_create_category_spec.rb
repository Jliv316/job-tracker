require 'rails_helper'

describe 'User creates a new category' do
  scenario 'a user can create a new category' do
    category = 'Development'

    visit new_category_path

    fill_in 'category[title]', with: category
    click_button 'Create Category'

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("#{category} added!")
    expect(Category.count).to eq(1)
  end

  scenario 'a user can not create a new category if it already exists' do
    Category.create!(title: 'Awesome')
    category = 'Development'
    category_two = 'Awesome'

    visit categories_path
    expect(page).to have_content("#{category_two}")
    expect(Category.count).to eq(1)

    visit new_category_path

    fill_in 'category[title]', with: category_two
    click_button 'Create Category'

    expect(current_path).to eq(new_category_path)
    expect(page).to have_content("Please try again, #{category_two} already exists")
    expect(Category.count).to eq(1)
  end
end
