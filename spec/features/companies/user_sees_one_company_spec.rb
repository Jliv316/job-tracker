require 'rails_helper'

describe "User sees one company" do
  xit "a user sees a company" do
    company = Company.create!(name: "ESPN")
    company.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit company_path(company)

    expect(current_path).to eq("/companies/#{company.id}/jobs")
    expect(page).to have_content("ESPN")
    expect(page).to have_content("Developer")
  end

  scenario "a user sees contacts listed for specific company" do
    company = Company.create!(name: "HAHAH")
    company.jobs.create!(title: 'Developer', level_of_interest: 90, city: 'Denver')
    contact = company.contacts.create!(full_name: 'Dwight Schrute', position: 'Assistant to the Regional Manager', email: 'dwight_schrute@scranton.com')

    visit company_jobs_path(company)
    save_and_open_page
    expect(page).to have_content(contact.full_name)
    expect(page).to have_content(contact.position)
    expect(page).to have_content(contact.email)
  end
end
