Given /^(\d+) photos?$/ do |num|
  @photos = FactoryGirl.create_list(:photo, num.to_i)
end

When /^I go to the photos page$/ do
  visit photos_path
end

Then /^I should see (\d+) photos? listed$/ do |num|
  page.should have_css ".photo", count: num.to_i
end

When /^I go to edit a photo$/ do
  visit edit_photo_path(@photos.first)
end

When /^I go to the new photo page$/ do
  visit new_photo_path
end

When /^I submit a blank photo form$/ do
  fill_in "photo_caption", with: ""
  find("input[type=submit]").click
end

When /^I add a valid photo$/ do
  visit new_photo_path
  fill_in "photo_caption", with: "This is a photo"
  attach_file(:photo_asset, File.join(Rails.root, 'features', 'support', 'test-upload.jpg'))
  find("input[type=submit]").click
end

When /^I change that photo's information to something valid$/ do
  visit edit_photo_path(@photos.first)
  fill_in "photo_caption", with: "Edited photo caption"
  find("input[type=submit]").click
end

Then /^the changes should show on the photos page$/ do
  visit photos_path
  page.should have_content "Edited photo caption"
end

When /^I delete the first photo$/ do
  visit photos_path
  first(".edit-link").click
  find(".delete-link").click
end

When /^I attach a file type that is not supported$/ do
  visit new_photo_path
  attach_file(:photo_asset, File.join(Rails.root, 'features', 'support', 'test-upload.pdf'))
  find("input[type=submit]").click
end