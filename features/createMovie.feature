Feature: Create a Movie
  As a user
  I want to be able to add a new movie to the database

   Background: movies in database
    Given the following movies exist:
      | title        | rating | director       | release_date |
      | Star Wars    | PG     | George Lucas   | 1977-05-25   |
      | Blade Runner | PG     | Ridley Scott   | 1982-06-25   |
      | Alien        | R      |                | 1979-05-25   |
      | THX-1138     | R      | George Lucas   | 1971-03-11   |

    Scenario: Create a movie with valid inputs
    Given I am on the home page
    When I follow "Add new movie"
    And I fill in "Title" with "Back To The Future"
    And I select "PG" from "Rating"
    And I fill in "Director" with "Robert Zemeckis"
    And I press "Save Changes"
    Then I should be on the home page
    And I should see "Back To The Future"