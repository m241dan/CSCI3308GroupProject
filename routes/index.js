var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  // res.write('This is /');
  // res.end();
  res.render('index', {
  	title: "F.I.T. Fam"
  });
});

module.exports = router;
