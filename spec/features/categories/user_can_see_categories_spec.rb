require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category_title = 'Development'
    category_title_two = 'Science'
    category = Category.create!(title: category_title)
    category_two = Category.create!(title: category_title_two)

    visit categories_path

    expect(page).to have_content(category_title)
    expect(page).to have_link('add a new category', :href => '/categories/new')
  end
end