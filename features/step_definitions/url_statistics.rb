When(/^I am navigating to extended version$/) do
  visit permalink_path(@permalink.to_param)
end

When(/^permalink was used by$/) do |table|
  table.rows.each do |browser, times|
    set_user_agent(browser)
    times.to_i.times do
      visit permalink_path(@permalink.short)
    end
  end
end

Then(/^I should see usage statistics$/) do |table|
  table.rows.each do |browser, times|
    page.should have_content "#{browser}: #{times} time"
  end
end
