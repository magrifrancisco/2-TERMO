const entrada = require("readline-sync")



const cinema = [
    { título: "Dumbo", censura: 0},
    { título: "Deadpool", censura: 18 },
    { título: "Batman", censura: 12 },
];
const idadeUser = entrada.questionInt("Qual sua idade? ");
for (let i = 0; i < cinema.length; i++) {
    if (idadeUser >= cinema [i].censura) {
        console.log(`Pode ver: ${cinema[i].título}`);
    }
}