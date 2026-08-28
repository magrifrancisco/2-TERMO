// • Álcool ou Gasolina? (Matemática + Lógica)
// • Objetivo: Praticar lógica aplicada ao dia a dia.
// • Enunciado: Dizem que só compensa abastecer com Álcool se o
// preço dele for menor que 70% do preço da Gasolina. Peça o preço
// do litro de cada um. O programa deve calcular: `precoAlcool /
// precoGasolina`. Se o resultado for menor que 0.7, mostre
// "Abasteça com ÁLCOOL". Caso contrário, mostre "Abasteça com
// GASOLINA".

const entrada = require ('readline-sync');

console.log ('--- DESAFIO 3 ---')

const valorAlcool = entrada.questionFloat("Qual o valor do litro do Alcool?: ")
const valorGasolna = entrada.questionFloat("Qual o valor do litro da Gasolina?: ")

const ValorTotal = valorAlcool / valorGasolna;

if (ValorTotal < 0.7) {
    console.log("Abasteça com Alcool!")

}
else {
console.log("Abasteça com Gasolina!")
}
