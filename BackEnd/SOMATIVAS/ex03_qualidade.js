// Exercício 3: Peça aprovada ou reprovada

const readline = require('readline-sync');


const peso = readline.questionFloat('Informe o peso da peca (g): ');

if (peso >= 95 && peso <= 105) {
  console.log(`Peso: ${peso}g - PEÇA APROVADA`);
} else {
  console.log(`Peso: ${peso}g - PEÇA REPROVADA`);
}