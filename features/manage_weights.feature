Feature: Managing weights
  In order to use the weight track app
  As a user
  I want to be able to create, read, update, and delete weights

Background:
  Given I am logged in as a user

Scenario: View existing weights
  Given I have existing weights
  When I visit the weights index page
  Then I will see all of my existing weights

Scenario: Edit an existing weight
  Given I have an existing weight
  When I visit the weight edit page for it
  And I change the weight value
  When I press submit
  Then the weight will be changed

Scenario: Delete an existing weight
  Given I have an existing weight
  When I visit the weights index page
  And I click the delete button for my weight
  Then the weight will be deleted

Scenario: Add a valid weight
  Given I visit the weights index page
  And I enter a weight of 156
  When I press submit
  Then the weight will be added

Scenario: Add an invalid weight
  Given I visit the weights index page
  And I enter a weight of 1000
  When I press submit
  Then the weight will not be added
  And I will see an error message


