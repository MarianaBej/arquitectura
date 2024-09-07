# Multiplicador en Verilog

En esta parte del repositorio contiene la implementacion de un multiplicador secuencial en Verilog basado en una Maquina de Estados Finitos (FSM). El modulo toma dos operandos de 3 bits y genera un producto de 6 bits, realizando la multiplicacion de manera secuencial mediante desplazamientos y sumas parciales.

## Tabla de Contenido

1. [Descripcion del Proyecto](#descripcion-del-proyecto).
2. [Diagrama de Estados](#diagrama-de-estados).
3. [Entradas y Salidas](#entradas-y-salidas).
4. [Descricpion de los Bloques](#descripcion-de-los-bloques)


## Descripcion del Proyecto

Se busca realizar la multiplicacion de dos numeros binarios de 3 bits cada uno en este caso `MR` y `MR` usando una FSM para controlas las operaciones de suma y desplazamiento. La multiplicacion se realiza bit a bit, sumando productos parciales y desplazando el registro hasta completar la operacion. El resultado de la multiplicacion se almacena en `pp` (producto parcial), que es un registro de 6 bits.

## Diagrama de Estados

Los estados de la maquina para controlar el proceso de multiplicacion son:

- **START**: Es el estado incial a la espera de la señal de inicio (`init`).
- **CHECK**: En este estado se verifica que el bit menos significativo del operando B (`MR`) sea 1 o 0.
- **ADD**: En este estado se suma el contenido del registro `A` al acumuludor de productos parciales (`pp`) si el bit actual de `B` es 1.
- **SHIFT**: Este es el estado donde el registro de multiplicacion (`A`) se desplaza hacia la izquierda y el registro de bits(`B`) hacia la derecha.
- **END**: En este estado finaliza la operacion y el resultado final queda registrado en `pp`.

## Entradas y Salidas

### Entradas

- `clk`: Reloj con el que se sincroniza las operaciones del sistema.
- `init`: Señal de inicio para comenzar la multiplicacion.
- `MR`: Multiplicador de 3 bits.
- `MD`: Multiplicando de 3 bits.

### Salidas

- `done`: Señal que indica que la operacion de multipliacion ha finalizado.
- `pp`: Producto parcial acumulado, que representa el resultado de la multiplicacion (6 bits).

## Descripcion de los Bloques

### FSM

La maquina de estado finitos o FSM controla el flujo de la multiplicacion. Sus estados permiten realizar operaciones de verificacion, suma de productos parciales y desplazamientos de registros.

### Registro de Desplazamiento

El registro `A` se inicializa con el valor del multiplicando(`MD`) alineado a los 3 bits mas bajos, mientras que `B` se inicializa con el multiplicador (`MR`). El registro `A` se desplaza a la izquierda y `B` a la derecha en cada ciclo de reloj.

### Acumulacion de Productos Parciales

El registro `pp`acumula el resultado parcial de las sumas de los productos parciales. Cuando el FSM esta en el estado `ADD`, el valor de `A` se suma a `pp`.

### Comparador

El bloque de comparacion verifica si el registro `B` ha llegado a cero. Cuando `B` es igual a cero, el proceso de multiplicacion ha finalizado.

## Funcionamiento Detallado

1. **Inicializacion**: Cuando `init` es activada, la FSM pasa del estado `START` a `CHECK`. Los registros `A` y `B` se inicializan con los valores de `MD` y `MR`, respectivamente.
2. **Verificacion de Bits**: En el estado `CHECK`, se verifica el bit menos significativo de `B`. Si es `1`, se pasa al estado `ADD`, donde el contenidp de `A` se suma a `pp`.
3. **Suma y Desplazamiento**: Si el bit `1`, se realiza la suma, luego el sistema pasa al estado `SHIFT`, donde `A` se desplaza a la izquierda y `B` a la derecha.
4. **Finalizacion**: El proceso continua hasta que todos los bits de `B` hayan sido procesados. En ese momento, el sistema pasa al estado `END1`, donde la señal `done` se activa y el resultado final estan en `pp`.

## Consideraciones Adicionales

- La señal `done`permite sincronizar con otros modulos o componentes de un sistema mas grande, indicando que el proceso de multiplicacion ha concluido.
- Este diseño podria ser optimizado par incrementar la velocidad utilizando tecnicas de paralelismo o multiplicadores combinacionales en lugar de secuenciales. 