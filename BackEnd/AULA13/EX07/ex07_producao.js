
const fs = require ('fs');

const producao = JSON.parse(fs.readFileSync('producao.json', 'utf8'));

for (let i = 0; i < producao.length; i++) {
    const maquina = producao[i];
    console.log(`\n--- Máquina ${i+1} ---`)
    console.log(`Nome: ${maquina.maquina}`)
    console.log(`Meta: ${maquina.meta}`)
    console.log(`Produzido: ${maquina.produzido}`)
    const percentual = (maquina.produzido / maquina.meta) * 100;
    console.log(`Desempenho: ${percentual.toFixed(2)}%`);
    console.log(`Situação da máquina: ${percentual >= 100 ? 'META ATINGIDA' : percentual >= 80 ? 'ATENÇÃO' : 'ABAIXO DA META'}`);
   

}
