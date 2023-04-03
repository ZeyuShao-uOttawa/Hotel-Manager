# Set Up Hotel-Manager
This file will instruct you with how to setup this project <br>
First you would want to download or clone this repository

# Setting Up the Back-End Server
Once you have cloned or downloaded this project, open up the parent directory "Hotel-Manager" and cd into the server directory in a CLI then install the required packages by running the following commands <br><br>
`cd server` <br>
`npm install express pg cors` <br>
`npm install -g nodemon` <br><br>
After installing the packages, do <br><br>
`nodemon index` <br><br>
Now that the server is running, go into the 'db.js' file and change the user: and password: to your postgres user. (You can change the host, port, and database to match whatever host/port or database name you are using) <br>
Once you have done so the backend server is successfully running

# Setting Up the Front-End Client
Open the parent directory "Hotel-Manager" and cd into the client directory in a CLI then install the required packages by running the following command <br><br>
`cd client` <br>
`npm install react react-bootstrap bootstrap` <br><br>
If after installing the packages, there are vulnerabilities asking you to address the issue, run the following command <br><br>
`npm audit fix --force` <br><br>
Afterwards run <br><br>
`npm start` <br><br>
Now that the client is running, you can go to localhost:3000 to view the webapp
