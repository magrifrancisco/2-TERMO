const fs = require('fs');

const equipamentos = [
  {
    codigo: 101,
    nome: 'Torno CNC',
    setor: 'Usinagem',
    operacional: true
  },
  {
    codigo: 102,
    nome: 'Prensa Hidráulica',
    setor: 'Estamparia',
    operacional: true
  },
  {
    codigo: 103,
    nome: 'Robô de Solda',
    setor: 'Montagem',
    operacional: false
  }
];

const equipamentosJSON = JSON.stringify(equipamentos, null, 2);

fs.writeFileSync('equipamentos.json', equipamentosJSON, 'utf-8');

console.log('Ficheiro equipamentos.json criado com sucesso!');