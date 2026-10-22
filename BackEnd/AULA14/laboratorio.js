// const fs = require("fs");
// const texto = fs.readFileSync("maquinas.json", "utf8");
// console.log(typeof texto);
// console.log(texto);



// const fs = require("fs");

// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// console.log(Array.isArray(maquinas));
// console.log(maquinas.length);
// console.log(maquinas[3].nome); 



// const fs = require("fs");

// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// console.log(Array.isArray(maquinas));
// console.log(maquinas.length);
// console.log(maquinas[1].nome); 

// const fs = require("fs");

// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);
// maquinas.forEach((maquina, indice) => {
// console.log(`${indice + 1}. ${maquina.nome}`);
// });

// const procurada = maquinas.find(maquina => maquina.id === 2);
// console.log(procurada);


// const fs = require("fs");

// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);

// maquinas.forEach((maquina, indice) => {
//     console.log(`${maquina.nome} - ${maquina.setor} - ${maquina.situacao}`);
// });

// const procurada = maquinas.find(maquina => maquina.id === 2);
// console.log(procurada);


// const procurada = maquinas.find(maquina => maquina.id === 99);
// console.log(procurada); // undefined


// if (procurada !== undefined) {
// console.log(procurada.nome);
// } else {
// console.log("Máquina não encontrada.");
// }

// const paradas = maquinas.filter(maquina => maquina.setor === "Usinagem");
// console.log(paradas); // []
// console.log(paradas.length); // 0

// Questão 7 - Se a empresa quiser listar todos, a melhor escolha será o filter.

// Desafio A - Fundamental. Exiba uma linha para cada máquina no padrão ID | Nome | Status. Utilize o
// array carregado do JSON.

// const fs = require("fs");

// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);

// maquinas.forEach((maquina) => {
//     console.log(`${maquina.id} | ${maquina.nome} | ${maquina.status}`);
// });

// Desafio B - Intermediário. Leia um ID de uma variável, localize a máquina e mostre o setor. Se não
// existir, apresente uma mensagem amigável.


// const fs = require("fs");

// const texto = fs.readFileSync("maquinas.json", "utf8");
// const maquinas = JSON.parse(texto);


// const idProcurado = 2;
// const maquinaEncontrada = maquinas.find(
//     maquina => maquina.id === idProcurado
// );

// if (maquinaEncontrada !== undefined) {
//     console.log("Setor: " + maquinaEncontrada.setor);
// } else {
//     console.log("Máquina não encontrada. Verifique o ID informado.");
// }


const fs = require("fs");

const texto = fs.readFileSync("maquinas.json", "utf8");
const maquinas = JSON.parse(texto);

const setorProcurado = "Usinagem";

const encontradas = maquinas.filter(
    maquina => maquina.setor === setorProcurado
);

console.log("Quantidade de máquinas: " + encontradas.length);

encontradas.forEach(maquina => {
    console.log(maquina.nome);
});

// Desafio D - Avançado. Crie uma função que receba um status por parâmetro e devolva o array
// filtrado. Teste com status existente e inexistente.


// Desafio E - Transferência. Abra o projeto oficial da atividade no Classroom e identifique quais
// estruturas e métodos deste laboratório são úteis para implementar as funções pedidas. Não copie o
// laboratório sem adaptar ao formato dos dados reais.