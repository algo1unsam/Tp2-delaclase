object casa{
    var viveres = 50
    var montoReparaciones = 0
    var valorSuficiente = 40
    //const pi = 3,14

    method viveres() = viveres

    method viveres(valor) {
        viveres = valor
    }

    method montoReparaciones() = montoReparaciones

    method montoReparaciones(valor) {
        montoReparaciones = valor
    }



    method tieneViveres() = viveres > valorSuficiente

    method hayReparaciones() = montoReparaciones > 0

    method estaEnOrden() = self.tieneViveres() and  not self.hayReparaciones()
}



object cuentaCorriente {
  var property saldo = 0
  
  method depositar(valor) {
   // saldo = saldo + valor   
    saldo += valor
  }
  
  method extraer(valor) {
    saldo -= valor
  }
}

object cuentaConGasto {
  var saldo = 0
  var costoOperacion = 0
  
  method depositar(valor) {
    saldo += valor - costoOperacion
  }
  
  method saldo() = saldo
  
  method extraer(valor) {
    saldo -= valor
  }
  
  method costoOperacion(valor) {
    costoOperacion = valor
  }
}


object cuentaCombinada {
  var primaria = cuentaConGasto
  var secundaria = cuentaCorriente
  
  method primaria(cuenta) {
    primaria = cuenta
  }
  
  method primaria() = primaria
  
  method saldo() = primaria.saldo() + secundaria.saldo()
}