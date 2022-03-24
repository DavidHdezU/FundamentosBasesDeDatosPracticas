package SRC;

import java.util.*;

/**
 * Clase para manejar la lectura y escritura de objetos tipo {@link Mascota} en formato de archivo CSV. 
 * Subclase de {@link LeeryEscribir}.
 * @author  David Hernández Uriostegui
 * @version 22.3.22
 * @see     Mascota
 * @see     LeeryEscribir
 */
public class MascotaArchivo extends LeeryEscribir{

    /**
     * Constructor de MascotaArchivo. No recibe parametros.
     * @see LeeryEscribir#LeeryEscribir(String)
     */
    public MascotaArchivo() {
        super("Mascotas.csv");
    }

    /**
     * Escribe el objeto Mascota en el archivo. Recibe una {@code ArrayList<Mascota>} que contiene las
     * distintas Mascotas a escribir.
     * @param mascotas los objetos Mascota a escribir en el archivo
     * @see             LeeryEscribir#escribeArchivo(String)
     */
    public void escribeMascota(ArrayList<Mascota> mascotas) {
        StringBuilder lineas = new StringBuilder();
        for (Mascota m : mascotas) {
            lineas.append(m + "\n");
        }
        super.escribeArchivo(lineas.toString());
    }

    /**
     * Lee el archivo CSV que contiene los objetos Mascota y regresa un {@code ArrayList<Mascota>} con 
     * ellas.
     * @return el arreglo de mascotas 
     * @throws ArchivoNoExiste
     */
    public ArrayList<Mascota> leeMascotas() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<Mascota> mascotas = new ArrayList<>();

        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                mascotas.add(obtenMascota(lineas[i]));
            }
        }
	    return mascotas;
    }

    /**
     * Metodo para procesar las lineas del archivo CSV que contienen las Mascotas. 
     * Regresa un objeto tipo Mascotas.
     * @param cadenaEstetica la representacion del objeto estetica 
     * @return un objeto Mascotas
     * @see    Mascota#toString()
     */
    private Mascota obtenMascota(String cadenaMascota) {
        String linea[] = cadenaMascota.trim().split(",");

        int id =  Integer.parseInt(linea[0]);
        String nombre = linea[1];
        int edad = Integer.parseInt(linea[2]);
        float peso = Float.parseFloat(linea[3]);
        String raza = linea[4];

        // Se busca el dueño de la mascota    
        ClienteArchivo archivo = new ClienteArchivo();

        ArrayList<Cliente> clientes = new ArrayList<>();
        try{
            clientes = archivo.leeClientes();
        }catch(Exception e){
            System.out.println(e);
        }

        boolean found = false;
        int i = 0;
        while(!found){
            if (!clientes.get(i).getMascotas().isEmpty()){
                for (Mascota m : clientes.get(i).getMascotas()){
                    if(m.getId() == id){
                        found = true;
                    }
                }
            i++;
            }
        }

        return new Mascota(id, nombre, edad, peso, raza, clientes.get(i-1));
    }
    
}


