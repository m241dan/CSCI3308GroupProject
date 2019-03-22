var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.render('login', {
  	title: "F.I.T. Fam - Login"
  });
});

module.exports = router;
