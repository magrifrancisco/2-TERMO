const entrada = require('readline-sync')

const logistica = require ('./calculadoraFrete');

console.log("=== SISTEMA DE ENTREGAS ===")

const nomeProduto = entrada.question("Nome do produto: ");

const km = entrada.question("Distancia de entrega em km:");

const valorTotal = entrada.questionFloat("Valor total da entrega: ");

const calcularFrete = logistica.calcularBase(km)
const calcularSeguro = logistica.calcularSeguro(valorTotal)
const prazoEntrega = logistica.verificarPrazo(km)

console.log ("=== Relatório de Postagem ===")
console.log(`Nome do produto: ${nomeProduto}`)
console.log(`Valor do frete: ${calcularFrete.toFixed(2)}`)
console.log(`Valor total: R$ ${valorTotal.toFixed(2)}`)
console.log(`Prazo da entrega: ${prazoEntrega}`)