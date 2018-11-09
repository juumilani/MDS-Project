var express = require('express');
var router = express.Router();

/* GET home page. */
exports.index = function(req, res) {
  res.render('index.html', { title: 'Express' });
};


//Rotas do banco de dados
var db = require('../utils/queries')

router.get('/api/alunos', db.getAllAlunos);
router.get('/api/alunos/:id', db.getAluno);
router.post('/api/alunos', db.createAluno);
router.delete('/api/alunos/:id', db.removeAluno);
module.exports = router;
