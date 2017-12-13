require 'rails_helper'

describe "the user can create a comment on a job" do
  it "creates the comment" do
    company = create(:company)
    job = create(:job)

    visit company_job_path(company, job)

    fill_in "comment[body]", with: "I am comment"

    click_on "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content "I am comment"
  end 
end
