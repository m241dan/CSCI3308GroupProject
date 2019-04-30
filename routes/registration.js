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

router.post('/', async (req, res) => {
    var pwd = await bcrypt.hash(req.body.passwordFirst, 5);
    db.insertUser(req.body.firstName, req.body.lastName, req.body.userName, req.body.emailAddress, pwd);
    res.redirect('/');
});

module.exports = router;
