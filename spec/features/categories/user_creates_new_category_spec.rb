require 'rails_helper'

describe "User creates a new Category" do
  scenario "a user can create a new category" do
    visit new_category_path

    fill_in "category[title]", with: "Sales"
    click_on "Create Category"

    expect(current_path).to eq("/categories/#{Category.last.id}")
    expect(page).to have_content("Sales")
    expect(Category.count).to eq(1)
  end
end