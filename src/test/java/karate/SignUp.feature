@ignore
Feature: Sign Up new user

  Background: Precondition
    Given url 'https://conduit-api.bondaracademy.com/api/'

  Scenario: New user Sign Up
    Given path 'users'
    And def userDate = {"email": "karate123@test.com","username":"Karate123"}
  #    And request {"user":{"email": "#('Tes'+userDate.email)","password":"Karate123","username":"#('User'+userDate.username)"}}
  #    And request {"user":{"email": "boris5@i.ua","password":"Karate123","username":"boris55"}}
    And request
      """
      {
        "user": {
          "email": "#('Tes'+us1erDate.email)",
          "password": "Karate123",
          "username": "#('User'+user1Date.username)"}}
      """

    When method Post
    Then status 201