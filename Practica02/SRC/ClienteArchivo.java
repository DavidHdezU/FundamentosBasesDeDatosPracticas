package SRC;

import java.util.*;

public class ClienteArchivo extends LeeryEscribir{

    public ClienteArchivo() {
        super("Clientes.csv");
    }

    public void escribeCliente(ArrayList<Cliente> clientes) {
        StringBuilder lineas = new StringBuilder();
        for (Cliente o : clientes) {
            lineas.append(o + "\n");
        }
        super.escribeArchivo(lineas.toString());
    }

    public ArrayList<Cliente> leeOperadores() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<Cliente> clientes = new ArrayList<>();

        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                clientes.add(obtenCliente(lineas[i]));
            }
        }
	    return clientes;
    }

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
                mascotas = archivo.leeOperadores();
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
