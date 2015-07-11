require 'rails_helper'

RSpec.describe DiscussionsController, type: :controller do

  # let!(:discussion) { Discussion.create!( ) }

  # The routing 'expects' can be consolidated into a helper & a method

  it "has a working index" do 
    get :index
    expect(response).to be_success
    expect(:get => "discussions").to route_to(
      :controller => "discussions",
      :action => "index"
    )
    expect(response).to render_template('index')
  end

  it "has a new page" do
    get :new
    expect(response).to be_success
    expect(:get => "discussions/new").to route_to(
      :controller => "discussions",
      :action => "new"
    )
    expect(response).to render_template('new')
  end

  
end
