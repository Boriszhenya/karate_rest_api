
Feature: Sign Up new user

  Background: Precondition
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * def timeValidator = read('classpath:helpers/timeValidator.js')
    * def randomEmail = dataGenerator.getRandomEmail()
    * def randomUsername = dataGenerator.getRandomUsername()

    Given url 'https://conduit-api.bondaracademy.com/api/'


  Scenario: New user Sign Up


  #    * def jsFunction =
  #      """
  #      function(){
  #        var DataGenerator = Java.type('helpers.DataGenerator')
  #        var  generator = new DataGenerator()
  #        return generator.getRandomUsername2()
  #      }
  #      """
  #
  #    * def randomUsername2 = call jsFunction

    Given path 'users'
    And request
      """
    {
    "user": {
    "email": #(randomEmail),
    "password": "Karate123",
    "username": #(randomUsername)
    }
    }
    """

    When method Post
    Then status 201
    And match response.user.email == randomEmail
    And match response ==
      """
    {
    "user": {
    "id": "#number",
    "email": #(randomEmail),
    "username": #(randomUsername),
    "bio": null,
    "image": "#string",
    "token": "#string"
    }
    }
    """


  Scenario Outline:Validate Sign Up error messeges
    Given path 'users'
    And request
"""
{
"user": {
"email": <email>,
"password": <password>,
"username": <username>
}
}
"""

    When method Post
    Then status 422
    * karate.log(response)
    And match response == <errorResponse>
    Examples:
      | email               | password  | username          | errorResponse                                       |
      | #(randomEmail)      | Karate123 | Karate123         | {"errors": {"username": ["has already been taken"]}}|
      |boriszhenya@gmail.com|Karate123  |#(randomUsername)  |{"errors": {"email": ["has already been taken"]}}    |


