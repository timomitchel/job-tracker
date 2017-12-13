require 'rails_helper'

describe "User sees one category" do
  scenario "a user sees a category" do
    category = Category.create!(title: "Sales")
    # category.jobs.create!(title: "Developer", level_of_interest: 90, city: "Denver")

    visit category_path(category)

    expect(current_path).to eq("/categories/#{category.id}")
    expect(page).to have_content("Sales")
  end
end