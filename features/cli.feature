Feature: Saving a token for use with typekit APIs
  In order to be able to make use of all the features of typekit's APIs
  As a user of typekitter
  I want to be able to save my typekit token value to the filesystem

  Background:
    Given no prior token has been saved to the filesystem

  Scenario: User saves a token
    Given I run `bundle exec typekitter save_token test1234`
      Then the output should contain "typekit token saved successfully"
