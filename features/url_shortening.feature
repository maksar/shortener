Feature: URL shortening
  In order to create a permalink
  As a website visitor
  I want to submit an URL
  And view permalink details page for it

Scenario: shortening the URL
  When I provided "http://test/" URL for shortening
  Then I should be redirected to permalink details
