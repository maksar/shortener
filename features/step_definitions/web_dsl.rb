When(/^I am on (.*)$/) do |page|
  visit case page
    when "Main Page"
      root_url
    else
      raise "Unknown page"
    end
end

Then(/^I should be able to enter URL for shortening$/) do
  expect(page).to have_selector "form input[name='permalink[url]']"
end

When(/^I provided "(.*?)" URL for shortening$/) do |url|
  @url = url
  fill_in "Url", with: url
  click_on "Create"
end

Then(/^I should be redirected to short URL$/) do
  current_path.should == permalink_path(Permalink.for_url(@url))
end
