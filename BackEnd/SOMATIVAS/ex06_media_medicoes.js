// Exercício 6: Média de cinco medições 

const readline = require('readline-sync')


let soma = 0;

for (let i = 1; i <= 5; i++) {
  const medicao = readline.questionFloat(`Digite a medicao ${i}: `);
  soma += medicao;
}

const media = soma / 5;

console.log(`\nSoma total das medições: ${soma}`);
console.log(`Média final: ${media}`);