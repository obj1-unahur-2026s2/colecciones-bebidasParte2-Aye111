
object whisky {
  method rendimientoQueOtorga(dosisConsumida) = 0.9 ** dosisConsumida
}

object terere {
  method rendimientoQueOtorga(dosisConsumida) = 1.max(0.1 * dosisConsumida)
}

object cianuro {
  method rendimientoQueOtorga(dosisConsumida) = 0
}

//Ingredientes del Licuado 

object banana {
  method nutrientesQueAporta() = 31
}

object hielo {
  method nutrientesQueAporta() = 0
}

object leche {
  method nutrientesQueAporta() = 28
}

object frutilla {
  method nutrientesQueAporta() = 10
}
//-------
object licuadoDeFruta {
  const ingredientes = []

  method agregarIngrediente(unIngrediente) {
    ingredientes.add(unIngrediente)
  }

  method rendimientoQueOtorga(dosisConsumida) =
    ingredientes.sum({ ingrediente => ingrediente.nutrientesQueAporta() }) * dosisConsumida / 1000
}

object aguaSaborizada {
  var bebidaBase = whisky

  method bebidaBase() = bebidaBase

  method cambiarBebidaBase(nuevaBebida) {
    bebidaBase = nuevaBebida
  }

  method rendimientoQueOtorga(dosisConsumida) = 
    1 + bebidaBase.rendimientoQueOtorga(dosisConsumida / 4)
}

object coctel {
  const bebidas = []

  method agregarBebida(unaBebida) {
    bebidas.add(unaBebida)
  }

  method dosisPorBebida(dosisConsumida) = dosisConsumida / bebidas.size()

  method rendimientoQueOtorga(dosisConsumida) {
    if (bebidas.isEmpty()) return 0

    return bebidas.fold(1, { acum, unaBebida => 
      acum * unaBebida.rendimientoQueOtorga(self.dosisPorBebida(dosisConsumida)) 
    })
  }
}