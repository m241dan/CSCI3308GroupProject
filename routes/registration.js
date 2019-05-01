var express = require('express');
var bcrypt = require('bcrypt');
var db = require('../database/dbHandle');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('register', {
  	title: "F.I.T. Fam - Sign Up"
  });
});

router.post('/', function(req, res) {
	var pwd = bcrypt.hash(req.body.passwordFirst, 5);
	db.getUserByEmail(req.body.emailAddress, (err, results) => {
		console.log(results)
		console.log(results.rows[0].count)
		if( results.rows[0].count > 0 ) {
			req.flash('failure', "Unfortunately that user email is already taken, if that is you please sign in, otherwise use a new email.");
   			res.redirect('/login');
		}
    	else {
	    	db.insertUser(req.body.firstName, req.body.lastName, req.body.userName, req.body.emailAddress, pwd);
		    res.redirect('/');	
    	}
	});

});

module.exports = router;
