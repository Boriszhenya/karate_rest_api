Feature: Testing a REST API for user endpoint
  Background:
    * url 'https://reqres.in/api'

  Scenario: Testing single user endpoint
    Given path '/users/1'
    When method get
    Then status 200
    And match $.data.first_name == "George"
    And match $..[?(@.id==1)].last_name == ["Bluth"]

  Scenario: Testing list user endpoint any contains
    Given path '/users'
    When method get
    Then status 200
    And match $.data.*.avatar contains '#regex .+2-image.+'

  Scenario: Testing list user endpoint each contains
    Given path '/users'
    When method get
    Then status 200
    And match each $.data[*].avatar contains '#regex .+-image.jpg+'
