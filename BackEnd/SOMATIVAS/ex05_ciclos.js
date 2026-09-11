// Exercício 5: Tabela de produção

const readline = require('readline-sync')


const pecasPorCiclo = readline.questionInt('Quantidade de pecas por ciclo: ');

console.log('\n--- TABELA DE PRODUÇÃO ---');
for (let ciclo = 1; ciclo <= 10; ciclo++) {
  const producaoAcumulada = ciclo * pecasPorCiclo;
  console.log(`Ciclo ${ciclo}: ${producaoAcumulada} peças acumuladas`);
}