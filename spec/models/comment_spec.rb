require 'rails_helper'

describe "comment relationship" do
  it "belongs to job" do 
    comment = Comment.new

    expect(comment).to respond_to(:job)
  end
end