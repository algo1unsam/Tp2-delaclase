# 🏠 Casa de Pepe y Julián

Pepe y Julián son re amigos y decidieron irse a vivir juntos (por eso y porque no llegan a fin de mes), y nos pidieron que les ayudemos con un sistema para administrar los gastos de la casa.

---

## 🏡 La casa

De la casa se conoce la cantidad de víveres que tiene (en porcentaje) y un monto (en pesos) necesario para reparaciones.  
Además, se quiere saber:

- Si la casa **_tiene víveres suficientes_**: mayor al 40%.  
- Si **_hay que hacer reparaciones_**.  
- Si la casa **_está en orden_**, lo que implica que no hay que hacer reparaciones y tiene víveres suficientes.  

### 🔧 Implementación inicial
Hay que implementar los objetos y métodos necesarios para obtener esta información y poder configurar:
- **Los víveres que tiene** la casa.
- **Las reparaciones necesarias**, sabiendo que inicialmente comienza con:
  - 50% de víveres.
  - Sin necesidad de reparaciones.

> **Caso de Prueba:**  
> Hacer que se rompa algo de 1000 pesos en la casa, aumentando el monto de reparación. Verificar que:  
> - ✔️ La casa tiene víveres suficientes.  
> - ❌ Hay que hacer reparaciones.  
> - ❌ No está en orden.  

---

## 🏦 Cuentas bancarias  

Pepe y Julián poseen varios tipos de cuentas bancarias, de las cuales pueden conocer su saldo y extraer y depositar dinero:

1. **Cuenta corriente**  
   - Al depositar, **suma el saldo**.  
   - Al extraer, **resta el saldo**.  

2. **Cuenta con gastos**  
   - Mantiene un saldo y un **costo por operación**.  
   - Al depositar, suma el importe depositado, pero **descontando el costo por operación**.  
   - Al extraer, resta el saldo normalmente.

   > **Caso de Prueba:**  
   > Si la cuenta está vacía y el costo por operación es de 20 pesos:  
   > - Al depositar 1000 pesos, el saldo queda en **980 pesos**.  

3. **Cuenta combinada**  
   Esta cuenta combina dos cuentas:  
   - Una **primaria**: los depósitos van aquí.  
   - Una **secundaria**: se usa para extracciones si la primaria no tiene suficiente saldo.  
   - El saldo total de la cuenta combinada es la suma del saldo de ambas cuentas.  

   > **Caso de Prueba:**  
   > Si configuramos la cuenta combinada de la siguiente manera:  
   > - La **primaria** es una cuenta con gastos con 50 pesos de costo de operación.  
   > - La **secundaria** es una cuenta corriente con 500 pesos de saldo.  

   Escenarios:
   - Se **depositan 100 pesos**:  
     - Van a la cuenta primaria, pero tras descontar el costo de operación, se depositan solo **50 pesos efectivos**.  
   - Se **extraen 200 pesos**:  
     - La cuenta primaria no tiene saldo suficiente, por lo que el dinero sale de la secundaria.  
   - **Resultado final:**  
     - La cuenta con gastos queda con **50 pesos**.  
     - La cuenta corriente queda con **300 pesos**.  
     - La cuenta combinada queda con **350 pesos**.  

Ellos asignan una de estas cuentas para gestionar los gastos de la casa. Cada vez que se produce un gasto en la casa, se extrae de la cuenta asignada el importe correspondiente.

---

## 🔧 Manteniendo la casa  

Cada cierto tiempo, Pepe y Julián hacen un mantenimiento de la casa. Los gastos dependen de la **estrategia de ahorro** que hayan consensuado. Hay tres estrategias posibles:

1. **Mínimo e indispensable**  
   - Si la casa **no tiene víveres suficientes** (es decir, menos del 40%), compran lo necesario para alcanzar ese porcentaje.  
   - El gasto por comprar víveres se calcula como:  
     `porcentaje a comprar * calidad`,  
     siendo **calidad** un valor definido al elegir esta estrategia.  

2. **Full**  
   - Si la casa **está en orden**, llenan los víveres al 100%.  
   - Si **no está en orden**, aumentan un 40% los víveres.  
   - La **calidad** en esta estrategia es de 5.  
   - Además, si después de comprar víveres el saldo en la cuenta es suficiente para cubrir las reparaciones **y sobran más de 1000 pesos**, las reparaciones se realizan. Si no, no.

---

> **Caso de Prueba:**  
> Si la casa tiene 50% de víveres, necesita 100 pesos para reparaciones y está asociada a una cuenta corriente con 1000 pesos:  
> - Al hacer un mantenimiento con la estrategia _Full_:  
>   - La casa **no está en orden**, así que aumentan 40% los víveres, gastando:  
>     `40 * 5 = 200 pesos`.  
>   - Luego, aunque pueden cubrir las reparaciones, **no sobrarían 1000 pesos**, así que no las hacen.  
> - **Estado final:**  
>   - La casa queda con **90% de víveres**.  
>   - Mantiene los **100 pesos** de reparaciones pendientes.  
>   - La cuenta corriente queda con **800 pesos**.  

---

## 🤔 Para pensar  

Si se agrega una nueva casa, ¿es posible usar estas estrategias con ella?  
¿Qué mensajes debería entender esta nueva casa?  

Podés responder con comentarios en el código o creando una implementación para una casa nueva que siga esta lógica.
