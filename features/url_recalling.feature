Feature: URL recalling
  In order to use a permalink
  As a website visitor
  I want to submit an permalink
  And gets redirected to the correct site

Scenario: recalling permalink
  When I have shortened "http://google.com/" URL
  And I am navigating to to it with "Firefox"
  Then I should be redirected to "http://google.com/"
  And permalink usages count for "Firefox" should be 1

Scenario: recalling not registered permalink
  When I have no shortened permalink
  And I am navigating to to it with "Internet Explorer"
  Then I should be redirected to main page
  And I should be notified about absence of Hash

