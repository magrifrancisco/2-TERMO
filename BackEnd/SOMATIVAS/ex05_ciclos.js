// Exercício 5: Tabela de produção

const entrada = require('readline-sync')


const pecasPorCiclo = entrada.questionInt('Informe a quantidade de pecas por ciclo: ');

console.log('\n-- TABELA DE PRODUÇÃO --');
for (let ciclo = 1; ciclo <= 10; ciclo++) {
  const producaoAcumulada = ciclo * pecasPorCiclo;
  console.log(`Ciclo ${ciclo}: ${producaoAcumulada} peças acumuladas`);
}