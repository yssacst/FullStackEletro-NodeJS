var express = require('express');
var cors = require('cors');
var conn = require('./conexao');
const bodyParser = require('body-parser');

var app = express();

app.use(cors());
app.use(bodyParser.urlencoded({ extended: true }));

app.get('/produtos', (req,res)=>{// exibe produtos
    conn.query('select * from produtos', (err, result)=> { 
        res.json(result);
    })
});


app.get('/categorias', (req,res)=>{ // Exibe todas os produtos e quantidades em cada categoria
    if(req.params.tipo == null){
        conn.query('select categorias.*, count( categorias.nome) as qtd from categorias '
        +' inner join produto_categoria on categorias.id_categoria = produto_categoria.id_categoria '
        +' group by categorias.nome', (err, result)=> { 
            res.json(result);
        });
    }
});

app.get('/categoria/:tipo', (req,res,next)=>{// Filtra categoria por tipo
    var tipo = req.params.tipo;

    conn.query('select produtos.* from produtos '
    + 'inner join produto_categoria on produtos.id_produtos = produto_categoria.id_produto '
    +' inner join categorias on categorias.id_categoria = produto_categoria.id_categoria'
    +' where categorias.chave = ?', tipo, (err, result)=> { 
        res.json(result);
    });

    req.header('Access-Control-Allow-Origin:*');
    req.header('Content-type: application/json');
});

app.get('/comentarios', (req,res)=>{// Pega todos os comentário
    conn.query('select * from comentarios', (err, result)=> { 
        res.json(result);
    })
});

app.post('/comentario/:nome/:msg', (req,res)=>{// Cadastra novo comentário
    conn.query('insert into comentarios (nome, msg) values (?,?)',[req.params.nome,req.params.msg], (err, result, fields)=> { 
        if (err) throw err;
        res.json(result);
        console.log(result);
    })
    res.sendStatus(200);
});

app.use(function( req, res, next) {
    res.status(404).end("Opsss... Pagina nao encontrada");
})
app.listen(5000,()=>{
    console.log("Servidor Node Ativo em http://localhost:5000");
});