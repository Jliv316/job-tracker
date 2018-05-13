# require 'rails_helper'
#
# describe 'user edits an existing job' do
#   scenario 'a user can edit a job' do
#     job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
#
#     visit edit_job_path(job)
#     fill_in "job[name]", with: "EA Sports"
#     click_button "Update"
#
#     expect(current_path).to eq('/jobs/#{job.id}')
#     expect
#
#   end
# end
