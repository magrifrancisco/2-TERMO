const fs = require('fs');

if (fs.existsSync('equipamentos.json')) {
  
  const conteudo = fs.readFileSync('equipamentos.json', 'utf-8');

  const equipamentos = JSON.parse(conteudo);
  
  for (let i = 0; i < equipamentos.length; i = i + 1) {
    let item = equipamentos[i];
    
    console.log('Código: ' + item.codigo);
    console.log('Nome: ' + item.nome);
    console.log('Setor: ' + item.setor);
    console.log('Operacional: ' + item.operacional);
  }

} else {
  console.log('O ficheiro equipamentos.json não existe!');
}