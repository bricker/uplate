Given /^all content has been filled out$/ do
  @contents = Content.create [
      { title: "promo_video_embed_code", content: "Promo video" },
      { title: "promo_header", content: "Promo Header" },
      { title: "promo_about", content: "About the next show" },
      { title: "tickets", content: "Ticketing information" }
    ]
end

Then /^there should be the home page content$/ do
  page.should have_content "Promo video"
  page.should have_content "Promo Header"
  page.should have_content "About the next show"
end

When /^I go to the tickets page$/ do
  visit tickets_path
end

Then /^there should be the tickets content$/ do
  page.should have_content "Ticketing information"
end

When /^I go to the edit contents page$/ do
  visit edit_contents_path
end

When /^I change some information for each content$/ do
  Content.all.each do |content|
    fill_in "contents_#{content.id}_content", with: "New content for #{content.title}"
  end
end

Then /^I should see a list of contents that can be edited$/ do
  page.should have_css 'form .content-fields', count: Content.count
end

Then /^I should be on the edit contents page$/ do
  current_path.should eq edit_contents_path
end

Then /^those changes should show on the page$/ do
  page.should have_content "New content for"
end