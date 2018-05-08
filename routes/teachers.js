var express = require('express');
var bodyParser = require("body-parser");

var router = express.Router();
var urlEncodeParser = bodyParser.urlencoded({
  extended: false
});

router.use(bodyParser.json());

router.post('/mainTeachers', urlEncodeParser, function(req, res){
    var dir = 'teachers.html';
    res.send(dir);
});

module.exports = router;