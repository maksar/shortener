When(/^I provided "(.*?)" URL for shortening$/) do |url|
  @url = url

  visit root_url
  fill_in "Url", with: url
  click_on "Create"
end

Then(/^I should be redirected to permalink details$/) do
  @permalink = PermalinkRepo.instance.recall PermalinkParam.new(current_path.gsub(/#{permalink_path("")}/, '')).pure
  @permalink.url.should == @url
end

When(/^"(.*?)" hash is already occupied$/) do |short|
  PermalinkRepo.instance.register('http://test', short)
end

When(/^I provided "(.*?)" URL and "(.*?)" as desired hash$/) do |url, short|
  @url = url

  visit root_url
  fill_in "Url", with: url
  fill_in "Short", with: short
  click_on "Create"
end

When(/^I provided "(.*?)" URL and not used hash as desired one$/) do |url|
  available_hash = PermalinkRepo.instance.register('http://test').short + '1'
  step("I provided \"#{url}\" URL and \"#{available_hash}\" as desired hash")
end

Then(/^I should be notified about error about URL$/) do
  page.should have_content I18n.t("activemodel.errors.models.permalink.attributes.url.blank")
end

Then(/^I should be notified about error about Hash$/) do
  page.should have_content I18n.t("activemodel.errors.models.permalink.attributes.short.used")
end