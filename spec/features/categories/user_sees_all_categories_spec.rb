require 'rails_helper'

describe "User sees all categories" do
  scenario "a user sees all the categories" do
    category, category_two = create_list(:category, 2)
    

    visit categories_path

    expect(page).to have_content("#{category.title}")
    expect(page).to have_content("#{category_two.title}")
    expect(current_path).to eq("/categories")
  end

end
