// Exercício 6: Média de cinco medições 

const entrada = require('readline-sync')


let soma = 0;

for (let i = 1; i <= 5; i++) {
  const medicao = entrada.questionFloat(`Informe a medicao ${i}: `);
  soma += medicao;
}

const media = soma / 5;

console.log(`\nSoma total de todas as medicoes: ${soma}`);
console.log(`Média final: ${media}`);