var express = require('express');
var router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
    res.write('This is /account_summary');
    res.end();
});

module.exports = router;
