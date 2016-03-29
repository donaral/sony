Feature: Sony Website search functionality
  In order to find products on Sony website
  I need to be able to perform search

  @search
  Scenario Outline: Search is performed and results are displayed correctly
    Given I visit main page
    And I search for <term>
    Then Results should contain term <term>
  Examples:
    |term|
    |camera|
    |televisions|
    |mirrorless camera|

  @search
  Scenario Outline: Search results for an item with picture
    Given I visit main page
    When I search for <term>
    Then Picture thumbnail is visible for first result
  Examples:
  |term|
  |HX80 Compact Camera with 30x Optical Zoom|
  |Remote Control Tripod|

  @search
Scenario Outline: Search string doesn't match any items
  Given I visit main page
  When I search for <term>
  Then There should be no results to display
  Examples:
    |term|
    |Duygu|
    |     |

  @search
  Scenario: Search for an item with lots of results and can view more results and refine them
  Given I visit main page
  When I search for "camera"
  And 20 results are displayed on page
  Then I can view more results
  And I can refine search by category


