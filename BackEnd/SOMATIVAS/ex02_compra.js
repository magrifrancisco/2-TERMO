// Exercício 2: Pedido de matéria-prima

const readline = require('readline-sync');


const material = readline.question('Nome do material: ');
const quantidade = readline.questionFloat('Quantidade comprada: ');
const precoUnitario = readline.questionFloat('Preco unitario (R$): ');

const valorTotal = quantidade * precoUnitario;

console.log('\n--- RESUMO DA COMPRA ---');
console.log(`Material: ${material}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preço Unitário: R$ ${precoUnitario.toFixed(2)}`);
console.log(`Valor Total: R$ ${valorTotal.toFixed(2)}`);
