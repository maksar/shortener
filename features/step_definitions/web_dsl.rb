When(/^I am on (.*)$/) do |page|
  visit case page
    when "Main Page"
      root_url
    else
      raise "Unknown page"
    end
end

Then(/^I should be able to enter URL for shortening$/) do
  expect(page).to have_selector "input[name=url]"
end