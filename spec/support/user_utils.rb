module RailsTutorialApp
  module Spec
    module UserUtils

      def get_test_user(email = nil, name = nil)
        options = {}
        options[:email] = email unless email.nil?
        options[:name] = name unless name.nil?
        FactoryGirl.create(:user, options)
      end

      def sign_in(user, options = {})
        if options[:no_capybara]
          # Sign in when not using Capybara.
          remember_token = User.new_remember_token
          cookies[:remember_token] = remember_token
          user.update_attribute(:remember_token, User.encrypt(remember_token))
        else
          visit signin_path
          valid_signin(user)
        end
      end

      def valid_signin(user)
        fill_in "Email", with: user.email
        fill_in "Password", with: user.password
        click_button "Sign in"
      end

      def valid_signup
        fill_in "Name", with: "Example User"
        fill_in "Email", with: "user@example.com"
        fill_in "Password", with: "foobar"
        fill_in "Confirm Password", with: "foobar"
      end

      def valid_edit(name, email, user)
        fill_in "Name", with: name
        fill_in "Email", with: email
        fill_in "Password", with: user.password
        fill_in "Confirm Password", with: user.password
        click_button "Save changes"
      end

    end
  end
end
