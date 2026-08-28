const entrada = require(`readline-sync`)

const nome = entrada.question(`Digite seu nome: `)
const idade = entrada.questionFloat(`Digite sua idade: `)
const tempo_contribuicao = entrada.questionInt(`Informe seu tempo de contribuicao: `)

if (idade >=65 || tempo_contribuicao >=30){
    console.log(`Parabens ${nome}, voce tem os requisitos necessarios para aposentar! `);
}

else {
    console.log(`Que pena ${nome},voce ainda nao tem os requisitos para aposentar! `)
}
