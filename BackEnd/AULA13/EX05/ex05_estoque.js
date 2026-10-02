const fs = require('fs');
const conteudo = fs.readFileSync('materiais.json', 'utf-8');

const materiais = JSON.parse(conteudo);

let totalUnidades = 0;
let valorTotalEstoque = 0;

console.log('--- DETALHES DO ESTOQUE ---\n');

for (let i = 0; i < materiais.length; i = i + 1) {
  let item = materiais[i];

  let valorItem = item.quantidade * item.valorUnitario;

  totalUnidades = totalUnidades + item.quantidade;
  valorTotalEstoque = valorTotalEstoque + valorItem;

  console.log(item.descricao);
  console.log('Quantidade: ' + item.quantidade);
  console.log('Valor unitário: R$ ' + Number(item.valorUnitario).toFixed(2));
  console.log('Valor em estoque: R$ ' + valorItem.toFixed(2));
}

console.log('\n--- RESUMO GERAL DO ESTOQUE ---');
console.log('Tipos de materiais cadastrados: ' + materiais.length);
console.log('Quantidade total de unidades: ' + totalUnidades);
console.log('Valor total do estoque: R$ ' + valorTotalEstoque.toFixed(2));