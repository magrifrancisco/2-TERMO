function calcularBase(km){
const valorFrete = 2.10;
return totalFrete = km * valorFrete
}

function calcularSeguro(valorCarga){
const valorSeguro = 0.01;
return totalSeguro = valorCarga * valorSeguro
}

function verificarPrazo(km){
    if (km < 100){
        return "1 dia útil"
    } else {
        return "3 a 5 dias úteis"
    }
}

module.exports = {
    calcularBase,
    calcularSeguro,
    verificarPrazo
}
