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

Given(/^I enter a weight of (\d*.\d*)$/) do |value|
  @weight = value
  fill_in "weight[value]", with: value
end

When(/^I press submit$/) do
  click_button "Submit"
end

Then(/^the weight will be added$/) do
  page.should have_content(@weight)
end

Then(/^the weight will not be added$/) do
  page.should_not have_content(@weight)
end

Then(/^I will see an error message$/) do
  pending # express the regexp above with the code you wish you had
end

Given(/^I have an existing weight$/) do
  @weight = @current_user.weights.create(value: 154, date: 2.days.ago.strftime("%m/%d/%Y"))
end

When(/^I visit the weight edit page for it$/) do
  visit edit_weight_path(@weight)
end

When(/^I change the weight value$/) do
  fill_in "weight[value]", with: 130
end

Then(/^the weight will be changed$/) do
  page.should have_content("130")
end

When(/^I click the delete button for my weight$/) do
  click_link "delete"
end

Then(/^the weight will be deleted$/) do
  page.should_not have_content("154")
end

