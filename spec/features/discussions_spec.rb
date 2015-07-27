require 'rails_helper'

RSpec.feature "Discussions", type: :feature do
  before do 
    visit '/'
    @title = "Questions"
    @description = "Questions on discussions."

    @new_title = "Fitness"
    @new_description = "Fitness problems and answers."
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
      expect(page).to have_content "Choose your Forum"
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
    it "has a navigation pane" do 
      expect(page).to have_css ".nav" 
      expect(page).to have_link "Home"
      expect(page).to have_link "New forum"
    end
  end

end
