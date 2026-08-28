const entrada = require(`readline-sync`)

console.log("=== GERADOR DE PARCELAS ===")

const valor_total = entrada.questionFloat(`Informe o valor total do produto: `)
const qtd_parcelas = entrada.question(`informe o numero de parcelas: `)
const valor_parcelas = valor_total / qtd_parcelas


for (let i = 1; i <= qtd_parcelas; i++) {
    console.log(`Parcela ${i}: R$ ${valor_parcelas.toFixed(2)}`);
}