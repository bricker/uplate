Feature: Clips
	In order to show clips of the show
	An Up Late Admin
	Should be able to manage clips
	
	Background:
		Given all content has been filled out
		And I have logged in
	
		Scenario: View Empty Clip List
			Given 0 clips
			When I go to the clips page
			Then I should be notified that there are no items to list

		Scenario: View Populated Clip List
			Given 5 clips
			When I go to the clips page
			Then I should see 3 clips listed
			And there should be pagination

		Scenario: Show admin links when logged in
			Given 2 clips
			When I go to the clips page
			Then I should see edit links
			When I go to edit a clip
			Then I should see a delete link

		Scenario: Hide admin links if not logged in
			Given I am logged out
			And 2 clips
			When I go to the clips page
			Then I shouldn't see any admin links

		Scenario: Block out unauthorized users from management pages
			Given I am logged out
			And 2 clips
			When I go to the new clip page
			Then I should be denied access
			When I go to edit a clip
			Then I should be denied access

		Scenario: Add invalid clip
			When I go to the new clip page
			And I submit a blank clip form
			Then I should be notified of validation errors

		Scenario: Add a valid clip
			When I add a valid clip
			Then I should see a success message
			And I should see 1 clip listed

		Scenario: Edit an invalid clip
			Given 1 clip
			When I change that clip's information to something invalid
			Then I should be notified of validation errors
			And the change should not show on the clips page

		Scenario: Edit a clip
			Given 1 clip
			When I change that clip's information to something valid
			Then I should see a success message
			And the changes should show on the clips page

		Scenario: Destroy a clip
			Given 2 clips
			When I delete the first clip
			Then I should see a success message
			And I should see 1 clip listed