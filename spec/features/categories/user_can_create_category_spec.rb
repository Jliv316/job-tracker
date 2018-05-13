require 'rails_helper'

describe 'User creates a new category' do
  scenario 'a user can create a new category' do
    category = 'Development'

    visit new_category_path

    fill_in 'Title', with: category
    click_button 'Create Category'
    save_and_open_page

    expect(current_path).to eq(categories_path)
    expect(page).to have_content("#{category} added!")
    expect(Category.count).to eq(1)
  end
  # 
  # scenario 'a user can not create a new category if it already exists' do
  #   category = 'Development'
  #   category_two = 'Awesome'
  #
  #   visit new_category_path
  #
  #   fill_in 'Title', with: category_two
  #   click_button 'Create Category'
  #   save_and_open_page
  #
  #   expect(current_path).to eq(categories_path)
  #   expect(page).to have_content("#{category} added!")
  #   expect(Category.count).to eq(1)
  # end
end


# When the user tries to create a Category that already exists,
# they are brought back to the page with the form to create a Category.
