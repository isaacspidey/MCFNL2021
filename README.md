# MCFNL2021
Repositorio de "Métodos Computacionales en Física No Lineal" 20/21. Parte II: Métodos deterministas en electromagnetismo.

# EntregaProyecto Nº 4 FDFD WAVE GAUSSIAN
Aquí se encuentra todo la información y programas del proyecto

El compedio de código que se muestran, se ha hecho para poder simular campos radiados con
condiciones PEC en 1D en el dominio de la frecuencia FDFD a través de una fuente de corriente
gaussina (aunque también se ha generado el código para crear una corriente barrera y constante).

El código princial es FDFD, en el se estructura la definición de los parámetros del medio

0) PERMEABILIDADES E-M, CONDUCTIVIDADES E-M. 

Defino en unidades naturales, las permeabilidades del vacio.

0) RELACIÓN DE DISPERSIÓN.  

Aplico las condiciones de dispersión w=w(lambda) y con lambda defino el mallado 
con el fin de poder obtener un código sin dispersión numérica.

0) APLICO DIFERENCIAS FINITAS EN Z EL CAMPO E Y EN Y EL CAMPO H.

Con ello es posible demostar que la evolución del campo esta dada al resolver
un sistema lineal, donde la incognita son los campos E, dados los E
es posible obtener los H. 

Ya con esto se obtiene los campos en función del espacio e incluso hemos podido 
validar que existe efectos de resonancia, es decir el campo E se vuelve idéntico 
a la corriente de entrada.

Después:

-)gaussiana.m es una función externa que genera una gaussiana
-)barrera.m es una función externa que genera una barrera
-)proye.m es la proyeción (producto escalar) para ver los pesos que dan 
los modos normales para poder reconstruir el campo E. Además se compara 
la corriente de entrada con el campo E.
-)video.m es igual que proye.m pero genera un barrido con las lambdas 
para poder apreciar el solapamiento de resonancia.
-)videodifu.m es un programa que seleciona un conjunto de fotos 
para poder unirlas y generar un video.
