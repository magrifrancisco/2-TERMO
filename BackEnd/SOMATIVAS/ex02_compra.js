// Exercício 2: Pedido de matéria-prima

const entrada = require('readline-sync');


const material = entrada.question('Digite o nome do material: ');
const quantidade = entrada.questionFloat('Digite a quantidade comprada: ');
const precoUnitario = entrada.questionFloat('Preco unitario (R$): ');

const valorTotal = quantidade * precoUnitario;

console.log('\n--- RESUMO DE COMPRA ---');
console.log(`Material: ${material}`);
console.log(`Quantidade: ${quantidade}`);
console.log(`Preço Unitário: R$ ${precoUnitario.toFixed(2)}`);
console.log(`Valor Total: R$ ${valorTotal.toFixed(2)}`);
