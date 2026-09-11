// Exercício 8: Estoque de componentes

const entrada = require('readline-sync');

const estoque = [];

for (let i = 0; i < 3; i++) {
  console.log(`\n----- Cadastro de Componente ${i + 1} -----`);
  const nome = entrada.question('Nome do componente: ');
  const quantidade = entrada.questionInt('Quantidade atual: ');
  const estoqueMinimo = entrada.questionInt('Estoque minimo: ');

  estoque.push({ nome, quantidade, estoqueMinimo });
}

console.log('\n----- RELATÓRIO DE ESTOQUE -----');
for (let i = 0; i < estoque.length; i++) {
  const item = estoque[i];
  let status = 'ESTOQUE OK 👍';
 
  if (item.quantidade < item.estoqueMinimo) {
    status = 'REPOR ESTOQUE ⚠️';
  }

  console.log(`Item: ${item.nome} | Quantidade: ${item.quantidade} | Mínimo: ${item.estoqueMinimo} -> ${status}`);
}