When(/^I have no shortened permalink$/) do
  @permalink = PermalinkRepo.instance.register 'test'
  @permalink.short = @permalink.short + 'more'
end

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

Then(/^I should be redirected to main page$/) do
  current_path.should == root_path
end

Then(/^I should be notified about absence of Hash$/) do
  page.should have_content I18n.t("permalink.not_found")
end