const fs = require('fs')
const dados = fs.readFileSync("monitoramento.json", "utf-8");

const equipamentos = JSON.parse(dados);

const sensorAlerta = equipamentos.filter(function (equipamento) {
    return equipamento.status === "Alerta"
});


console.log("\n--- Sensores em Alerta ---");
console.log(sensorAlerta);


console.log("Total de sensores em alerta: ", sensorAlerta.length)