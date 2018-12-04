"# authtut" 
1.go to client folder and from terminal run command to save sessionid in text file
  curl -X GET http://localhost:3000 -v -c cookie-file.txt
2.to send the saved session id in request header
  curl -X GET http://localhost:3000 -v -b cookie-file.txt