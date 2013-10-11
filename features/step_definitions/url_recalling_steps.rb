When(/^I have shortened "(.*?)" URL$/) do |url|
  @url = url

  @permalink = PermalinkRepo.instance.register url
  @count = @permalink.count
end

When(/^I am navigating to to it$/) do
  visit permalink_path(@permalink.short)
end

When(/^I am navigating to extended version$/) do
  visit permalink_path(@permalink.to_param)
end
Then(/^I should be redirected to "(.*?)"$/) do |url|
  current_url.should == url
end

Then(/^permalink usages count should be increased$/) do
  @permalink = PermalinkRepo.instance.recall @permalink.short
  @permalink.count.should == @count + 1
end