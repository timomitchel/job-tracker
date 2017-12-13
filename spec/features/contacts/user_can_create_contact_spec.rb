require 'rails_helper'

describe "the user can create a contact on a job" do
  it "creates the contact" do
    company = create(:company)
    contact = create(:contact)

    visit company_path(company, contact)

    fill_in "contact[name]", with: "I am contact name"
    fill_in "contact[position]", with: "I am contact position"
    fill_in "contact[email]", with: "I am contact name"

    click_on "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs/#{Job.last.id}")
    expect(page).to have_content "I am contact"
  end 
end
