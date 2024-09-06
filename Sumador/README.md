## Sumador en verilog
Los sumadores son circuitos esenciales que permiten realizar operaciones aritméticas, como la suma de números binarios. Los sumadores se utilizan tanto en procesadores como en unidades aritmético-lógicas (ALUs). Este informe aborda dos tipos de sumadores: el sumador de 1 bit, que es el bloque básico, y el sumador de 4 bits, una implementación modular construida a partir del sumador de 1 bit.

### **Tabla de Contenido**
1. Introducción  
2. Descripción del Proyecto  
   2.1 Sumador de 1 Bit  
   2.2 Sumador de 4 Bits    
3. Entradas y Salidas
4. Funcionamiento Detallado  
   4.1 Sumador de 1 Bit  
   4.2 Sumador de 4 Bits  
5. Comparación entre el Sumador de 1 Bit y el Sumador de 4 Bits  
6. Consideraciones Adicionales  
7. Conclusión  

### **Descripción del Proyecto**

#### *Sumador de 1 Bit*
Un sumador de 1 bit es un circuito combinacional que realiza la suma de dos bits (A y B) junto con un bit de acarreo de entrada (Ci), produciendo un bit de suma (So) y un bit de acarreo de salida (Co). Este circuito es comúnmente conocido como un "sumador completo" y es uno de los bloques fundamentales para construir sumadores de mayor tamaño.

#### *Sumador de 4 Bits*
El sumador de 4 bits se construye conectando cuatro sumadores de 1 bit en cascada, de modo que el acarreo de salida de un sumador se convierte en el acarreo de entrada del siguiente. Esto permite sumar dos números binarios de 4 bits, además de manejar un bit de acarreo de entrada, y generar un bit de acarreo de salida final.

## **Entradas y Salidas**
#### *Sumador de 1 Bit*

*- Entradas:*

- A (bit de entrada 1): Primer bit que se suma.
- B (bit de entrada 2): Segundo bit que se suma junto con A.
- Ci (bit de acarreo de entrada): Acarreo entrante de una operación previa o de un sumador de menor posición.

*- Salidas:*

- So (bit de suma): Resultado de la suma de A, B, y Ci.
- Co (bit de acarreo de salida): Acarreo de salida, si se genera uno.
#### *Sumador de 4 Bits*
*- Entradas:*

- **A[3:0] (4 bits de entrada 1):** Primer número de 4 bits a sumar. La notación A[3:0] indica que A es un número binario de 4 bits, donde el bit más significativo está en la posición 3 (A[3]) y el bit menos significativo en la posición 0 (A[0]).
- **B[3:0] (4 bits de entrada 2):** Segundo número de 4 bits a sumar, que sigue el mismo formato que A.
- **Ci (bit de acarreo de entrada):** Acarreo de entrada, utilizado cuando la operación es parte de una suma más grande.

*- Salidas:*

- **So[3:0] (4 bits de suma):** Resultado de la suma de A[3:0], B[3:0], y Ci, donde el resultado es un número de 4 bits con la misma notación.
- **Co (bit de acarreo de salida):** Acarreo de salida, que puede ser generado cuando la suma excede los 4 bits.

### **Funcionamiento Detallado**

#### *Sumador de 1 Bit*
El sumador de 1 bit utiliza puertas lógicas para sumar dos bits de entrada y un bit de acarreo. Los resultados se generan utilizando las siguientes expresiones lógicas:
- **So** (bit de suma) se calcula como:  
  \[
  So = A + B + Ci
  \]
- **Co** (bit de acarreo de salida) se calcula como:  
  \[
  Co = (A x B) + (Ci x (A + B))
  \]

#### *Sumador de 4 Bits*
El sumador de 4 bits se construye conectando cuatro sumadores de 1 bit. Cada sumador maneja una posición de bit específica de los números A y B. El acarreo de salida de un sumador de 1 bit se conecta como el acarreo de entrada del siguiente. El resultado final es un número de 4 bits junto con un acarreo de salida.

### **Comparación entre el Sumador de 1 Bit y el Sumador de 4 Bits**

| **Característica**             | **Sumador de 1 Bit**                               | **Sumador de 4 Bits**                                |
|-------------------------------|----------------------------------------------------|-----------------------------------------------------|
| **Entradas**                   | 2 bits (A y B) + 1 bit de acarreo de entrada (Ci)  | 8 bits (4 bits A[3:0], 4 bits B[3:0]) + 1 bit Ci     |
| **Salidas**                    | 1 bit de suma (So) + 1 bit de acarreo (Co)         | 4 bits de suma (So[3:0]) + 1 bit de acarreo (Co)     |
| **Uso**                        | Bloque básico para operaciones aritméticas         | Suma de números de 4 bits mediante conexión de 4 sumadores de 1 bit |
| **Escalabilidad**              | Puede ser utilizado para formar sumadores más grandes | Es un sumador de mayor escala construido a partir de sumadores de 1 bit |
| **Complejidad**                | Baja, usa puertas lógicas básicas                  | Mayor complejidad, ya que requiere instancias múltiples de sumadores de 1 bit |
| **Aplicación**                 | Operaciones simples o parte de circuitos más grandes | Usado en ALUs y operaciones que requieren sumar números de mayor tamaño |

### **Consideraciones Adicionales**

- **Facilidad de expansión:** El diseño del sumador de 4 bits, construido a partir de sumadores de 1 bit, permite que sea fácil de ampliar si se necesita manejar más bits en el futuro. Esto hace que el diseño sea flexible y adaptable para diferentes proyectos.
- **Uso eficiente del hardware:** Al construir el sumador con bloques pequeños (sumadores de 1 bit), el sistema puede aprovechar mejor los recursos del hardware, lo que es importante en dispositivos electrónicos donde el espacio y la eficiencia son cruciales.
- **Flujo de acarreo:** En el sumador de 4 bits, el resultado de cada bit afecta al siguiente. Esto garantiza que los números se sumen correctamente, manejando el acarreo entre posiciones de manera adecuada.

### **Conclusión**
Ambos son circuitos combinacionales esenciales en operaciones aritméticas dentro de procesadores digitales. Mientras que el sumador de 1 bit es un bloque básico, su aplicación en conjunto con otros sumadores permite realizar operaciones con números de mayor tamaño, cruciales para el funcionamiento de ALUs y procesadores.
