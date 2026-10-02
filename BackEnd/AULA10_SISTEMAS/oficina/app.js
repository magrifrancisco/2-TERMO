const entrada = require('readline-sync');

// Buscando as ferramentas no arquivo funcoesOficina.js
//o './' significa "nesta mesma pasta"
const oficina = require('./funcoesOficina.js');

console.log("=== SISTEMA DE GESTÃO DE OFICINA ===");

const peca = entrada.questionFloat("Preco da peca: R$ ");
const horas = entrada.questionInt("Horas de trabalho: ");
const tempoUso = entrada.questionInt("Meses desde o ultimo conserto: ");

//Usamos o nome 'oficina' (que damos nos require) seguido do ponto .
const totalBruto = oficina.calcularOcamento(peca, horas);
const statusGarantia = oficina.verificarGarantia(tempoUso);
const totalComDesconto = oficina.aplicarDesconto(totalBruto);

console.log("\n--- RELATÓRIO FINAL ---");
console.log(`Ocamento sem descont: R$ ${totalBruto.toFixed(2)}`);
console.log(`Orcamento com desconto (5%): R$ ${totalBruto.toFixed(2)}`);
console.log(`Status do Veiculo: ${statusGarantia}`);
 