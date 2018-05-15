require 'rails_helper'

describe 'User edits category' do
  scenario "a user is taken to edit form by clicking through index" do
    category_title = 'Development'
    category = Category.create!(title: category_title)

    visit categories_path
    click_link 'Edit'

    expect(page).to have_content("Edit #{category.title} here!")
    expect(page).to have_button('Update Category')
  end

  scenario "a user edits category" do
    category_title = 'Development'
    new_category = 'Awesome'
    category = Category.create!(title: category_title)

    visit categories_path
    click_link 'Edit'

    fill_in 'category[title]', with: new_category
    click_button 'Update Category'

    expect(current_path).to eq categories_path
    expect(page).to have_content(new_category)
  end
end
