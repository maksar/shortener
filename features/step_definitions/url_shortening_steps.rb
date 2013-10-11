When(/^I provided "(.*?)" URL for shortening$/) do |url|
  @url = url

  visit root_url
  fill_in "Url", with: url
  click_on "Create"
end

Then(/^I should be redirected to permalink details$/) do
  @permalink = PermalinkRepo.instance.recall current_path.gsub(/#{permalink_path("")}/, '').gsub(/#{Regexp.quote(ENV["EXTRA_SUMBOL"])}$/, '')
  @permalink.url.should == @url
end