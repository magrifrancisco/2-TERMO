// Criando a "maquina" de calcular media
// function calcularMedia(n1, n2) {
//     return (n1 + n2) / 2;
// }

// // Usando a maquina
// const resultado = calcularMedia(10, 8);
// const resultado1 = calcularMedia(25, 45);
// console.log(`A media calculada foi: ${resultado}`);
// console.log(`A 2ª media calculada foi: ${resultado}`);

const entrada = require("readline-sync")

console.log("=== Calculo de média ===")

const numero1 = entrada.question("Digite o valor do primeiro valor: ")
const numero2 = entrada.question("Digite o valor do segundo numero: ")


const total_media = numero1 + numero2 / 2;
console.log(`O valor da media é: ${total_media}`);