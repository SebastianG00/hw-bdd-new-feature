Feature: Destroy a Movie
  As a user
  I want to be able to delete a movie from the database

  Background: movies in database
    Given the following movies exist:
      | title        | rating | director       | release_date |
      | Star Wars    | PG     | George Lucas   | 1977-05-25   |
      | Blade Runner | PG     | Ridley Scott   | 1982-06-25   |
      | Alien        | R      |                | 1979-05-25   |
      | THX-1138     | R      | George Lucas   | 1971-03-11   |

  Scenario: Delete an existing movie
    Given I am on the details page for "Star Wars"
    When I follow "Delete"
    Then I should not see "Star Wars"