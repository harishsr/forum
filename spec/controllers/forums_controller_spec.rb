require 'rails_helper'

RSpec.describe ForumsController, type: :controller do

  # let!(:forum) { Forum.create!( ) }

  it "has a working index" do 
    get :index
    expect(response).to be_success
    expect(:get => "forums").to route_to(
      :controller => "forums",
      :action => "index"
    )
    expect(response).to render_template('index')
  end

  it "has a new page" do
    get :new
    expect(response).to be_success
    expect(:get => "forums/new").to route_to(
      :controller => "forums",
      :action => "new"
    )
    expect(response).to render_template('new')
  end

  
end
