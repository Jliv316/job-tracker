require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_name = 'Development'
    category_name_two = 'Science'
    category = Category.create!(name: category_name)
    category_two = Category.create!(name: category_name_two)

    visit categories_path

    expect(page).to have_content(category_name)
    expect(page).to have_link('add a new category', :href => '/categories/new')
  end
end
