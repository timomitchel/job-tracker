require 'rails_helper'

describe "User sees dashboard" do
  scenario "visits root" do
    company = create(:company)
    job = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job1 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job2 = company.jobs.create!(title: "Developer", level_of_interest: 70, city: "Denver")
    job3 = company.jobs.create!(title: "Developer", level_of_interest: 50, city: "Orlando")
    job4 = company.jobs.create!(title: "Developer", level_of_interest: 50, city: "Orlando")

    visit '/'

    expect(page).to have_content("Job Count By Interest Level:")
    expect(page).to have_content("Job Count By Location:")
    expect(page).to have_content("Top Three Companies by Average Level of Interest:")
    expect(page).to have_content("Denver"=>3)
    expect(page).to have_content("Orlando"=>3)
  end
end