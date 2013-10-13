Feature: URL statistics
  In order to see a permalink statistics
  As a permalink creator
  I want view statistics on permalink details page

Scenario: displaying permalink details
  When I have shortened "http://google.com/" URL
  And permalink was used by
    | Firefox | 2     |
    | Chrome  | 3     |
    | Safari  | 1     |
    | Opera   | 1     |
    | lynx    | 2     |
  And I am navigating to extended version
  Then I should be redirected to permalink details
  And I should see usage statistics
    | Firefox           | 2 |
    | Chrome            | 3 |
    | Safari            | 1 |
    | Opera             | 1 |
    | Internet Explorer | 0 |
    | Other             | 2 |
