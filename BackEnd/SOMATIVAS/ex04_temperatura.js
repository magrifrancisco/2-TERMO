// Exercício 4 Classificação de temperatura

const readline = require('readline-sync');


const temp = readline.questionFloat('Informe a temperatura da maquina (C): ');

console.log(`Temperatura: ${temp}°C`);

if (temp <= 60) {
  console.log('Situação: NORMAL');
} else if (temp <= 80) {
  console.log('Situação: ATENÇÃO');
} else {
  console.log('Situação: CRÍTICA');
}