const entrada = require('readline-sync');
const fs = require ('fs');

console.log("=== REGISTRO DE QUANTIDADE DE FERRAMENTAS ===")

const ferramentas =[];

const qtdFerramentas = entrada.questionInt("Informe quantas pecas foram utilizadas: ")

for(let i = 1; i < qtdFerramentas; i++) {
    const nome = entrada.question(`Digite o nome da ferramenta ${i}: `)
    const qtd = entrada.questionInt(`Informe a quantidade da ferramenta ${i}: `)
    const custoUnitario = entrada.questionInt(`Informe o custo da ferramenta ${i}: `)

    ferramentas.push(nome,qtd,custoUnitario)
}
fs.writeFileSync('ferramentas.json', JSON.stringify(ferramentas, null, 2))
console.log("Ficheiro criado com sucesso")
console.log("Verifique o arquivo 'ferramentas.json'")