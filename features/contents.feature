Feature: Contents
	In order to update information around the site
	An Up Late Admin
	Should be able to manage contents
	
Background:
	Given all content has been filled out
	And I have logged in

Scenario: Show Contents
	When I go to the home page
	Then there should be the home page content
	When I go to the tickets page
	Then there should be the tickets content

Scenario: Block unauthorized users from editing contents
	Given I am logged out
	When I go to the edit contents page
	Then I should be denied access
	
Scenario: List Content for admins
	When I go to the edit contents page
	Then I should see a list of contents that can be edited
	And there should be 1 form
	
Scenario: Edit contents
	When I go to the edit contents page
	And I change some information for each content
	And I submit the form
	Then I should be on the home page
	And those changes should show on the page
	When I go to the tickets page
	Then those changes should show on the page