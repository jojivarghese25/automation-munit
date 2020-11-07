Feature: Testing the API's

Scenario: Get Subscribed customer details
Given I create a new request with http://apiops-anypoint-bdd-sapi.us-e2.cloudhub.io/api/
And I add the users/registerUser/subscription endpoint to the service
And I send the GET request to the service
Then I get the 200 response code
Then I assert the following values in the response body
| description | Success|


Scenario: Register Customer 
Given I create a new request with http://apiops-anypoint-bdd-sapi.us-e2.cloudhub.io/api/
And I add the users/registerUser endpoint to the service
And  I pass application/json as content type
And I send the following values in the request body
|userId |123abc|
|emailId |sham123@gmail.com|
|firstName|sham|
|lastName |Jacob|
|phoneNumber |999123456|

And I send the POST request to the service
Then I get the 201 response code
Then I assert the following values in the response body
| message | Data inserted successfully |