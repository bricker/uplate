Then /^I should see a success message$/ do
  page.should have_css "#flash .notice"
end

Then /^I should see an error message$/ do
  page.should have_css "#flash .alert"
end

Then /^I should be redirected to the home page$/ do
  current_path.should eq root_path
end

Then /^I should be on the home page$/ do
  current_path.should eq root_path
end

Then /^show me the page$/ do
  save_and_open_page
end

Then /^I should be notified that there are no items to list$/ do
  page.should have_css ".empty-list"
end

Then /^I should be notified of (\d+) validation errors?$/ do |num|
  page.should have_css("#error_explanation li", count: num.to_i)
end

Then /^I should be notified of validation errors$/ do
  page.should have_css("#error_explanation")
end

Then /^I should see a delete link$/ do
  page.should have_css ".delete-link"
end

Then /^I should see (?:an )?edit links?$/ do
  page.should have_css ".edit-link"
end

Then /^I shouldn't see any? edit links?$/ do
  page.should_not have_css ".edit-link"
end

Then /^I should see a create link$/ do
  page.should have_css ".create-link"
end

Then /^I shouldn't see a create link$/ do
  page.should_not have_css ".create-link"
end

Then /^I shouldn't see any admin links$/ do
  page.should_not have_css ".edit-link"
  page.should_not have_css ".create-link"
  page.should_not have_css ".delete-link"
end

When /^I go to the home page$/ do
  visit root_path
end

Then /^I should see the admin bar$/ do
  page.should have_css ".admin"
end

Then /^I should not see the admin bar$/ do
  page.should_not have_css ".admin"
end

Then /^there should be (\d+) form$/ do |num|
  page.should have_css "form", count: num.to_i
end

When /^I submit the form$/ do
  find("input[type=submit]").click
end
