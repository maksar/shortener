Feature: URL recalling
  In order to use a permalink
  As a website visitor
  I want to submit an permaling
  And gets redirected to the correct site

Scenario: recalling permalink
  When I have shortened "http://google.com/" URL
  And I am navigating to to it
  Then I should be redirected to "http://google.com/"
  And permalink usages count should be increased

Scenario: displaying permalink details
  When I have shortened "http://google.com/" URL
  And I am navigating to extended version
  Then I should be redirected to permalink details
