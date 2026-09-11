//  Exerício 9: Cálculo de eficiência

const entrada = require('readline-sync');

function calcularEficiencia(real, prevista) {
  return (real / prevista) * 100;
}

function classificarEficiencia(percentual) {
  if (percentual >= 90) {
    return 'META ATINGIDA ✅';
  } else if (percentual >= 70) {
    return 'ATENÇÃO';
  } else {
    return 'ABAIXO DA META ❌';
  }
}

const prevista = entrada.questionFloat('Producao prevista: ');
const real = entrada.questionFloat('Producao real: ');

const percentual = calcularEficiencia(real, prevista);
const classificacao = classificarEficiencia(percentual);

console.log('\n----- RELATÓRIO DE EFICIÊNCIA -----');
console.log(`Producao prevista: ${prevista}`);
console.log(`Produção Real: ${real}`);
console.log(`Percentual: ${percentual.toFixed(2)}%`);
console.log(`Classificação: ${classificacao}`);