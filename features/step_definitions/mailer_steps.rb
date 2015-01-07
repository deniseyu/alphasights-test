Given(/^I am on the index page$/) do
  visit '/'
end

Then(/^I can see a welcome message$/) do
  expect(page).to have_content 'Hello!'
end

When(/^I fill out all of the email fields$/) do
  fill_in "Recipients", with: "recipient@test.com"
  fill_in "From", with: "sender@test.com"
  fill_in "Subject", with: "Hello"
  fill_in "Body", with: "##How are you"
end

When(/^I press 'Submit'$/) do
  click_button 'Submit'
end

Then(/^should see a confirmation message$/) do
  expect(page).to have_content 'Here is a preview of your email'
end

When(/^I fill out three of the email fields$/) do
  fill_in "Recipients", with: "recipient@test.com"
  fill_in "From", with: "sender@test.com"
  fill_in "Subject", with: "Hello"
end

Then(/^I should see an error message$/) do
  expect(page).to have_content 'Please fill out all fields'
end

When(/^I fill out all fields and multiple recipients$/) do
  fill_in "Recipients", with: "recipient@test.com, recipient2@test.com"
  fill_in "From", with: "sender@test.com"
  fill_in "Subject", with: "Hello"
  fill_in "Body", with: "How are you"
end

Given(/^I am on the confirmation page$/) do
  step "I am on the index page"
  step "I fill out all of the email fields"
  step "I press 'Submit'"
end

When(/^I press 'Send'$/) do
  click_button 'Send email'
end

Then(/^I should see the message, 'Email successfully sent!'$/) do
  expect(page).to have_content 'Email successfully sent'
end

Then(/^I should see the body of my message in HTML$/) do
  expect(page).to have_selector 'h2'
end

