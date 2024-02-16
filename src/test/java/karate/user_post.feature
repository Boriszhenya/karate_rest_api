Feature: Testing a REST API for user endpoint

  Background:
    * url 'https://reqres.in/api'

  Scenario: Testing user creation endpoint
    Given path '/users'

    * def helper = Java.type('org.example.DataHelper')
    * def userPost = helper.getAnyUserPostJson()

    And header Content-Type = 'application/json'
    And request userPost
    #And request { name: 'Jorje', job: 'Worker' }
    When method post
    Then status 201

    * def userPost = helper.getUserPostMap(userPost)
    * def userResponse = helper.getUserCreatedMap()

    #* def message = helper.printMessage(response)

    And match response contains userResponse
    And match $.name == userPost.name
    And match $.job == userPost.job

    * def realResponse = response

    And call read('@getUser') realResponse, userPost

  @ignore @getUser
  Scenario: Testing user created endpoint
    #Given path '/users/' + userPost.name
    Given path '/users/' + realResponse.id
    When method get
    Then status 404
    #Then status 200
    # Если бы у нас был настоящий REST API мы бы могли проверить и GET
    # And match $.name == userPost.name
    # And match $.job == userPost.job