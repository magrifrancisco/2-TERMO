const entrada = require(`readline-sync`)


function calcularArea(1, c) {
    return 1 * c;
}

// Chamar 3 vezes usando entrada.questionFloat...

const larguraterreno = entrada.questionFloat("digite a largura do primeiro terreno: ")
const comprimentoterreno = entrada.questionFloat("digite o comprimento do primeiro terreno: ")

const largura2terreno = entrada.questionFloat("digite a largura do segundo terreno: ")
const comprimento2terreno = entrada.questionFloat("digite o comprimento do segundo terreno: ")

const largura3terreno = entrada.questionFloat("digite a largura do terceiro terreno: ")
const comrprimento3terreno = entrada.questionFloat("digite o comrprimento do terceiro terreno: ")

for(let i= 1; i< 4; i++) {
    let comprimento = entrada.questionFloat(`Informe o comprimento do terreno ${i}`)

    let area = calcularArea(largura, comprimento)

    console.log(`O terreno ${i} tem area de ${area} me²`)
}