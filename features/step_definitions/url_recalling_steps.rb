When(/^I have shortened "(.*?)" URL$/) do |url|
  @url = url

  @permalink = PermalinkRepo.instance.register url
end

When(/^I am navigating to to it with "(.*)"$/) do |browser|
  set_user_agent(browser)
  visit permalink_path(@permalink.short)
end

Then(/^I should be redirected to "(.*?)"$/) do |url|
  current_url.should == url
end

Then(/^permalink usages count for "(.*)" should be (\d+)$/) do |browser, times|
  @permalink = PermalinkRepo.instance.recall @permalink.short

  @permalink.send(Browser.by_name(browser).abbreviation).should == times.to_i
end
