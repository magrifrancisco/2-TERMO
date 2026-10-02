const fs = require('fs');

const sensores = [
  { codigo: 1, tipo: 'Temperatura', valor: 85.5, unidade: '°C', status: 'Alerta' },
  { codigo: 2, tipo: 'Pressão', valor: 2.1, unidade: 'bar', status: 'Normal' },
  { codigo: 3, tipo: 'Vibração', valor: 12.0, unidade: 'mm/s', status: 'Alerta' },
  { codigo: 4, tipo: 'Umidade', valor: 45.0, unidade: '%', status: 'Normal' },
  { codigo: 5, tipo: 'Fluxo', valor: 90.0, unidade: 'L/min', status: 'Alerta' }
];

const textoJSON = JSON.stringify(sensores, null, 2);

fs.writeFileSync('monitoramento.json', textoJSON, 'utf-8');

console.log('Ficheiro monitoramento.json criado com sucesso!');