// 🚀 Desafio 1: Sistema de Alerta de Manutenção (Uso de .filter)
// "Olá, pessoal! O gerente da fábrica notou que algumas máquinas estão trabalhando demais e precisam de manutenção preventiva. O nosso desafio é criar um sistema que varre o banco de dados e gera uma lista de 'máquinas em perigo'.
// O que vocês devem fazer:
// Crie um arquivo chamado maquinas.json com esta lista inicial:
// code
// JSON
// [
//   { "id": 1, "nome": "Torno CNC", "horasUso": 1200 },
//   { "id": 2, "nome": "Fresadora", "horasUso": 800 },
//   { "id": 3, "nome": "Prensa Hidraulica", "horasUso": 1500 },
//   { "id": 4, "nome": "Corte a Laser", "horasUso": 500 }
// ]
// Crie um programa que leia esse arquivo.
// Use o método .filter() para criar uma nova lista apenas com as máquinas que tenham mais de 1000 horas de uso.
// O programa deve exibir os nomes dessas máquinas no terminal e salvar essa lista de alertas em um novo arquivo chamado manutencao_urgente.json."
// Dica do Professor: "Lembrem-se: o .filter() traz TODOS que combinam com a regra, enquanto o .find() traz apenas o primeiro!"


const fs = require('fs')
const entrada = require('readline-sync')

console.log("=== SISTEMA DE CONTROLE DE MÁQUINA ===\n");

try {
    const dadosTexto = fs.readFileSync('maquinas.json', 'utf-8');
    const produtos = JSON.parse(dadosTexto);

    const termoMaquina = entrada.question("Digite a quantidade de horas das maquinas: ");

    const resultado = produtos.filter(p => p.qtd <= termoMaquina); 

    if (resultado) {
        console.log("\n PRODUTOS ENCONTRADOS");
        const baixoEstoque = produtos.filter(p => p.qtd <= termoMaquina);
        console.log(baixoEstoque); 
    }
} catch(erro) {
    console.log("Erro ao acessar o banco de dados: " + erro.message);
}