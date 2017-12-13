require 'rails_helper'

describe "User deletes existing category" do
  scenario "a user can delete a category" do
    category_1 = create(:category)
    visit categories_path

    within(".category_#{category_1.id}") do
      click_link "Delete"
    end

    expect(page).to have_content("Sales1 was successfully deleted!")
  end
end
