var express = require('express');
var router = express.Router();

/* GET home page. */
exports.index = function(req, res) {
  res.render('index.html', { title: 'Express' });
};

module.exports = router;
