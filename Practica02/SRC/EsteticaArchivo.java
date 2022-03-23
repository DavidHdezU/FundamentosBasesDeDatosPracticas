package SRC;

import java.time.LocalTime;
import java.util.*;

public class EsteticaArchivo extends LeeryEscribir {
    public EsteticaArchivo() {
        super("Esteticas.csv");
    }

    public void escribeEstetica(ArrayList<Estetica> esteticas) {
        StringBuilder lineas = new StringBuilder();
        for (Estetica foo : esteticas) {
            lineas.append(foo + "\n");
        }
        super.escribeArchivo(lineas.toString());
    }

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
