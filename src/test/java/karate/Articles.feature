@debug
Feature: Articles
  Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com/api/'
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature'){"email": "boriszhenya@gmail.com", "password": "zhenya7503423"}
    * def token = tokenResponse.authToken
    * def articleRequestBody = read('classpath:helpers/newArticleRequest.json')
    * def dataGenerator = Java.type('helpers.DataGenerator')
    * set articleRequestBody.article.title = dataGenerator.getRandomArticleValues().title
    * set articleRequestBody.article.description = dataGenerator.getRandomArticleValues().description
    * set articleRequestBody.article.body = dataGenerator.getRandomArticleValues().body



  Scenario: Create a new article

  Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201
    And match response.article.title == articleRequestBody.article.title



  Scenario: Create and delete article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request articleRequestBody
    When method Post
    Then status 201

    * def slug = response.article.slug

    Given header Authorization = 'Token ' + token
    Given path 'articles', slug
    When method Delete
    Then status 204

    Given params {limit:10, offset:5}
    Given path 'articles'
    When method Get
    Then status 200
    And match response.articles[0].title != articleRequestBody.article.title

