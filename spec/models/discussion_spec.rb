require 'rails_helper'

RSpec.describe Discussion, type: :model do

  before do 
    @discussion = Discussion.create!(title: "Talk of Rails", 
                                      description: "This is where you can talk Rails!")
  end

  it "should validate a correct discussion" do 
    expect(@discussion).to be_valid
  end

  it "should require a valid title" do 
    @discussion.title = ""
    expect(@discussion).to be_invalid

    @discussion.title = "X"
    expect(@discussion).to be_invalid      
  end

  it "should require a valid description" do 
    @discussion.description = ""
    expect(@discussion).to be_invalid

    @discussion.description = "too short"
    expect(@discussion).to be_invalid
  end
end