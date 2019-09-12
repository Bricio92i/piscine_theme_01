# Theme01-API
API for Time Manager App

### Clone repo
git clone https://github.com/mariagrine/Theme01-API.git

### In the project directory (api_project), run the following commands to install all dependencies
mix deps.get  
mix deps.compile  
cd assets && npm install && node node_modules/brunch/bin/brunch build

### Set db paramaters
- In the project directory (api_project), open the file "dev.exs" contained in "config" directory  
- Change "username" and "password" at the end of the file corresponding to your postgres username and password

### In the project directory (api_project) run the following command
mix ecto.create         ### To create database  
mix ecto.migrate        ### To create all project tables in database

### Run the app
mix phx.server          ### Run this command in the project directory (api_project)

### All routes
# Users #
- get "http://localhost:4000/api/users/all" #get all users  
- get "http://localhost:4000/api/users?username=XXX&password=YYY" #get one user with token

- post "http://localhost:4000/api/users/by_token" #post token to get user data
  - #### Example of body
    - { "token": "XXX" }
  
 - get "http://localhost:4000/api/users/:id" #get user by id    
 - post "http://localhost:4000/api/users" #post user data  
   - ####  Example of body
     - {  
            "data": {  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"email": "xxx03@example.com",  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"password": "12345678",  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"username": "xxx03"  
            &nbsp;&nbsp;}  
        }
     
 - put "http://localhost:4000/api/users/:id" #modify user by id
   - ####  Example of body
      - {  
             "data": {  
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"email": "xxx03@example.com",  
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"password": "12345876",  
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"username": "xx03x"  
             &nbsp;&nbsp;}  
         }  
         
 - delete "http://localhost:4000/api/users/:id" #delete user by id  

# Workingtimes #
- get "http://localhost:4000/api/workingtimes/:user_id" #get all workingtimes by user_id  
- get "http://localhost:4000/api/workingtimes/:user_id?start=XXX&end=YYY" #get all workingtimes by user_id and start - end   
- get "http://localhost:4000/api/workingtimes/:user_id/:workingtimeID" #get one workingtime

- post "http://localhost:4000/api/workingtimes/:user_id" #post workingtime of one user by user_id
  - ####  Example of body
     - {  
            "data": {  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"start": "YYYY-MM-DD 00:00:00",  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"end": "YYYY-MM-DD 00:00:00"  
            &nbsp;&nbsp;}  
        }
     
 - put "http://localhost:4000/api/workingtimes/:id" #modify workingtime by id
   - ####  Example of body
      - {  
             "data": {  
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"start": "YYYY-MM-DD 00:00:00",  
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"end": "YYYY-MM-DD 00:00:00"    
             &nbsp;&nbsp;}  
         }  
         
 - delete "http://localhost:4000/api/workingtimes/:id" #delete workingtimes by id  
 
 # Clocks #
 - get "http://localhost:4000/api/clocks/:user_id" #get clocks of user_id
 - post "http://localhost:4000/api/clocks/:user_id" #post clocks of one user by user_id
   - ####  Example of body
      - {  
            "data": {  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"time": "YYYY-MM-DD 00:00:00",  
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"status": true  
            &nbsp;&nbsp;}  
        }
