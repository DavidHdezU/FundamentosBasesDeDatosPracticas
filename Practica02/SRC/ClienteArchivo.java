package SRC;

import java.util.*;

/**
 * Clase para manejar la lectura y escritura de objetos tipo {@link Cliente} en formato de archivo CSV. 
 * Subclase de {@link LeeryEscribir}.
 * @author  David Hernández Uriostegui
 * @version 22.3.22
 * @see     Cliente
 * @see     LeeryEscribir
 */
public class ClienteArchivo extends LeeryEscribir{

    /**
     * Constructor de ClienteArchivo. No recibe parametros.
     * @see LeeryEscribir#LeeryEscribir(String)
     */
    public ClienteArchivo() {
        super("Clientes.csv");
    }

    
    /**
     * Escribe el objeto Cliente en el archivo. Recibe una {@code ArrayList<Cliente>} que contiene los
     * distintos Clientes a escribir.
     * @param clientes los objetos Cliente a escribir en el archivo
     * @see             LeeryEscribir#escribeArchivo(String)
     */
    public void escribeCliente(ArrayList<Cliente> clientes) {
        StringBuilder lineas = new StringBuilder();
        for (Cliente o : clientes) {
            lineas.append(o + "\n");
        }
        super.escribeArchivo(lineas.toString());
    }

    /**
     * Lee el archivo CSV que contiene los objetos Cliente y regresa un {@code ArrayList<Cliente>} con 
     * ellas.
     * @return el arreglo de clientes 
     * @throws ArchivoNoExiste
     */
    public ArrayList<Cliente> leeClientes() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<Cliente> clientes = new ArrayList<>();

        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                clientes.add(obtenCliente(lineas[i]));
            }
        }
	    return clientes;
    }

    /**
     * Metodo para procesar las lineas del archivo CSV que contienen los Clientes. 
     * Regresa un objeto tipo Cliente.
     * @param cadenaCliente la representacion del objeto Cliente 
     * @return un objeto cadenaCliente
     * @see    Cliente#toString()
     */
    private Cliente obtenCliente(String cadenaCliente) {
        String linea[] = cadenaCliente.trim().split(",");
        int id = Integer.parseInt(linea[0]);
        String nombre_cliente = linea[1];
        String apellido_paterno = linea[2];
        String apellido_materno = linea[3];
        String curp = linea[4];
        String correo = linea[5];
        String domicilio = linea[6];
        String codigo_postal = linea[7];


        if (linea.length > 8){ // Aquí sabemos que existe una mascota por lo menos
            MascotaArchivo archivo = new MascotaArchivo();
            ArrayList<Mascota> mascotas = new ArrayList<>();
            try{
                mascotas = archivo.leeMascotas();
            }catch(Exception e){
                System.out.println(e);
            }
            

            ArrayList<Mascota> mascotas_cliente = new ArrayList<>(); 

            for (int i = 8; i < linea.length; i++){
                int id_mascota = Integer.parseInt(linea[i]);
                for(Mascota m : mascotas){
                    if (m.getId() == id_mascota){
                        mascotas_cliente.add(m);
                    }
                }
            }

            return new Cliente(id, nombre_cliente, apellido_paterno, apellido_materno, curp, correo, domicilio, codigo_postal, mascotas_cliente);

            
        }

        return new Cliente(id, nombre_cliente, apellido_paterno, apellido_materno, curp, correo, domicilio, codigo_postal);
    }
    
}

