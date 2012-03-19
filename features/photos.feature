Feature: Photos
	In order to show photos of the show
	An Up Late Admin
	Should be able to manage photos
	
	Background:
		Given all content has been filled out
		And I have logged in
	
		Scenario: View Empty Photo List
			Given 0 photos
			When I go to the photos page
			Then I should be notified that there are no items to list

		Scenario: View Populated Photo List
			Given 5 photos
			When I go to the photos page
			Then I should see 5 photos listed

		Scenario: Show admin links when logged in
			Given 2 photos
			When I go to the photos page
			Then I should see edit links
			When I go to edit a photo
			Then I should see a delete link

		Scenario: Hide admin links if not logged in
			Given I am logged out
			And 2 photos
			When I go to the photos page
			Then I shouldn't see any admin links

		Scenario: Block out unauthorized users from management pages
			Given I am logged out
			And 2 photos
			When I go to the new photo page
			Then I should be denied access
			When I go to edit a photo
			Then I should be denied access

		Scenario: Add invalid photo
			When I go to the new photo page
			And I submit a blank photo form
			Then I should be notified of validation errors
		
		Scenario: Add invalid attachment
			When I go to the new photo page
			And I attach a file type that is not supported
			Then I should be notified of validation errors

		Scenario: Add a valid photo
			When I add a valid photo
			Then I should see a success message
			And I should see 1 photo listed

		Scenario: Edit a photo
			Given 1 photo
			When I change that photo's information to something valid
			Then I should see a success message
			And the changes should show on the photos page

		Scenario: Destroy a photo
			Given 2 photos
			When I delete the first photo
			Then I should see a success message
			And I should see 1 photo listed