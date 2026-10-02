const fs = require('fs');

const textoDoFicheiro = fs.readFileSync('equipamentos.json', 'utf-8');

const equipamentos = JSON.parse(textoDoFicheiro);


let totalParados = 0;

console.log('=== EQUIPAMENTOS PARADOS ===\n');

for (let i = 0; i < equipamentos.length; i = i + 1) {
  let item = equipamentos[i];

  if (item.operacional === false) {
    console.log(item.nome + ' - ' + item.setor);
    totalParados = totalParados + 1; 
  }
}
console.log('\nTotal de equipamentos parados: ' + totalParados);