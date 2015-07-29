module Helpers

  # FEATURE TESTS
    def create_discussion(title: "Questions", description: "Questions on discussions.")
      visit '/'
      click_link 'New'
      fill_in "Title", with: title
      fill_in "Description", with: description
      click_button "Create"
    end

    def discussion_variables
      # First set
      @title            = "Questions"
      @description      = "Questions on discussions."
      # Duplicate set
      @new_title        = "Fitness"
      @new_description  = "Fitness problems and answers."
    end

    def user_variables
      # First set
      @email            = "testing@email.com"
      @password         = "password"
      @users_name       = "Philip J. Fry"
      # Duplicate set
      @new_email        = "testingnew@email.com"
      @new_password     = "newpassword"
      @new_users_name   = "Bender Bending Rodriguez"
    end

end