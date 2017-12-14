require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = create(:company)
    job = company.jobs.create!(title: "Engineer", level_of_interest: 0, city: "NYC")
    visit edit_company_job_path(job.company, job)

    fill_in "job[title]", with: "Developer"
    fill_in "job[level_of_interest]", with: 55
    fill_in "job[city]", with: "Denver"
    click_button "Update"

    expect(current_path).to eq("/companies/#{job.company_id}/jobs/#{Job.last.id}")
    expect(page).to have_content("Developer")
    expect(page).to have_content(55)
    expect(page).to have_content("Denver")
    expect(page).to have_link("#{company.name}")
  end
end
