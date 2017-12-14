require 'rails_helper'

describe "contact validations" do 
  it "is invalid without a name" do

  contact = Contact.create(position: "CTO", email: "T@aol.com" )

  expect(contact).to be_invalid
  end

  it "is invalid without a position" do 

    contact = Contact.create(name: "Timo", email: "T@gmail.com")

    expect(contact).to be_invalid
  end

   it "is invalid without a email" do 

    contact = Contact.create(name: "Timo", position: "CEO")

    expect(contact).to be_invalid
   end

   context "valid attributes"
   it "is valid with all attributes" do
    company = create(:company)
    contact = Contact.create(name: "Timo", position: "CEO", email: "yamomma@aol.com", company: company)

    expect(contact).to be_valid
   end
end

describe "relationship with company" do
  it "belongs to company" do 

    contact = Contact.create(name: "Timo", position: "CEO", email: "yamomma@aol.com")
    expect(contact).to respond_to(:company)    
  end
end