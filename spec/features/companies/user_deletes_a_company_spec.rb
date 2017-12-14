require 'rails_helper'

describe "User deletes existing company" do
  scenario "a user can delete a company" do
    create(:company)
    visit companies_path

    
      click_link "Delete"

    expect(page).to have_content("was successfully deleted!")
  end
end
