const fs = require('fs')
const entrada = require('readline-sync')

console.log("=== SISTEMA DE CONSULTA DE ESTOQUE ===\n");

try {
    const dadosTexto = fs.readFileSync('estoque.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    const termoBusca = entrada.question("Coloque a quantidade de produtos: ");

    const resultado = produtos.filter(p => p.qtd <= termoBusca); 

    if (resultado) {
        console.log("\n PRODUTOS ENCONTRADOS");
        const baixoEstoque = produtos.filter(p => p.qtd <= termoBusca);
        console.log(baixoEstoque); 
    }
} catch(erro) {
    console.log("Erro ao acessar o banco de dados: " + erro.message);
}