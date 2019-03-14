/***********************
  Load Components!
  Express      - A Node.js Framework
  Body-Parser  - A tool to help use parse the data in a post request
  Pg-Promise   - A database tool to help use connect to our PostgreSQL database
***********************/
var express = require('express'); //Ensure our express framework has been added
var app = express();
var bodyParser = require('body-parser'); //Ensure our body-parser tool has been added
app.use(bodyParser.json());              // support json encoded bodies
app.use(bodyParser.urlencoded({ extended: true })); // support encoded bodies

//Create Database Connection
var pgp = require('pg-promise')();


const dbConfig = {
  host: 'localhost',
  port: 5432,
  database: 'football_db',
  user: 'postgres',
  password: '123456'
};
//resource, should be connected with our own database etc.
//var db = pgp(dbConfig);

// set the view engine to ejs
//app.set('view engine', 'ejs');
//app.use(express.static(__dirname + '/'));//This line is necessary for us to use relative paths and access our resources directory

app.get('/', function(req,res){

});

app.get('/login', function(req,res){

});

app.get('/sign_up', function(req,res){

});

app.get('/account', function(req,res){

});

app.get('/account/awards', function(req,res){

});

app.get('/account/add_workout', function(req,res){

});

app.get('/account/summary', function(req,res){

});