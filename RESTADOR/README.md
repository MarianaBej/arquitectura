# **Restador en Verilog**
Un **restador** es un circuito combinacional que realiza la resta entre dos o más bits binarios. Al igual que el sumador, es un bloque básico en sistemas digitales que se utiliza para realizar operaciones aritméticas más complejas. Este tipo de restador puede ser utilizado para restar números de mayor tamaño cuando se conectan varios de estos bloques en serie.

## **2. Tabla de Contenidos**
1. [Introducción]()  
2. [Tabla de Contenidos](#tabla-de-contenidos)  
3. [Descripción del Proyecto](#descripción-del-proyecto)
4. [Entradas y Salidas](#entradas-y-salidas)
5. [Descripción por Bloques](#descripción-por-bloques)
6. [Funcionamiento Detallado](#funcionamiento-detallado)  
7. [Tabla de verdad](#tabla-de-verdad)
8. [Consideraciones Adicionales](#consideraciones-adicionales)  

## **Descripción del Proyecto**

El restador es un circuito simple que recibe dos bits, **A** y **B**, junto con un bit de acarreo de entrada (**Ci**) o "préstamo de entrada", y genera dos salidas: el resultado de la resta (**D**, de diferencia) y el bit de acarreo de salida (**Co** o "préstamo de salida"). El circuito sigue las reglas de la resta binaria, en donde se puede "pedir prestado" de la siguiente posición si el bit **B** es mayor que **A**.

## **Entradas y Salidas**

- **Entradas**:
  - **A (bit minuendo)**: El bit que se va a restar.
  - **B (bit sustraendo)**: El bit que se resta del minuendo.
  - **Ci (bit de acarreo de entrada o "préstamo")**: Indica si en la operación anterior se pidió prestado un bit, afectando la resta.

- **Salidas**:
  - **D (bit de diferencia)**: El resultado de restar **B** de **A** (incluyendo el acarreo o préstamo si aplica).
  - **Co (bit de acarreo de salida o "préstamo")**: Indica si se ha necesitado pedir prestado un bit para completar la resta.

## **Descripción por Bloques**

El restador se compone de puertas lógicas simples que implementan la resta y el manejo del acarreo (o préstamo). A continuación se describe cómo funcionan los bloques lógicos:

- **Resta básica**: La diferencia entre dos bits se puede calcular mediante una combinación de puertas XOR para obtener el bit de diferencia.
- **Préstamo**: Se calcula usando una puerta AND y una OR para determinar si es necesario pedir prestado un bit desde una posición más significativa. Esto ocurre cuando **B** es mayor que **A** o cuando el préstamo de entrada afecta la operación.

## **Funcionamiento Detallado**

La operación del restador se basa en la resta binaria, que sigue reglas específicas para manejar préstamos:

- Si **A** es mayor o igual a **B**, la diferencia **D** es simplemente la resta de **A - B**.
- Si **A** es menor que **B**, se debe pedir prestado un bit de la siguiente posición más significativa, lo que produce un **préstamo de salida (Co = 1)**.
  
## **Tabla de verdad**:

| A | B | Ci | D (Diferencia) | Co (Préstamo de salida) |
|---|---|----|----------------|-------------------------|
| 0 | 0 | 0  | 0              | 0                       |
| 0 | 0 | 1  | 1              | 1                       |
| 0 | 1 | 0  | 1              | 1                       |
| 0 | 1 | 1  | 0              | 1                       |
| 1 | 0 | 0  | 1              | 0                       |
| 1 | 0 | 1  | 0              | 0                       |
| 1 | 1 | 0  | 0              | 0                       |
| 1 | 1 | 1  | 1              | 1                       |

A partir de esta tabla de verdad, podemos construir las expresiones lógicas para cada salida:

- **Diferencia (D)**: `( D = A ^ B ^ Ci )` Aquí, ^ significa XOR. Esta operación nos da la diferencia entre A, B y el acarreo de entrada (Ci).
- **Préstamo de salida (Co)**: `( Co = (B & Ci) | (~A & B) | (~A & Ci) )` Aquí, & significa AND, | significa OR, y ~ es NOT. Esto calcula si es necesario pedir prestado del siguiente bit para realizar la resta.


Estas expresiones pueden implementarse con puertas lógicas en hardware.

## **Consideraciones Adicionales**

- **Extensibilidad**: Al igual que en un sumador, un restador puede conectarse en serie para crear restadores de mayor tamaño, como un restador de 4 bits o más.
- **Simplicidad del diseño**: El restador es un diseño relativamente sencillo, basado en puertas lógicas, lo que lo hace eficiente y fácil de entender.
- **Préstamo**: Es importante tener en cuenta que el flujo de préstamo entre posiciones de bits es fundamental para asegurar la correcta operación del restador, especialmente cuando se trabaja con múltiples bits.