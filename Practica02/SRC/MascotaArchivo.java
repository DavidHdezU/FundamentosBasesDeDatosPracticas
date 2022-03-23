package SRC;

import java.util.*;

public class MascotaArchivo extends LeeryEscribir{

    public MascotaArchivo() {
        super("Mascotas.csv");
    }

    public void escribeMascota(ArrayList<Mascota> mascotas) {
        StringBuilder lineas = new StringBuilder();
        for (Mascota m : mascotas) {
            lineas.append(m + "\n");
        }
        super.escribeArchivo(lineas.toString());
    }

    public ArrayList<Mascota> leeOperadores() throws ArchivoNoExiste {
        String lineas[] = super.leeArchivo();
        ArrayList<Mascota> mascotas = new ArrayList<>();

        for (int i = 0; i < lineas.length; i++) {
            if (!lineas[i].equals("null")) {
                mascotas.add(obtenMascota(lineas[i]));
            }
        }
	    return mascotas;
    }

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
            clientes = archivo.leeOperadores();
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


