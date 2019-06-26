   Feature: Validate User details 
  
   Scenario: Get all users and then get first user by ID
     Given url 'https://jsonplaceholder.typicode.com/users'
     When method get
     Then status 200
     
     * def firstUser = response[0]
     
     Given path firstUser.id
     When method get
     Then status 200
     
   Scenario: Create user and then validate user has been created successfully
     Given url 'https://jsonplaceholder.typicode.com/users'
     And request { "name":"TestUser","username":"testuser111", "email":"abc@gmail.com","address":{"street":"street","suite":"A1234","city":"city1", "zipcode":"54321-1234"}}
     When method post
     Then status 201
     And match response contains { name:"TestUser",email:"abc@gmail.com"}
     And match $.name == "TestUser"

     
     