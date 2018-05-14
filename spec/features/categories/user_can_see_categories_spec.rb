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

  scenario "a user sees all the categories" do
    category_title = 'Development'
    category_title_two = 'Science'
    category = Category.create!(title: category_title)
    category_two = Category.create!(title: category_title_two)

    visit categories_path

    expect(page).to have_content(category_title)
    expect(page).to have_link('Edit')
  end

  scenario "a user is taken to edit form by clicking through index" do
    category_title = 'Development'
    category = Category.create!(title: category_title)

    visit categories_path
    click_link 'Edit'

    expect(current_path).to eq(edit_category_path)
    expect(page).to have_content('Edit Category')
    expect(page).to have_button('Save')
  end
end

# The user can view a list of all Categories on a single page, and each Category
# can be deleted from that page. There is also a link to “Edit” each Category,
# which takes the user to a form where they can update the Category.
