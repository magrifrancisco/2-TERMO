// • O Verificador de Votação (Básico)
// • Objetivo: Praticar `if/else` simples.
// • Enunciado: Crie um programa que peça o nome do usuário e o
// ano de nascimento. O programa deve calcular a idade e dizer se
// // ele já tem idade mínima para votar (16 anos)

const entrada = require ('readline-sync');

console.log("--- VERIFICADOR DE VOTAÇÃO ---");

const nome = entrada.question("Digite seu nome: ");
const anoNascimento = entrada.question("Digite seu ano de nascimento: ");

if (anoNascimento <= 2010) {
    console.log(`${nome}, voce tem idade para votar.`);
} else {
    console.log(`${nome}, Sinto Muito,  voce nao tem idade para votar.`);
}