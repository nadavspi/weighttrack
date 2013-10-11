Given(/^I have existing weights$/) do
  @current_user.weights.create(value: 154, date: 2.days.ago.strftime("%m/%d/%Y"))
  @current_user.weights.create(value: 156, date: 1.days.ago.strftime("%m/%d/%Y"))
  @current_user.weights.create(value: 155, date: Time.now.strftime("%m/%d/%Y"))
end

When(/^I visit the weights index page$/) do
  visit weights_path
end

Then(/^I will see all of my existing weights$/) do
  page.should have_content("154")
  page.should have_content("156")
  page.should have_content("155")
end


Given(/^I enter a valid weight$/) do
  pending # express the regexp above with the code you wish you had
end