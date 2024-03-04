Feature: Articles
  Background: Define URL
    Given url 'https://conduit-api.bondaracademy.com/api/'
    * def tokenResponse = callonce read('classpath:helpers/CreateToken.feature'){"email": "boriszhenya@gmail.com", "password": "zhenya7503423"}
    * def token = tokenResponse.authToken




  Scenario: Create a new article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": "B100l","description": "jhgjhg", "body": "gjhgjhg","tagList": []}}
    When method Post
    Then status 201
    And match response.article.title == 'B100l'



  Scenario: Create and delete article
    Given header Authorization = 'Token ' + token
    Given path 'articles'
    And request {"article": {"title": "Delete article","description": "jhgjhg", "body": "gjhgjhg","tagList": []}}
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
    And match response.articles[0].title != "Delete article"

