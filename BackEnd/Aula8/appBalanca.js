const entrada = require(`readline-sync`)
const {verificarPeso} = require('./funcoes_balança')

while (true) {
    try {
        const peso = entrada.question('Digite o peso da peca (ou "sair"): ')
    
        if (peso.toLowerCase()=== 'sair')
            console.log("Encerrando a balanca")
        break;
    }

    const resultado = verificarPeso(peso);
    console.log(resultado);
}   
    catch (erro) {
    console.log (`⚠️ ALERTA: ${erro.message}.`);
}