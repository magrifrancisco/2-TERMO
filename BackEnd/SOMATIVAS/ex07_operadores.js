// Exercício 7: Lista de operadores

const readline = require('readline-sync');


const operadores = [];

for (let i = 0; i < 5; i++) {
  const nome = readline.question(`Digite o nome do operador ${i + 1}: `);
  operadores.push(nome);
}

console.log('\n--- LISTA DE OPERADORES ---');
for (let i = 0; i < operadores.length; i++) {
  console.log(`${i + 1} - ${operadores[i]}`);
}