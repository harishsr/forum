require 'rails_helper'

RSpec.feature "Discussions", type: :feature do
  before do 
    visit '/'
    discussion_variables
  end

  describe "CRUD" do 
    it "creates & shows a discussion" do 
      expect(page).to have_link "New"
      click_link "New"
      expect(page).to have_content "Create a new discussion" 
      expect(page).to have_button "Create"

      fill_in "Title",        with: @title
      fill_in "Description",  with: @description
      click_button "Create"

      expect(page).to have_content @title
      expect(page).to have_content @description
    end

    it "creates & shows multiple discussions" do 
      create_discussion(title: @title,     description: @description)
      create_discussion(title: @new_title, description: @new_description)
      visit '/'

      expect(page).to have_content @title
      expect(page).to have_content @description
      expect(page).to have_content @new_title
      expect(page).to have_content @new_description
    end

    it "edits a discussion" do 
      create_discussion
      expect(page).to have_link "Edit"

      click_link "Edit"
      fill_in "Title", with: @new_title
      fill_in "Description", with: @new_description
      click_button "Update"

      expect(page).to_not have_content @title
      expect(page).to_not have_content @description
      expect(page).to have_content @new_title
      expect(page).to have_content @new_description
    end

    it "deletes a discussion" do 
      create_discussion
      expect(page).to have_link "Delete"

      click_link "Delete"
      expect(page).to_not have_content @title
    end

    it "displays discussions on the index" do 
      create_discussion
      create_discussion title: @new_title, description: @new_description
      visit '/'

      expect(page).to have_content @title
      expect(page).to have_content @description
      expect(page).to have_content @new_title
      expect(page).to have_content @new_description
    end
  end

  describe "Layout" do 
    it "has a working nav pane" do 
      expect(page).to have_css ".nav" 
      expect(page).to have_link "Home"
      expect(page).to have_link "New forum"
    end
  end

  describe "Editing by Admins" do 

  end

end
