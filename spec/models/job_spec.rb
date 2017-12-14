require 'rails_helper'

describe Job do
  describe "validations" do
    context "invalid attributes" do
      it "is invalid without a title" do
        job = Job.new(level_of_interest: 80, description: "Wahoo", city: "Vail")
        expect(job).to be_invalid
      end

      it "is invalid without a level of interest" do
        job = Job.new(title: "Developer", description: "Wahoo", city: "Vail")
        expect(job).to be_invalid
      end

      it "is invalid without a city" do
        job = Job.new(title: "Developer", description: "Wahoo", level_of_interest: 80)
        expect(job).to be_invalid
      end
    end

    context "valid attributes" do
      it "is valid with a title, level of interest, and company" do
        company = Company.new(name: "Turing")
        job = Job.new(title: "Developer", level_of_interest: 40, city: "Vail", company: company)
        expect(job).to be_valid
      end
    end
  end

  describe "relationships" do
    it "belongs to a company" do
      job = Job.new(title: "Sales", level_of_interest: 70, description: "good")
      expect(job).to respond_to(:company)
    end
    it "belongs to a category" do
      job = Job.new(title: "Sales", level_of_interest: 70, description: "good")
      expect(job).to respond_to(:category)
    end
    it "has many comments" do
      job = Job.new(title: "Sales", level_of_interest: 70, description: "good")
      expect(job).to respond_to(:comments)
    end
  end

  describe "class methods" do
    it "location metho" do 
     company = create(:company)
      Job.create!(title: "Sales", city: "Vail", level_of_interest: 3, description: "good", company: company)
      Job.create(title: "Sales", city: "Seattle", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 54, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 9, description: "good", company: company)
      Job.create(title: "Sales", city: "Durango", level_of_interest: 14, description: "good", company: company)
      
      expect(Job.location.first.city).to eq('Vail')
      expect(Job.location.last.city).to eq('Aspen')
    end
    it "level of interest method" do 
      company = create(:company)
      Job.create!(title: "Sales", city: "Vail", level_of_interest: 3, description: "good", company: company)
      Job.create(title: "Sales", city: "Seattle", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 54, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 9, description: "good", company: company)
      Job.create(title: "Sales", city: "Durango", level_of_interest: 14, description: "good", company: company)

      expect(Job.level_of_interest.first.level_of_interest).to eq(54)
      expect(Job.level_of_interest.last.level_of_interest).to eq(1)
    end
    it "city method" do 
      company = create(:company)
      Job.create!(title: "Sales", city: "Vail", level_of_interest: 3, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 54, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 9, description: "good", company: company)
      Job.create(title: "Sales", city: "Durango", level_of_interest: 14, description: "good", company: company)

      expect(Job.city("aspen").first.city).to eq("Aspen")
      expect(Job.city("aspen").last.city).to eq("Aspen")
      expect(Job.city("aspen").length).to eq(2)
    end
    it "count_by_interest_level method" do 
      company = create(:company)
      Job.create!(title: "Sales", city: "Vail", level_of_interest: 3, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 3, description: "good", company: company)
      Job.create(title: "Sales", city: "Durango", level_of_interest: 3, description: "good", company: company)

      expect(Job.count_by_interest_level.class).to eq(Hash)
      expect(Job.count_by_interest_level.keys.count).to eq(2)
      expect(Job.count_by_interest_level).to eq({1=>2, 3=>3})
    end
    it "count_by_locationt method" do 
      company = create(:company)
      Job.create!(title: "Sales", city: "Denver", level_of_interest: 3, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 1, description: "good", company: company)
      Job.create(title: "Sales", city: "Aspen", level_of_interest: 3, description: "good", company: company)
      Job.create(title: "Sales", city: "Denver", level_of_interest: 3, description: "good", company: company)

      expect(Job.count_by_location.class).to eq(Hash)
      expect(Job.count_by_location.keys.count).to eq(2)
      expect(Job.count_by_location).to eq({"Aspen"=>2, "Denver"=>3})
    end
  end
end
