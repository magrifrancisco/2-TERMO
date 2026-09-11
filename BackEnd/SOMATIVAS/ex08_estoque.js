// Exercício 8: Estoque de componentes

const readline = require('readline-sync');

const estoque = [];

for (let i = 0; i < 3; i++) {
  console.log(`\n--- Cadastro do Componente ${i + 1} ---`);
  const nome = readline.question('Nome do componente: ');
  const quantidade = readline.questionInt('Quantidade atual: ');
  const estoqueMinimo = readline.questionInt('Estoque minimo: ');

  estoque.push({ nome, quantidade, estoqueMinimo });
}

console.log('\n--- RELATÓRIO DE ESTOQUE ---');
for (let i = 0; i < estoque.length; i++) {
  const item = estoque[i];
  let status = 'ESTOQUE OK';
 
  if (item.quantidade < item.estoqueMinimo) {
    status = 'REPOR ESTOQUE';
  }

  console.log(`Item: ${item.nome} | Qtd: ${item.quantidade} | Mín: ${item.estoqueMinimo} -> ${status}`);
}