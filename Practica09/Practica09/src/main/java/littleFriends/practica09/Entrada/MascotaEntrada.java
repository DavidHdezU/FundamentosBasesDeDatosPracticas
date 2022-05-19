package littleFriends.practica09.Entrada;

import java.io.*;
import java.util.List;

import littleFriends.practica09.Modelo.Mascota;
import littleFriends.practica09.Servicio.MascotaServicio;

/**
 * Clase auxiliar para realizar queries en la tabla mascota
 * @author David Hernández Uriostegui
 * @version 16-MAYO-2022
 */
public class MascotaEntrada {
    private BufferedReader br;
    private MascotaServicio consultador;

    /**
     * Constrcutor inicial
     */
    public MascotaEntrada(){
        this.br = new BufferedReader(new InputStreamReader(System.in));
        this.consultador = new MascotaServicio();
    }

    /**
     * Método auxiliar para actualizar una mascota
     */
    private void actualizaMascota(){
        Mascota mascota = null;
        String id_buscado;
        String idMascota, curp, nombreDueño, nombre, raza, especie;
        int edad;
        float peso;
        try{
            System.out.println("Ingrese el id de la mascota a modificar: ");
            id_buscado = br.readLine();

            System.out.println("Ingresa por favor los siguientes datos");


            System.out.println("idMascota: ");
            idMascota = br.readLine();

            System.out.println("curp: ");
            curp = br.readLine();

            System.out.println("nombreDueño: ");
            nombreDueño = br.readLine();

            System.out.println("nombre: ");
            nombre = br.readLine();

            System.out.println("edad: ");
            edad = Integer.parseInt(br.readLine());

            System.out.println("raza: ");
            raza = br.readLine();

            System.out.println("especie: ");
            especie = br.readLine();

            System.out.println("peso: ");
            peso = Float.parseFloat(br.readLine());

            

            mascota = new Mascota(idMascota, curp, nombreDueño, nombre, edad, raza, especie, peso);

            this.consultador.actualizarMascota(id_buscado, mascota);

        }catch(IOException io){
            System.out.println("Problemas al leer stdin");
        }catch(Exception e){
            System.out.println(e);
        }

        
    }

    /**
     * Método auxiliar para insertar una Mascota nueva
     */
    private void insertaMascota(){
        Mascota mascota = null;
        System.out.println("Ingresa por favor los siguientes datos");
        String idMascota, curp, nombreDueño, nombre, raza, especie;
        int edad;
        float peso;
        try{
            System.out.println("idMascota: ");
            idMascota = br.readLine();

            System.out.println("curp: ");
            curp = br.readLine();

            System.out.println("nombreDueño: ");
            nombreDueño = br.readLine();

            System.out.println("nombre: ");
            nombre = br.readLine();

            System.out.println("edad: ");
            edad = Integer.parseInt(br.readLine());

            System.out.println("raza: ");
            raza = br.readLine();

            System.out.println("especie: ");
            especie = br.readLine();

            System.out.println("peso: ");
            peso = Float.parseFloat(br.readLine());

            

            mascota = new Mascota(idMascota, curp, nombreDueño, nombre, edad, raza, especie, peso);

            this.consultador.insertarMascota(mascota);

        }catch(IOException io){
            System.out.println("Problemas al leer stdin");
        }catch(Exception e){
            System.out.println(e);
        }

        
    }

    /**
     * Método principal que se encarga de leer las queries mediante Standar Input
     */
    public void main(){
        int opcion = 0;
        boolean bandera;
        String idMascota;
        do{
            bandera = true;
            System.out.println("Actualmente estaŕas haciendo queries a la tabla mascota");
            System.out.println("Estas son las opciones existentes:");
            System.out.println("1 - Obten la lista de todos las mascotas existente");
            System.out.println("2 - Inserta una nueva mascota");
            System.out.println("3 - Busca una mascota por su id");
            System.out.println("4 - Actualiza los datos de una mascota");
            System.out.println("5 - Borra una mascota de la base de datos mediante su id");
            System.out.println("Ingrese una opción: ");
            System.out.println("O ingrese '6' para salir");

            try{
                opcion = Integer.parseInt(br.readLine());
            }catch(IOException e){
                System.out.println("Problema al leer la entrada");
            }

            if(opcion > 0 && opcion < 7){
                switch(opcion){
                    case 1:
                        try{
                            List<Mascota> mascotas = this.consultador.getMascotas();

                            for(Mascota mascota : mascotas){
                                System.out.println(mascota);
                            }
                        }catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    
                    case 2:
                        this.insertaMascota();
                        break;
                    
                    case 3:
                        Mascota mascota = null;
                        try{
                            System.out.println("Ingresa el id:");
                            idMascota = br.readLine();
                            mascota = this.consultador.getMascota(idMascota);
                            if(mascota != null){
                                System.out.println(mascota);
                            }else{
                                System.out.println("No se encontró ningúna mascota con el id proveido...\n");
                                
                            }
                        }catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    
                    case 4:
                        this.actualizaMascota();
                        break;
                    
                    case 5:
                        try{
                            System.out.println("Ingresa el curp:");
                            idMascota = br.readLine();
                            this.consultador.borrarMascota(idMascota);
                        }catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    
                    case 6:
                        bandera = false;
                        System.out.println("Saliendo de la tabla clientes");

                }
            }
        }while(bandera);





    }
}
