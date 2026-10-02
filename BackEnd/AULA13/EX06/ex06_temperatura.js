const fs = require ('fs');

try{
    const dados = fs.readFileSync('temperatura.json', 'utf-8')
    const temperatura = JSON.parse(dados);

    for (let i = 0; i < temperatura.length; i++) {
        if (temperatura[i].temperatura <= 350) {
            console.log(`Leitura: ${temperatura[i].temperatura}°C - NORMAL`);
        } else {
            throw new Error (`Temperatura de ${temperatura[i].temperatura}°C excedeu o limite permitido`);
        }
    }
} catch (erro) {
    console.log(erro.message);
}
