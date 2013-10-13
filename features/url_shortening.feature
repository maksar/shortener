Feature: URL shortening
  In order to create a permalink
  As a website visitor
  I want to submit an URL
  And view permalink details page for it

Scenario: shortening the URL
  When I provided "http://test/" URL for shortening
  Then I should be redirected to permalink details

Scenario: shortening nothing
  When I provided "" URL for shortening
  Then I should be notified about error about URL

Scenario: shortening the URL with occupied desired hash
  When "abcd" hash is already occupied
  When I provided "http://test/" URL and "abcd" as desired hash
  Then I should be notified about error about Hash

Scenario: shortening the URL with available desired hash
  When I provided "http://test/" URL and not used hash as desired one
  Then I should be redirected to permalink details
