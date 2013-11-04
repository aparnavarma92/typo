Feature: Merge Articles
  As a blog administrator
  In order to group similar articles together
  I want to be able to merge them

  Background:
    Given the following articles exist:
      | title       |
      | Hello World |
      | Foobar      |

  Scenario: admin can merge
    When I am on the edit page for "Hello World"
    And the current user is "admin"
    Then I should see "Merge With This Article"

  Scenario: user cannot merge
    When I am on the edit page for "Hello World"
    And the current user is not "admin"
    Then I should not see "Merge With This Article"

  Scenario: see text from both articles
    When I am on the edit page for "Hello World"
    And the current user is "admin"
    When I fill in article id with 1
    When I press "Merge"
    Then I should be on the edit page for "Hello World"
    Then I should see "Hello World" text and "Foobar" text
    Then I should see "Hello World" comments and "Foobar" comments
    Then I should see "Hello World" 
    Then I should not see "Foobar"


