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
                "email": "xxx03@example.com",  
                "password": "12345678",  
                "username": "xxx03"  
            }  
        }
     
 - put "http://localhost:4000/api/users/:id" #modify user by id
   - ####  Example of body
      - {  
             "data": {  
                 "email": "xxx03@example.com",  
                 "password": "12345876",  
                 "username": "xx03x"  
             }  
         }  
         
 - delete "http://localhost:4000/api/users/:id" #delete user by id  

# Workingtimes #
- get "http://localhost:4000/api/workingtimes/:userID?start=XXX&end=YYY" #get all workingtimes  
- get "http://localhost:4000/api/workingtimes/:userID/:workingtimeID" #get one workingtime

- post "http://localhost:4000/api/workingtimes/:userID" #post workingtime of one user by user_id
  - ####  Example of body
     - {  
            "data": {  
                "start": "YYYY-MM-DD 00:00:00",  
                "end": "YYYY-MM-DD 00:00:00"  
            }  
        }
     
 - put "http://localhost:4000/api/workingtimes/:id" #modify workingtime by id
   - ####  Example of body
      - {  
             "data": {  
                 "start": "YYYY-MM-DD 00:00:00",  
                 "end": "YYYY-MM-DD 00:00:00"    
             }  
         }  
         
 - delete "http://localhost:4000/api/workingtimes/:id" #delete workingtimes by id  
 
 # Clocks #
 - get "http://localhost:4000/api/clocks/:userID" #get clocks of user_id
 - post "http://localhost:4000/api/clocks/:userID" #post clocks of one user by user_id
   - ####  Example of body
      - {  
            "data": {  
                "time": "YYYY-MM-DD 00:00:00",  
                "status": true 
            }  
        }
