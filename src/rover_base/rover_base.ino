/* Librerias */
#include <DistanceGP2Y0A21YK.h>
#include <ArduinoFacil.h>


/* Declaraciones */
declaraDistancia


/* Conexiones */
// 0    Reservado                  // 10   Motor 2 (derecho) bw
// 1    Reservado                  // 11   
// 2    Pulsador modo              // 12   
// 3    Luz frontal                // 13   Reservado
// 4    Led de estado              // A0   Sensor distancia
// 5    Motor 1 (derecho) bw       // A1   Sensor derecho luz
// 6    Motor 1 (derecho) fw       // A2   Sensor izquierdo luz
// 7                               // A3   Sensor derecho suelo
// 8                               // A4   Sensor izquierdo suelo
// 9    Motor 2 (derecho) fw       // A5   


/* Preparacion */
comienzoPreparacion
    iniciaPuerto
    estableceComoEntrada(2)     // pulsador
    estableceComoSalida(3)      // led frontales
    estableceComoSalida(4)      // led de estado
    estableceComoSalida(5)      // motor dch retroceso
    estableceComoSalida(6)      // motor dch avance
    estableceComoSalida(9)      // motor izq avance
    estableceComoSalida(10)     // motor izq retroceso
    iniciaDistancia(A0)         // sensor distancia
    estableceComoEntrada(A3)    // sensor suelo dch
    estableceComoEntrada(A4)    // sensor suelo izq
    generaSemilla(entradaAnalogica(A0))
finPreparacion


