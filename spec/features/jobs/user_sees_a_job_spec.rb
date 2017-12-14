require 'rails_helper'

describe "User sees a specific job" do
  scenario "a user sees a job for a specific company" do
    company = create(:company)
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")

    visit company_jobs_path(company, job)

    expect(page).to have_content("#{company.name}")
    expect(page).to have_content("Developer")
  end
end
