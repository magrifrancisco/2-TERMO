const entrada = require('readline-sync');


const funcoes = require('./funcoesManutencao');

const maquina = entrada.question('Informe o nome da maquina: ');
const valorPecas = entrada.questionFloat('Digite o valor das pecas (R$): ');
const horas = entrada.questionFloat('Horas de servico: ');
const meses = entrada.questionInt('Meses desde a ultima manutencao: ');

const maoDeObra = funcoes.calcularMaoDeObra(horas);
const total = funcoes.calcularTotal(valorPecas, horas);
const garantia = funcoes.verificarGarantia(meses);

console.log('\n--- RELATÓRIO DE MANUTENÇÃO ---');
console.log(`Máquina: ${maquina}`);
console.log(`Mão de Obra: R$ ${maoDeObra.toFixed(2)}`);
console.log(`Peças: R$ ${valorPecas.toFixed(2)}`);
console.log(`Total: R$ ${total.toFixed(2)}`);
console.log(`Garantia: ${garantia}`);