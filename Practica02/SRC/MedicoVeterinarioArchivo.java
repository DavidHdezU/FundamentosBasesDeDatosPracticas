package SRC;

import java.util.ArrayList;

/**
 * Clase para manejar la lectura y escritura de objetos tipo {@link MedicoVeterinario} en formato de archivo CSV. 
 * Subclase de {@link LeeryEscribir}.
 * @author  David Hernández Uriostegui
 * @version 22.3.22
 * @see     MedicoVeterinario
 * @see     LeeryEscribir
 */
public class MedicoVeterinarioArchivo extends LeeryEscribir{
    /**
     * Constructor de MedicoVeterinarioArchivo. No recibe parametros.
     * @see LeeryEscribir#LeeryEscribir(String)
     */
    public MedicoVeterinarioArchivo() {
        super("MedicosVeterinarios.csv");
    }

    /**
     * Escribe el objeto MedicoVeterinario en el archivo. Recibe una {@code ArrayList<MedicoVeterinario>} que contiene las
     * distintas Mascotas a escribir.
     * @param medicos los objetos MedicoVeterinario a escribir en el archivo
     * @see             LeeryEscribir#escribeArchivo(String)
     */
    public void escribeMedico(ArrayList<MedicoVeterinario> medicos) {
        StringBuilder lineas = new StringBuilder();
        for (MedicoVeterinario m : medicos) {
            lineas.append(m + "\n");
        }
        super.escribeArchivo(lineas.toString());
    }

    /**
     * Lee el archivo CSV que contiene los objetos MedicoVeterinario y regresa un {@code ArrayList<MedicoVeterinario>} con 
     * ellas.
     * @return el arreglo de medicos 
     * @throws ArchivoNoExiste
     */
    public ArrayList<MedicoVeterinario> leeMedicos() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<MedicoVeterinario> medicos = new ArrayList<>();

        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                medicos.add(obtenMascota(lineas[i]));
            }
        }
	    return medicos;
    }

    /**
     * Metodo para procesar las lineas del archivo CSV que contienen los MedicoVeterinario. 
     * Regresa un objeto tipo MedicoVeterinario.
     * @param cadenaMedico la representacion del objeto MedicoVeterinario 
     * @return un objeto MedicoVeterinario
     * @see    MedicoVeterinario#toString()
     */
    private MedicoVeterinario obtenMascota(String cadenaMedico) {
        String linea[] = cadenaMedico.trim().split(",");

        String nombre = linea[0];
        String apellido_p = linea[1];
        String apellido_m = linea[2];
        String rfc = linea[3];
        String correo = linea[4];
        char turno = linea[5].charAt(0);

        return new MedicoVeterinario(nombre, apellido_p, apellido_m, rfc, correo, turno);
        
    }
}
