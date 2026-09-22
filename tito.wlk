import bebidas.*
object tito {
  var property peso = 70
  var bebidaConsumida = whisky
  var dosisConsumida = 0

  method consumir(cantidad, bebida) {
    bebidaConsumida = bebida
    dosisConsumida = cantidad
  }

  method velocidad() {
    const inerciaBase = 490
    const rendimiento = bebidaConsumida.rendimientoQueOtorga(dosisConsumida)
    return (rendimiento * inerciaBase) / peso
  }
}