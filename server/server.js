//npm modules
const express = require('express');
const session = require('express-session');
const uuid = require('uuid/v4');
const FileStore = require('session-file-store')(session);
const bodyParser = require('body-parser');

// create the server
const app = express();

// add & configure middleware
app.use(bodyParser.urlencoded({ extended: false }));
app.use(bodyParser.json());

// add & configure middleware
app.use(session({
  genid: (req) => {
    console.log('Inside the session middleware')
    console.log(req.sessionID)
    return uuid() // use UUIDs for session IDs
  },
  secret: 'keyboard cat',
  resave: false,
  store: new FileStore(),
  saveUninitialized: true
}));

// create the homepage route at '/'
app.get('/', (req, res) => {
  console.log('Inside the homepage callback function');
  console.log(req.sessionID);
  res.send(`You hit home page!\n`);
});

// create the login get and post routes
app.get('/login', (req, res) => {
  console.log('Inside GET /login callback function');
  console.log(req.sessionID);
  res.send(`You got the login page!\n`);
})

app.post('/login', (req, res) => {
  console.log('Inside POST /login callback function');
  console.log(req.body);
  res.send(`You posted to the login page!\n`);
})

// tell the server what port to listen on
app.listen(3000, () => {
  console.log('Listening on localhost:3000');
});