/* Receta */
comienzoReceta
    creaVariable(tiempo)
    creaVariable(prog)

    // Inicia el programa, esperando a que se pulse el botón o expiren 5 segundos
    enciende(4)
    esperaMientrasQue (cronometro esMenor que 5000 y entrada(2) esta ACTIVA) finEsperaMientrasQue
    si cronometro esMenor que 5000 entonces
        guardaValor(-1, prog)
    finSi
    apaga(4)
    espera(0.1)
    si prog noEsIgual a 0 entonces // El botón se ha pulsado
        
        // LEE PROGRAMA
        guardaValor(0, prog)
        espera(0.25)
        guardaValor(cronometro,tiempo)
        repetirMientrasQue(entrada(2) esta INACTIVA) entonces
            si (tiempo + 1000) esMenor que cronometro entonces
                guardaValor(cronometro,tiempo)
                enciende(4)
                incrementaValor(1,prog)
                espera(0.25)
                apaga(4)
            finSi
        finRepetirMientrasQue
        espera(0.5)
        repetir(i, prog)
            espera(0.25)
            enciende(4)
            espera(0.25)
            apaga(4)
        finRepetir
        espera(0.5)
        
        //PROGRAMA SIGUELUZ
        si prog esIgual a 1 entonces
            creaVariable(referencia_ldr_dch)
            creaVariable(valor_ldr_dch)
            creaVariable(diferencia_dch)
            creaVariable(referencia_ldr_izq)
            creaVariable(valor_ldr_izq)
            creaVariable(diferencia_izq)
            
            guardaValor(entradaAnalogica(A1), referencia_ldr_dch)
            guardaValor(entradaAnalogica(A2), referencia_ldr_izq)
            espera(0.1)
            porSiempre
                guardaValor(entradaAnalogica(A1), valor_ldr_dch)
                guardaValor(referencia_ldr_dch - valor_ldr_dch, diferencia_dch)
                guardaValor(entradaAnalogica(A2), valor_ldr_izq)
                guardaValor(referencia_ldr_izq - valor_ldr_izq, diferencia_izq)
                si diferencia_dch esMayor que (diferencia_izq + 100) entonces //gira a la derecha
                    enciende(4)
                    apaga(5)
                    enciendeConValor(6, 100) //rapido
                    apaga(10)
                    enciendeConValor(9, 40) //lento
                siSiNo diferencia_izq esMayor que (diferencia_dch + 100) entonces //gira a la izquierda
                    enciende(4)
                    apaga(5)
                    enciendeConValor(6, 50) //lento
                    apaga(10)
                    enciendeConValor(9, 85) //rapido
                siSiNo (diferencia_dch + diferencia_dch) esMayor que 200 entonces //sigue recto
                    enciende(4)
                    apaga(5)
                    enciendeConValor(6, 100) //rapido
                    apaga(10)
                    enciendeConValor(9, 85) //rapido
                siNo
                    apaga(4)
                    apaga(5)
                    apaga(6)
                    apaga(10)
                    apaga(9)
                finSi
                espera(0.05)
            finPorSiempre
        
        //PROGRAMA EVITA OBSTÁCULOS
        siSiNo prog esIgual a 2 entonces
            creaVariable(valor_distancia)
            
            porSiempre
                guardaValor(distancia, valor_distancia)
                si valor_distancia esMayor que 10 entonces //sigue recto
                    apaga(4)
                    apaga(5)
                    enciendeConValor(6, 75) //medio
                    apaga(10)
                    enciendeConValor(9, 64) //medio
                siNo //retrocede y gira
                    enciende(4)
                    apaga(5)
                    apaga(6)
                    apaga(9)
                    apaga(10)
                    espera(0.25)
                    enciendeConValor(5, 75) //retroceso
                    enciendeConValor(10, 67) //retroceso
                    espera(0.25)
                    si aleatorio(100) % 2 esIgual a 1 entonces
                        apaga(10)
                        enciendeConValor(9, 64) //medio
                    siNo
                        apaga(5)
                        enciendeConValor(6, 75) //medio
                    finSi
                    espera(0.5)
                finSi 
                espera(0.25)
                
            finPorSiempre
        
        //PROGRAMA SIGUELÍNEAS
        siSiNo prog esIgual a 3 entonces
            creaVariable(suelo_dch)
            creaVariable(suelo_izq)
            
            porSiempre
                guardaValor(entrada(A3), suelo_dch)
                guardaValor(entrada(A4), suelo_izq)
                si (suelo_dch esta ACTIVA y suelo_izq esta INACTIVA) entonces //gira a la izquierda
                    enciende(4)
                    apaga(5)
                    enciendeConValor(6, 50) //lento
                    apaga(10)
                    enciendeConValor(9, 85) //rapido
                siSiNo (suelo_izq esta ACTIVA y suelo_dch esta INACTIVA) entonces //gira a la derecha
                    enciende(4)
                    apaga(5)
                    enciendeConValor(6, 100) //rapido
                    apaga(10)
                    enciendeConValor(9, 40) //lento
                siSiNo (suelo_dch esta INACTIVA y suelo_izq esta INACTIVA) entonces //sigue recto
                    apaga(4)
                    apaga(5)
                    enciendeConValor(6, 100) //rapido
                    apaga(10)
                    enciendeConValor(9, 85) //rapido
                siNo
                    apaga(4)
                    apaga(5)
                    apaga(6)
                    apaga(9)
                    apaga(10)
                finSi
                espera(0.05)
            finPorSiempre
        
        //PROGRAMA REACTIVO LUZ
        siSiNo prog esIgual a 4 entonces
            creaVariable(valor_medio)
            
            porSiempre
                guardaValor((entradaAnalogica(A1) + entradaAnalogica(A2)) / 2, valor_medio)
                si valor_medio esMayor que 600 entonces
                    apaga(3)
                siNo
                    enciende(3)
                finSi
                espera(0.05)
            finPorSiempre
        
        //PROGRAMA NO VALIDO
        siNo
          porSiempre
              espera(0.1)
              enciende(4)
              espera(0.1)
              apaga(4)
          finPorSiempre
        finSi
        esperaMientrasQue CIERTO finEsperaMientrasQue
    siNo //botón no pulsado
        porSiempre
              espera(0.5)
              enciende(4)
              espera(0.5)
              apaga(4)
              espera(0.1)
              enciende(4)
              espera(0.1)
              apaga(4)
              espera(0.1)
              enciende(4)
              espera(0.1)
              apaga(4)
        finPorSiempre
    finSi
finReceta

