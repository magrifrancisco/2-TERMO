// Exercício 4 Classificação de temperatura

const entrada = require('readline-sync');


const temp = entrada.questionFloat('Digite a temperatura da maquina em (C): ');

console.log(`Temperatura: ${temp}°C`);

if (temp <= 60) {
  console.log('Situação: NORMAL 👍');
} else if (temp <= 80) {
  console.log('Situação: ATENÇÃO 😬');
} else {
  console.log('Situação: CRÍTICA ⚠️');
}