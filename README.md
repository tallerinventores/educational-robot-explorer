# Educational Robot Explorer #

> Generic rover robot for educational use

* * *

## Resumen ##

Explorador robótico para uso en entornos educativos. Ha sido desarrollado y
optimizado para impresión 3D y pensando en su bajo coste y facilidad de montaje
y uso. Es versátil al disponer de múltiples sensores y actuadores, por lo que
proporciona una plataforma de aprendizaje excelente.

## Instalación ##

En esta sección se cubre la instalación de software y hardware para el montaje
recomendado, mediante [Arduino](http://www.arduino.cc/).

### Requerimientos de software ###

Para poser usar Arduino (v1.6+) con el código fuente proporcionado, es necesario
[ArduinoFacil](https://github.com/tallerinventores/ArduinoFacil) una librería de
Arduino para principiantes. Para generar los archivos aptos para la impresora 3D
desde los archivos `.stl` será necesario adicionalmente un software para esta
función, como puede ser [Slic3r](http://slic3r.org/). El esquema eléctrico viene
detallado en archivo de [Fritzing](http://fritzing.org/home/)

Ver los requerimientos de mencionados programas previamente.

### Requerimientos de hardware ###

Será necesario para su montaje y uso una fuente de alimentación que proporcione
5W a 5V, un Arduino Uno o equivalente, dos servomotores tipo 9g modificados para
eliminar la lógica con sus correspondientes accesorios (tornillos y cuernos), y
los componentes listados en la sección «Conexión eléctrica». El rover está
optimizado para usar los servos **TowerPro SG90**. Adicionalmente harán falta
tornillos de métrica tres de diferentes largos.

## Uso ##

Instrucciones de montaje y puesta en marcha.

### Montaje del explorador robótico ###

1.  Imprimir una unidad de los archivos `clip.stl`, `fork_left.stl`,
    `fork_right.stl`, `shaft.stl`, `sensor.stl`, `arduino.stl`, `body.stl`.
    Imprimir dos unidades de `omni.stl`, `bigwheel.stl`. Imprimir diez unidades
    de `wheel.stl`. Puede ser necesario repasar las piezas impresas con el fin
    de eliminar rebabas.  
2.  Insertar un eje de 3mm (trozo de filamento) de nueve milimetros de largo en
    cada rueda pequeña (_wheel_). Colocar cada uno de ellos en las muescas de la
    rueda omnidireccional (_omni_) y cerrarlo con la otra mitad de la misma.
    Usar tornillos de M3x6 con tuerca o habiéndo hecho previamente rosca de M3
    en una de las mitades de la rueda omnidireccional. Puede resultar
    conveniente ajustar en cada rueda pequeña una junta tórica de 19mm.  
3.  Con las horquillas (_fork\_right_ y _fork\_left_) a los lados del montaje
    del punto anterior, sin que éstas tropiecen; insertar el pasador (_shaft_) a
    través del orificio central del conjunto. Asegurarlo en el extremo contrario
    con el clip (_clip_).  
4.  Encajar los led en los orificios del cuerpo del robot (_body_). Retenerlos
    si se considera necesario con algún tipo de adhesivo.  
5.  Colocar las dos ldr en los orificios destinados a ello del cuerpo, y fijarlo
    del mismo modo que con los led.  
6.  Atornillar con tornillos M3x10 el soporte de los sensores frontales
    (_sensor_) al cuerpo, pasando los tornillos previamente por el sensor de
    distancia. Pueden usarse tuercas o realizar rosca al soporte de los
    sensores.  
7.  Fijar los dos sensores reflectivos al soporte de sensores, quedando la
    óptica hacia el centro abajo. Usar para ello tornillos M3x6 con tuerca o con
    rosca sobre el soporte. Puede ser necesario doblar la cabecera de conexión
    para dejarla vertical u orientada hacia dentro.  
8.  Montar los dos servomotores con sus ejes hacia la parte forntal exterior y
    atornillarlos con los tornillos proporcionados con los servos.  
9.  Introducir los cuernos de los servos en las ruedas motrices (_bigwheel_) y
    fijarlo a los ejes de los servos con sus propios tornillos.  
10. Presentar el conjunto de la rueda omnidireccional en la parte trasera del
    cuerpo y atornillarlo usando tornillos de M3x10 si se ha realizado rosca o
    M3x16 y tuerca en caso contrario.  
11. Realizar la gestión de cables para conducir todos ellos a través de la
    abertura triangular del cuerpo.  
12. Encastrar tuercas en la base del Arduino (_arduino_), y atornillar la base
    al cuerpo con tornillos M3x10, con tuerca si no se ha realizado rosca en el
    cuerpo.  
13. Poner el Arduino sobre la base y atornillarlo con tornillos M3x10.  
14. Conectar los diferentes cables según el esquemático proporcionado.

### Conexión eléctrica ###

Seguir el montaje detallado en la carpeta `brd/`.

### Firmware ###

El Arduino deberá tener cargado el firmware incluido en la carpeta
`src/rover_base/`.

### Bugs ###

Se han observado los siguientes problemas:

-   Los servomotores pueden no girar con un factor de servicio menor al 50%.

## Enlaces externos ##

Este proyecto también está presente en:

-   [Thingiverse](http://www.thingiverse.com/thing:779589).

## Créditos ##

Proyecto realizado por Taller de Inventores 2015, representado por:

-   kwendenarmo <kwendenarmo@akornsys-rdi.net>
