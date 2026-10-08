const fs = require('fs');

console.log("=== SISTEMA DE MONITORAMENTO ===");

const sensores = [
    {codigo: 1001, tipo: "Temperatura", leituraAtual: 40.8, status: "Operando"},
    {codigo: 1002, tipo: "Pressao", leituraAtual: 6, status: "Operando"},
    {codigo: 1003, tipo: "Temperatura", leituraAtual: 140.9, status: "Alerta!"}
]

fs.writeFileSync("sensores.json", JSON.stringify(sensores, null, 2));

console.log("Fixeiro Criados com Sucesso")
console.log("Consulte o arquivo 'sensores.json'")