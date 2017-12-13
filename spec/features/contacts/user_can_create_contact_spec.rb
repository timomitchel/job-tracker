require 'rails_helper'

describe "the user can create a contact on a job" do
  it "creates the contact" do
    company = create(:company)

    visit company_path(company)

    fill_in "contact[name]", with: "I am contact name"
    fill_in "contact[position]", with: "I am contact position"
    fill_in "contact[email]", with: "I am contact email"

    click_on "Submit"

    expect(current_path).to eq("/companies/#{Company.last.id}/jobs")
    expect(page).to have_content "I am contact name"
    expect(page).to have_content "I am contact position"
    expect(page).to have_content "I am contact email"
  end 
end
