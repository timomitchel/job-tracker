require 'rails_helper'

describe "User sees all companies" do
  scenario "a user sees all the companies" do
    company_two, company = create_list(:company, 2)


    visit companies_path

    expect(page).to have_content("#{company_two.name}")
    expect(page).to have_content("#{company.name}")
  end

end
