require 'cucumber/rails'

ActionController::Base.allow_rescue = false

World(Rails.application.routes.url_helpers)

World(Capybara::UserAgent::DSL)

Browser.all.each do |browser|
  Capybara::UserAgent.add_user_agents(browser.name => browser.name)
end