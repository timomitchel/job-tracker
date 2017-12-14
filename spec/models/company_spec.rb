require 'rails_helper'

describe Company do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a name" do
        company = Company.new()
        expect(company).to be_invalid
      end

      it "has a unique name" do
        Company.create(name: "Dropbox")
        company = Company.new(name: "Dropbox")
        expect(company).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a name" do
        company = Company.new(name: "Dropbox")
        expect(company).to be_valid
      end
    end
  end

  describe "relationships" do
    it "has many jobs" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:jobs)
    end
     it "has many contacts" do
      company = Company.new(name: "Dropbox")
      expect(company).to respond_to(:contacts)
    end
  end
  describe "class methods" do 
    it "top_three_companies_by_average_interest method" do 
      company = create(:company)
      company_2 = create(:company)
      company_3 = create(:company)
      company_4 = create(:company)
      company_5 = create(:company)

      Job.create!(title: "Sales", city: "Denver", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 1, description: "good", company: company)
      Job.create!(title: "Sales", city: "Denver", level_of_interest: 5, description: "good", company: company_2)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 5, description: "good", company: company_2)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 5, description: "good", company: company_2)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 5, description: "good", company: company_2)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 5, description: "good", company: company_2)
      Job.create!(title: "Sales", city: "Denver", level_of_interest: 10, description: "good", company: company_3)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 10, description: "good", company: company_3)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 10, description: "good", company: company_3)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 10, description: "good", company: company_3)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 10, description: "good", company: company_3)
      Job.create!(title: "Sales", city: "Denver", level_of_interest: 5, description: "good", company: company_4)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 5, description: "good", company: company_4)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 4, description: "good", company: company_4)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 3, description: "good", company: company_4)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 3, description: "good", company: company_4)
      Job.create!(title: "Sales", city: "Denver", level_of_interest: 1, description: "good", company: company_5)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 1, description: "good", company: company_5)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 1, description: "good", company: company_5)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 3, description: "good", company: company_5)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 4, description: "good", company: company_5)
      
      expected = Company.top_three_companies_by_average_interest_level
      expect(expected.length).to eq(3)
      expect(expected.class).to eq(Hash)
    end
  end
end
