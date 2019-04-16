var express = require('express');
var bcrypt = require('bcrypt');
var db = require('../database/dbHandle');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    // res.write('This is /registration');
    // res.end();
    res.render('register', {
    title: "F.I.T. Fam - Sign Up"
  });
});

router.post('/', async (req, res) => {
    console.log( "pwd: " + req.body.passwordFirst );
    var pwd = await bcrypt.hash(req.body.passwordFirst, 5);

    
    var checkemail = req.body.emailAddress;
    var count = 'SELECT COUNT(1) FROM enjoyer WHERE email = 'checkemail';';
    if(count == 0)
    {
        // NO Duplicates in database 
         db.insertUser(req.body.firstName, req.body.lastName, req.body.userName, req.body.emailAddress, pwd);
    }
    else
    {
        //redirect? or display error message?
        res.redirect('/');
    }
   
    
});

module.exports = router;
