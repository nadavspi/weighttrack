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



Given(/^I visit the new weight page$/) do
  visit new_weight_path
end

Given(/^I enter a valid weight$/) do
  fill_in "Weight", with: 155.55
end

Given(/^I enter an invalid weight$/) do
  fill_in "Weight", with: 1000
end

When(/^I press submit$/) do
  click_button "Submit"
end

Then(/^the weight will be added$/) do
  page.should have_content("155.55")
end

Then(/^the weight will not be added$/) do
  page.should_not have_content("1000")
end

Then(/^I will see an error message$/) do
  pending # express the regexp above with the code you wish you had
end