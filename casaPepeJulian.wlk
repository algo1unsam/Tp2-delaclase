object casa {
  var viveres = 50 //porcentual
  const property valorSuficiente = 40
  var property montoReparacion = 0
  var property cuenta = cuentaCombinada
  var property estrategiaDeAhorro = minimo 
  

  method hacerMantenimiento(){
    estrategiaDeAhorro.mantenimiento(self)
  }
  method asignarCuenta(unaCuenta) {
    cuenta = unaCuenta
  }
  
  method tieneViveresSuficientes() = viveres >= valorSuficiente
  
  method necesitaReparaciones() = montoReparacion > 0
  
  method montoReparacion(valor) {
    montoReparacion = valor
    self.gastar(valor)
  }
  
  method viveres(valor) {
    viveres = valor
  }
  
  method viveres() = viveres
  
  method estaEnOrden() = self.tieneViveresSuficientes() and (not self.necesitaReparaciones())
  
  method gastar(valor) {
    cuenta.extraer(valor)
  }

  method comprarLoQueSeNecesita(calidad, valor) {
    const compra = valorSuficiente - viveres + valor
	    self.gastar(compra * calidad)
      self.viveres(viveres + compra)
  }

  method reparar(){
		if((cuenta.saldo() > montoReparacion) and (cuenta.saldo() - montoReparacion) > 1000){
			self.gastar(montoReparacion)			
			montoReparacion = 0
		} 
	}

} //Cuentas bancarias

object cuentaCorriente {
  var property saldo = 0
  
  method depositar(valor) {
    //saldo = saldo + valor
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
  
  method secundaria() = secundaria
  
  method secundaria(cuenta) {
    secundaria = cuenta
  }
  
  method primaria() = primaria
  
  method depositar(valor) {
    primaria.depositar(valor)
  }
  
  method extraer(valor) {
    if (primaria.saldo() > valor) primaria.extraer(valor)
    else secundaria.extraer(valor)
  }
  
  method saldo() = primaria.saldo() + secundaria.saldo()
}

//MANTENIMIENTO

object minimo{
	var calidad = 1
	method mantenimiento(casa){
		if(not casa.tieneViveresSuficientes()){
      var compra = casa.valorSuficiente() - casa.viveres()
	    casa.gastar(compra * calidad)
      casa.viveres(casa.valorSuficiente())
		}
	}
}

object full{
	var calidad = 5
	var totalViveres = 100
	
	method mantenimiento(casa){		
		if(casa.estaEnOrden()){
			const comprar = totalViveres - casa.viveres()
			casa.gastar(comprar * calidad)		
			casa.viveres(totalViveres)
			}
		else{
			casa.viveres(40 + casa.viveres())
			casa.gastar(40 * calidad)
			}
		casa.reparar()
	}
}
