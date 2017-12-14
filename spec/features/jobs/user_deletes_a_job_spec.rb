require 'rails_helper'

describe "User deletes existing job" do
  scenario "a user can delete a job" do
    company = create(:company)
    job = company.jobs.create!(title: "Sales", level_of_interest: 34, city: "SF")

    visit company_jobs_path(company, job)


      click_on "Delete"

    expect(page).to have_content("Job 'Sales' was successfully deleted!")
    expect(current_path).to eq(company_jobs_path(company))
  end
end