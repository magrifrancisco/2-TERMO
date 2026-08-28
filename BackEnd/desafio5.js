// • Desafio 5: O Simulador de Empréstimo (Operadores Lógicos)
// • Objetivo: Praticar `&&` e `||`.
// • Enunciado: Um banco aprova empréstimos se o cliente preencher
// dois requisitos:
// • 1. Ter renda mensal acima de R$ 2.000,00.
// • 2. NÃO ter o nome sujo (pergunte ao usuário: "Seu nome está limpo?
// true/false").
// • O programa deve ler a renda e o status do nome e dizer "Empréstimo
// Aprovado" ou "Empréstimo Negado".

const entrada = require('readline-sync');


console.log("--- SIMULADOR DE EMPRESTIMO ---")

const renda = entrada.questionFloat("Quanto e sua renda mensal?: ")
const nomeLimpo = entrada.question("Seu nome esta limpo? (true/false) ") === 'true';

if (renda > 2000 && nomeLimpo) {
    console.log("Parabens, emprestimo aprovado! ")
}
else{
    console.log("Sinto Muito, emprestimo negado! ")
}