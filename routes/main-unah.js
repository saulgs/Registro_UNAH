var express = require('express');
var bodyParser = require("body-parser");

var router = express.Router();

router.use(bodyParser.json());

router.get('/main/toRegistry', function(req, res){
    var dir = 'registry/index.html';
    res.send(dir);
});

module.exports = router;