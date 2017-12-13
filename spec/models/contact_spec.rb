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
end