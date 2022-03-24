package SRC;

import java.util.*;
import java.time.LocalTime;

/**
 * Clase para manejar la lectura y escritura de objetos tipo {@link Estetica} en formato de archivo CSV. 
 * Subclase de {@link LeeryEscribir}.
 * @author  Diego Padilla
 * @version 22.3.22
 * @see     Estetica
 * @see     LeeryEscribir
 */
public class EsteticaArchivo extends LeeryEscribir {
    /**
     * Constructor de EsteticaArchivo. No recibe parametros.
     * @see LeeryEscribir#LeeryEscribir(String)
     */
    public EsteticaArchivo() {
        super("Esteticas.csv");
    }

    /**
     * Escribe el objeto Estetica en el archivo. Recibe una {@code ArrayList<Estetica>} que contiene las
     * distintas Esteticas a escribir.
     * @param esteticas los objetos Estetica a escribir en el archivo
     * @see             LeeryEscribir#escribeArchivo(String)
     */
    public void escribeEstetica(ArrayList<Estetica> esteticas) {
        StringBuilder lineas = new StringBuilder();
        for (Estetica foo : esteticas) {
            lineas.append(foo + "\n");
        }
        super.escribeArchivo(lineas.toString());
    }

    /**
     * Lee el archivo CSV que contiene los objetos Estetica y regresa un {@code ArrayList<Estetica>} con 
     * ellas.
     * @return el arreglo de esteticas 
     * @throws ArchivoNoExiste
     */
    public ArrayList<Estetica> leeEsteticas() throws ArchivoNoExiste {
        String[] lineas = super.leeArchivo();
        ArrayList<Estetica> esteticas = new ArrayList<>();
        
        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                esteticas.add(obtenEstetica(lineas[i]));
            } 
        }
        return esteticas;
    }

    /**
     * Metodo para procesar las lineas del archivo CSV que contienen las Esteticas. 
     * Regresa un objeto tipo Estetica.
     * @param cadenaEstetica la representacion del objeto estetica 
     * @return un objeto Estetica
     * @see    Estetica#toString()
     */
    private Estetica obtenEstetica(String cadenaEstetica) {
        String[] linea  = cadenaEstetica.trim().split(",");
        String nombre   = linea[0];
        String estado   = linea[1];
        String calle    = linea[2];
        String numero   = linea[3];
        String cp       = linea[4];
        String telefono = linea[5];

        LocalTime[][] horarios = new LocalTime[7][2];

        for (int i = 6; i < linea.length; i++) {
            if ((i % 3) == 0)
                horarios[(i / 3) - 2] = new LocalTime[] {
                    LocalTime.parse(linea[i+1]),
                    LocalTime.parse(linea[i+2])
                };
        }

        return new Estetica(nombre, estado, calle, numero, cp, telefono, horarios);
    }
}
