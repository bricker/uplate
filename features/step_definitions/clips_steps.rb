Given /^(\d+) clips?$/ do |num|
  @clips = FactoryGirl.create_list(:clip, num.to_i)
end

When /^I go to the clips page$/ do
  visit clips_path
end

Then /^I should see (\d+) clips? listed$/ do |num|
  page.should have_css ".clip", count: num.to_i
end

Then /^there should be pagination$/ do
  page.should have_css "nav.pagination"
  page.should have_css ".pagination .page", count: 2
end

When /^I go to edit a clip$/ do
  visit edit_clip_path(@clips.first)
end

When /^I go to the new clip page$/ do
  visit new_clip_path
end

When /^I submit a blank clip form$/ do
  fill_in "clip_title", with: ""
  fill_in "clip_video_embed_code", with: ""
  fill_in "clip_description", with: ""
  find("input[type=submit]").click
end

When /^I add a valid clip$/ do
  visit new_clip_path
  fill_in "clip_title", with: "Clip"
  fill_in "clip_video_embed_code", with: "some embed code"
  fill_in "clip_description", with: "This is a clip"
  find("input[type=submit]").click
end

When /^I change that clip's information to something invalid$/ do
  @valid_clip = @clips.first
  visit edit_clip_path(@clips.first)
  fill_in "clip_video_embed_code", with: ""
  find("input[type=submit]").click
end

Then /^the change should not show on the clips page$/ do
  visit clips_path
  page.should have_content @valid_clip.video_embed_code
end

When /^I change that clip's information to something valid$/ do
  visit edit_clip_path(@clips.first)
  fill_in "clip_video_embed_code", with: "some edited embed code"
  find("input[type=submit]").click
end

Then /^the changes should show on the clips page$/ do
  visit clips_path
  page.should have_content "some edited embed code"
end

When /^I delete the first clip$/ do
  visit clips_path
  first(".edit-link").click
  find(".delete-link").click
end