Given(/^I am logged in as a user$/) do
  @current_user = User.create(email: "generic@user.com", password: "generic")
  visit sign_in_path
  fill_in "Email", with: "generic@user.com"
  fill_in "Password", with: "generic"
  click_button "Sign in"
end