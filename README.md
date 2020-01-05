"# authtut" 
1.go to client folder and from terminal run command to save sessionid in text file
  curl -X GET http://localhost:3000 -v -c cookie-file.txt
2.to send the saved session id in request header
  curl -X GET http://localhost:3000 -v -b cookie-file.txt
3.curl -X POST  http://localhost:3000/login -b cookie-file.txt -H "Content-Type: application/json" -d "{\"email\":\"test@test.com\", \"password\":\"password\"}"
4.curl -X GET http://localhost:3000/authrequired -b cookie-file.txt -L