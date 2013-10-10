Feature: Main Page
  In order to use a shortener
  As a website visitor
  I want to view Main Page

Scenario: visiting Main Page
  When I am on Main Page
  Then I should be able to enter URL for shortening

Scenario: shortening the URL
  When I am on Main Page
  And I provided "http://test" URL for shortening
  Then I should be redirected to short URL

