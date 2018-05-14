require 'rails_helper'

describe 'User visits the company_job show page' do
  describe "User sees a specific job" do
    scenario "a user sees a job for a specific company" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      comment = job.comments.create!(body: 'Spoke to hiring manager, Jacob. Plan to follow up Monday.')

      visit company_job_path(company, job)

      expect(page).to have_content(comment.body)
      expect(page).to have_content("ESPN")
      expect(page).to have_content("Developer")
      expect(page).to have_content("70")
    end
  end

  describe "Fills out a comment form" do
    scenario "user sees new comment on the company job form page" do
      company = Company.create!(name: "ESPN")
      job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
      body = "The dog has fucking papers, man"

      visit company_job_path(company, job)

      fill_in 'comment[body]', with: body
      click_on "Create Comment"

      expect(current_path).to eq(company_job_path(company, job))
      expect(page).to have_content(body)
      expect(page).to have_content("ESPN")
      expect(page).to have_content("Developer")
      expect(page).to have_content("70")
    end
  end
end


