// Exercício 3: Peça aprovada ou reprovada

const entrada = require('readline-sync');


const peso = entrada.questionFloat('Informe o peso da peca em (g): ');

if (peso >= 95 && peso <= 105) {
  console.log(`Peso: ${peso}g - PEÇA APROVADA!! 😁`);
} else {
  console.log(`Peso: ${peso}g - PEÇA REPROVADA 😞`);
}