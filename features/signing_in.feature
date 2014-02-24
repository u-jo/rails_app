Feature: Signing in
	Scenario: Unsuccessful signin
	Given /^a user visits the signin page$/ do
		visit signin_path
	end

	When /^they submit invalid signin information$/ do
		click_button "Sign in"
	end

	Then /^they should see an error message$/ do
		expect(page).to have_selector('div.alert.alert-error')
	end

	Scenario: Successful signin
	Given a user visits the signin page
	And the user has an account
	When the user submits valid signin information
	Then they should see their profile page
	And they should see a signout link