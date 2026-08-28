// • Desafio 4: Classificação de Atleta (Múltiplas Condições)
// • Objetivo: Praticar `else if`.
// • Enunciado: Uma escola de natação precisa classificar seus
// alunos por idade:
// • 5 a 10 anos Infantil
// • 11 a 17 anos: Juvenil
// • 18 a 60 anos: Adulto
// • Acima de 60 anos: Sênior

const entrada = require ('readline-sync');

console.log("--- CLASSIFICACAO DE ATLETAS ---")


const idade = entrada.question("Qual a idade do atleta?: ");

if (idade <5) {
console.log("SITUACAO: O atleta é muito jovem para participar da competicao");
}
else if (idade >=5 && idade <=10){
    console.log("CATEGORIA: INFANTIL");
}
else if (idade >=11 && idade <=17) {
    console.log("CATEGORIA: JUVENIL");
}
else if (idade >=18 && idade <=60){
    console.log("CATEGORIA: ADULTO");
}
else{
    console.log("CLASSIFICACAO: SENIOR");
}