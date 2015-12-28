require "rails_helper"

describe User, "sign in" do
  feature "sign in" do
    let!(:user) {FactoryGirl.create :user}

    scenario "Sign in as valid user." do
      visit "users/sign_in"
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Sign in"
      expect(page).to have_content "Signed in successfully."
    end

    scenario "Sign in with invalid email or password" do
      visit "/users/sign_in"
      fill_in "user_email", with: "mailtommrr@gmail.com"
      fill_in "user_password", with: "mahmud123"
      click_button "Sign in"
      expect(page).to have_content "Invalid email or password."
    end
  end
end