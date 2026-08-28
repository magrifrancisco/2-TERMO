const entrada = require ('readline-sync');

console.log("--- SISTEMA DE ANALISE DE CREDITO---")

// Coleta de dados 
const nome = entrada.question("Nome do cliente: ");
const idade = entrada.questionInt("Idade: ");
const renda = entrada.questionFloat("Renda mensal: ");
const temImovel = entrada.keyInYNStrict("Possui imovel proprio? ");


// A Lógica Combinada 
// (idade >= 18) é obrigatório
// (renda => 2500) && (temImovel === true) um dos dois tem que ser verdadeiro para aprovação
if (idade >= 18 && (renda >= 2500 && temImovel === true)) {
    console.log(`\nPARABENS, ${nome}! SEU CRÉDITO FOI APROVADO!`); 
} else {
    console.log(`\nSinto Muito, ${nome}. Seu crédito foi NEGADO!`);
    
}