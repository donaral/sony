Feature: Sony Website search functionality
  In order to find products on Sony website
  I need to be able to perform search

  Scenario Outline: Search is performed and results are displayed correctly
    Given I visit main page
    And I search for <term>
    Then Results should contain term <term>
  Examples:
    |term|
    |camera|
    |televisions|
    |mirrorless camera|

  Scenario Outline: Search results for an item with picture
    Given I visit main page
    When I search for <term>
    Then Picture thumbnail is visible for first result
  Examples:
  |term|
  |HX80 Compact Camera with 30x Optical Zoom|
  |Remote Control Tripod|

Scenario Outline: Search string doesn't match any items
  Given I visit main page
  When I search for <term>
  Then There should be no results to display
  Examples:
    |term|
    |Duygu|
    |     |

  Scenario: Search for an item with lots of results and can view more results and refine them
  Given I visit main page
  When I search for "camera"
  And 20 results are displayed on page
  Then I can view more results
  And I can refine search by category


  Scenario: Search displays correct number of returns
  Given I visit main page
  When I search for "camera"
  Then Page displays correct number of results
#validate search result count from the DB


