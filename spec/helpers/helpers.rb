module Helpers

  # FEATURE TESTS
    def create_discussion(title: "Questions", description: "Questions on discussions.")
      visit '/'
      click_link 'New'
      fill_in "Title", with: title
      fill_in "Description", with: description
      click_button "Create"
    end

end