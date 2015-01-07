Feature: As a user I want to send emails through a web form

  Scenario: Visiting the home page
  Given I am on the index page
  Then I can see a welcome message

  Scenario: Sending an email successfully
  Given I am on the index page
  When I fill out all of the email fields
  And I press 'Submit'
  Then should see a confirmation message

  Scenario: Sending email unsuccessfully
  Given I am on the index page
  When I fill out three of the email fields
  And I press 'Submit'
  Then I should see an error message

  Scenario: Sending email to multiple recipients
  Given I am on the index page
  When I fill out all fields and multiple recipients
  And I press 'Submit'
  Then should see a confirmation message

  Scenario: Previewing an email
  Given I am on the confirmation page
  Then I should see the body of my message in HTML

  Scenario: Confirming and sending an email
  Given I am on the confirmation page
  When I press 'Send'
  Then I should see the message, 'Email successfully sent!'