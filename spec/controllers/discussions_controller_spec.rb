require 'rails_helper'

RSpec.describe DiscussionsController, type: :controller do

  let!(:discussion) do 
    Discussion.create!(title: "General Q&A", 
                        description: "Your general questions, answered.  Ask away!" ) 
  end

  describe "Routing & Rendering" do 

    it "has a working index" do 
      get :index
      expect(response).to be_success
      expect(get: "discussions").to route_to(
        controller: "discussions",
        action: "index"
      )
      expect(response).to render_template('index')
    end

    it "has a new page" do
      get :new
      expect(response).to be_success
      expect(get: "discussions/new").to route_to(
        controller: "discussions",
        action: "new"
      )
      expect(response).to render_template('new')
    end

    it "has an edit page" do 
      get :edit, id: discussion.id
      expect(response).to be_success
      expect(edit: "discussions/1/edit").to route_to(
        controller: "discussions",
        action: "edit",
        id: "1"
        )
      expect(response).to render_template("edit")
    end

    it "has a show page" do 
      get :show, id: discussion.id
      expect(response).to be_success
      expect(show: "discussions/1/").to route_to(
        controller: "discussions",
        action: "show",
        id: "1"
        )
      expect(response).to render_template("show")
    end

    it "should route to update" do 
      expect(put: "discussions/1/").to route_to(
        controller: "discussions",
        action: "update",
        id: "1"
        )
    end

    it "should route to delete" do 
      expect(delete: "discussions/1/").to route_to(
        controller: "discussions",
        action: "destroy",
        id: "1"
        )
    end

  end
end
