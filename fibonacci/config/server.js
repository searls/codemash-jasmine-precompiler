var express = require('express'),
    request = require('request'),
    app     = express();

app.configure(function() {
  app.use(express.static(process.cwd() + "/generated"));
  app.use(express.bodyParser());
  app.use(express.errorHandler());
});

app.post('/fibonacci', function(req, res) {
  res.json(fibonacciFor(req.body['index']));
});

var fibonacciFor = function(n) {
  if(n <= 1) return n;
  return fibonacciFor(n-1) + fibonacciFor(n-2)
}

module.exports = app;
