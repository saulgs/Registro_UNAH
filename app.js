var express = require('express');
var path = require('path');
var app = express();

app.use('/', express.static(__dirname + "/public/"));



app.listen(3000, () => {
    console.log('Servidor iniciado en el puerto 3000.');
});