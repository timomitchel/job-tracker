require 'rails_helper'

describe "User edits an existing category" do
  scenario "a user can edit a category" do
    category = Category.create!(title: "Sales")
    visit edit_category_path(category)

    fill_in "category[title]", with: "HR"
    click_on "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("HR")
    expect(page).to_not have_content("Sales")
  end
end
