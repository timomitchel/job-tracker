require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category = Category.create!(title: "Sales")
    category_two = Category.create!(title: "HR")

    visit categories_path

    expect(page).to have_content("Sales")
    expect(page).to have_content("HR")
  end

end
