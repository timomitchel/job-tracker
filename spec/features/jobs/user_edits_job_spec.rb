require 'rails_helper'

describe "User edits an existing job" do
  scenario "a user can edit a job" do
    company = Company.create!(name: "ESPN")
    job = company.jobs.create!(title: "Engineer", level_of_interest: 0, city: "NYC")
    visit edit_job_path(job)

    save_and_open_page

    fill_in "job[title]", with: "Developer"
    fill_in "job[level_of_interest]", with: 55
    fill_in "job[city]", with: "Denver"
    click_button "Update"

    save_and_open_page

    expect(current_path).to eq("/jobs/#{Job.last.id}")
    expect(page).to have_content("Developer")
    expect(page).to have_content(55)
    expect(page).to have_content("Denver")
    expect(page).to have_link("ESPN")
  end
end
