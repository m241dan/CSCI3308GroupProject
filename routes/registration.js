var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    // res.write('This is /registration');
    // res.end();
    res.render('register', {
  	title: "F.I.T. Fam - Sign Up"
  });
});

module.exports = router;
