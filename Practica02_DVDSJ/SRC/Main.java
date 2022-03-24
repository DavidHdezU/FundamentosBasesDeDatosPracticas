/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package SRC;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Clase Main que sirve para hacer consultas
 * @author David Hernández Uriostegui
 * @version 22.3.22
 */
public class Main{

    /**
     * Método para poder hacer consultas y modificaciones sobre los MedicosVeterinario
     */
    public static void escribeMedicos() {
        Scanner s = new Scanner(System.in);
        Scanner s1 = new Scanner(System.in);
        int op = 0;
        int j;
        boolean found;
        boolean overwrite_medicos = false;
        
        ArrayList<MedicoVeterinario> medicos = new ArrayList<>();
        MedicoVeterinarioArchivo archivo = new MedicoVeterinarioArchivo();
        

        System.out.println("Cargando datos de clientes...");
        try{
            medicos = archivo.leeMedicos();
            System.out.println("Listo...");
        }catch(Exception e){
            System.out.println(e + "\n Creando archivo MedicosVeterinarios.csv");
        }
        

        do{
            System.out.println("1.Agrega");
            System.out.println("2.Consulta");
            System.out.println("3.Busca");
            System.out.println("4.Eliminar");
            System.out.println("5.Editar");
            System.out.println("6. Salir");
            System.out.println("Selecciona una opción : ");

            try{
                op = s.nextInt();
            }catch (InputMismatchException e) {
                s.next();
                System.out.println("Ingresa un número como opción");
            }
            
            if(op > 0 && op < 7){
                switch(op){
                    case 1:
                        System.out.print("Ingresa el nombre del médico veterinario: ");
                        String nombre = s1.nextLine();

                        System.out.print("Ingresa el apellido paterno del médico veterinario: ");
                        String apellido_p = s1.nextLine();

                        System.out.print("Ingresa el apellido materno del médico veterinario: ");
                        String apellido_m = s1.nextLine();

                        System.out.print("Ingresa el RFC del médico veterinario: ");
                        String rfc = s1.nextLine();

                        System.out.print("Ingresa el correo del médico veterinario: ");
                        String correo = s1.nextLine();
                        
                        System.out.print("Ingresa el turno del médico veterinario: ");
                        char turno = s1.nextLine().charAt(0);

                        overwrite_medicos = true;

                        medicos.add(new MedicoVeterinario(nombre, apellido_p, apellido_m, rfc, correo, turno));
                        System.out.println("----------------------------------");

                        
                    break;

                    case 2:
                        System.out.println("----------------------------------");
                        for(MedicoVeterinario m : medicos){
                            System.out.println(m.toString());
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 3:
                        found = false;
                        System.out.print("Ingresa el rfc del médico veterinario a buscar: ");
                        rfc = s1.nextLine();
                        System.out.println("----------------------------------");
                        
                        j = 0;

                        while (j < medicos.size() && !found){
                            if (medicos.get(j).getRfc() == rfc){
                                found = true;
                            }
                            j++;
                        }
                        
                        if(!found){
                            System.out.println("Registro no encontrado :( ");
                        }else{
                            System.out.println(medicos.get(j-1));
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 4:
                        found = false;
                        overwrite_medicos = true;
                        System.out.print("Ingresa el id del médico veterinario a eliminar : ");
                        rfc = s1.nextLine();
                        System.out.println("----------------------------------");
                        j = 0;

                        while (j < medicos.size() && !found){
                            if (medicos.get(j).getRfc() == rfc){
                                found = true;
                                medicos.remove(j);
                            }
                            j++;
                        }

                        if(!found){
                            System.out.println("El registro no fue encontrado :( ");
                        }else{
                            overwrite_medicos = true;
                            System.out.println("El registro se ha eliminado con éxito....! ");
                        }

                        System.out.println("----------------------------------");
                    break;

                    case 5:
                        found = false;
                        System.out.print("Ingresa el id del cliente a editar : ");
                        rfc = s1.nextLine();
                        System.out.println("----------------------------------");
                        j = 0;

                        while (j < medicos.size() && !found){
                            if (medicos.get(j).getRfc() == rfc){
                                System.out.print("Ingresa el nuevo nombre del médico veterinario: ");
                                nombre = s1.nextLine();

                                System.out.print("Ingresa el nuevoapellido paterno del médico veterinario: ");
                                apellido_p = s1.nextLine();

                                System.out.print("Ingresa el nuevo apellido materno del médico veterinario: ");
                                apellido_m = s1.nextLine();

                                System.out.print("Ingresa el nuevoRFC del médico veterinario: ");
                                rfc = s1.nextLine();

                                System.out.print("Ingresa el nuevo correo del médico veterinario: ");
                                correo = s1.nextLine();
                                
                                System.out.print("Ingresa el nuevo turno del médico veterinario: ");
                                turno = s1.nextLine().charAt(0);

                                found = true;
                                medicos.set(j, new MedicoVeterinario(nombre, apellido_p, apellido_m, rfc, correo, turno));
                            }
                            j++;
                        }
                        
                        if(!found){
                            System.out.println("El registro no fue encontrado :( ");
                        }else{
                            System.out.println("El registro se ha actualizado con éxito....! ");
                            overwrite_medicos = true;
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 6:
                        if(overwrite_medicos){
                            System.out.println("Guardando datos de MedicosVeterinarios...");
                            archivo.escribeMedico(medicos);
                            System.out.println("Datos guardados");
                        }
                        
                        
                        System.out.println("Cerrando archivo...\n");

                    break;
                        
                }
            }
        }while(op!=6);
    }
    /**
     * Método para poder hacer consultas y modificaciones sobre las Mascotas
     */
    public static void escribeMascotas() {
        Scanner s = new Scanner(System.in);
        Scanner s1 = new Scanner(System.in);
        int op = 0;
        int j;
        boolean found;
        boolean overwrite_clientes = false;
        boolean overwrite_mascotas = false;
        ArrayList<Cliente> clientes = new ArrayList<>();
        ClienteArchivo archivo = new ClienteArchivo();
        MascotaArchivo archivo_mascotas = new MascotaArchivo();
        ArrayList<Mascota> mascotas = new ArrayList<>();

        System.out.println("Cargando datos de clientes...");
        try{
            clientes = archivo.leeClientes();
            System.out.println("Listo...");
        }catch(Exception e){
            System.out.println(e + "\n Creando archivo Clientes.csv");
        }
        try{
            mascotas = archivo_mascotas.leeMascotas();
        }catch(Exception e){
            System.out.println(e + "\n Creando archivo Mascotas.csv");
        }

        do{
            System.out.println("1.Agrega");
            System.out.println("2.Consulta");
            System.out.println("3.Busca");
            System.out.println("4.Eliminar");
            System.out.println("5.Editar");
            System.out.println("6. Salir");
            System.out.println("Selecciona una opción : ");

            try{
                op = s.nextInt();
            }catch (InputMismatchException e) {
                s.next();
                System.out.println("Ingresa un número como opción");
            }
            
            if(op > 0 && op < 7){
                switch(op){
                    case 1:
                        System.out.print("Ingresa el id de la mascota: ");
                        int id = s.nextInt();

                        System.out.print("Ingresa la edad de la mascota: ");
                        int edad = s.nextInt();

                        System.out.print("Ingresa nombre de la mascota: ");
                        String nombre = s1.nextLine();

                        System.out.print("Ingresa el peso de la mascota: ");
                        float peso = s.nextFloat();

                        System.out.print("Ingresa la raza de la mascota: ");
                        String raza = s1.nextLine();
                        
                        System.out.print("Ingresa el id del dueño: ");
                        int id_dueño = s.nextInt();

                        

                        boolean found_owner = false;
                        j = 0;

                        while(j < clientes.size() && !found_owner){
                            if (clientes.get(j).getId() == id_dueño){
                                found_owner = true;
                            }
                            j++;
                        }

                        if(found_owner){
                            overwrite_mascotas = true;
                            overwrite_clientes = true;
                            Mascota nueva = new Mascota(id, nombre, edad, peso, raza, clientes.get(j-1));
                            ArrayList<Mascota> mascotas_cliente = clientes.get(j-1).getMascotas();
                            clientes.get(j-1).setMascotas(mascotas_cliente);
                            nueva.setDueño(clientes.get(j-1));
                            mascotas.add(nueva);
                        }else{
                            System.out.println("No se pudo agregar a la mascota ya que no se encontró el dueño :(");
                        }
                        System.out.println("----------------------------------");

                        
                    break;

                    case 2:
                        System.out.println("----------------------------------");
                        for(Mascota m : mascotas){
                            System.out.println(m.toString());
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 3:
                        found = false;
                        System.out.print("Ingresa el id de la mascota a buscar : ");
                        id = s.nextInt();
                        System.out.println("----------------------------------");
                        
                        j = 0;

                        while (j < mascotas.size() && !found){
                            if (mascotas.get(j).getId() == id){
                                found = true;
                            }
                            j++;
                        }
                        
                        if(!found){
                            System.out.println("Registro no encontrado :( ");
                        }else{
                            System.out.println(mascotas.get(j-1));
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 4:
                        found = false;
                        overwrite_clientes = true;
                        System.out.print("Ingresa el id de la mascota a eliminar : ");
                        id = s.nextInt();
                        System.out.println("----------------------------------");
                        j = 0;

                        while (j < mascotas.size() && !found){
                            if (mascotas.get(j).getId() == id){
                                found = true;

                                 // Tenemos que borrar a todas las máscotas también
                                Cliente dueño = mascotas.get(j).getDueño();

                                    
                                

                                boolean pet_found = false;
                                int i = 0;
                                while(i < clientes.size() && !pet_found){
                                    if(dueño.getId() == clientes.get(i).getId()){
                                        ArrayList<Mascota> mascotas_dueño = clientes.get(i).getMascotas();
                                        for(int k = 0; k < mascotas_dueño.size(); k++){
                                            if (mascotas_dueño.get(k).getId() == id){
                                                mascotas.remove(k);

                                                clientes.get(i).setMascotas(mascotas_dueño);
                                                pet_found = true;
                                                found = true;
                                            }
                                        }
                                    i++;
                                    }
                                }
                                mascotas.remove(j);
                            }
                            j++;
                        }

                        if(!found){
                            System.out.println("El registro no fue encontrado :( ");
                        }else{
                            overwrite_mascotas = true;
                            System.out.println("El registro se ha eliminado con éxito....! ");
                        }

                        System.out.println("----------------------------------");
                    break;

                    case 5:
                        found = false;
                        System.out.print("Ingresa el id del cliente a editar : ");
                        id = s.nextInt();
                        System.out.println("----------------------------------");
                        j = 0;

                        while (j < mascotas.size() && !found){
                            if (mascotas.get(j).getId() == id){
                                
                                System.out.print("Ingresa el nuevo id de la mascota: ");
                                id = s.nextInt();

                                System.out.print("Ingresa la nueva edad de la mascota: ");
                                edad = s.nextInt();

                                System.out.print("Ingresa el nuevo nombre de la mascota: ");
                                nombre = s1.nextLine();

                                System.out.print("Ingresa el nuevo peso de la mascota: ");
                                peso = s1.nextFloat();

                                System.out.print("Ingresa la nueva raza de la mascota: ");
                                raza = s1.nextLine();
                                
                                
                                
                                mascotas.set(j, new Mascota(id, nombre, edad, peso, raza, mascotas.get(j).getDueño()));
                                found = true;
                            }
                            j++;
                        }
                        
                        if(!found){
                            System.out.println("El registro no fue encontrado :( ");
                        }else{
                            System.out.println("El registro se ha actualizado con éxito....! ");
                            overwrite_mascotas = true;
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 6:
                        if(overwrite_clientes){
                            System.out.println("Guardando datos de Clientes...");
                            archivo.escribeCliente(clientes);
                            System.out.println("Datos guardados");
                        }
                        
                        if(overwrite_mascotas){
                            System.out.println("Guardando datos de Mascotas...");
                            archivo_mascotas.escribeMascota(mascotas);
                            System.out.println("Datos guardados");
                        }
                        System.out.println("Cerrando archivo...\n");

                    break;
                        
                }
            }
        }while(op!=6);
    }

    /**
     * Método para poder hacer consultas y modificaciones sobre los Clientes
     */
    public static void escribeClientes() {
        Scanner s = new Scanner(System.in);
        Scanner s1 = new Scanner(System.in);
        int op = 0;
        int j;
        boolean found;
        boolean overwrite_clientes = false;
        boolean overwrite_mascotas = false;
        ArrayList<Cliente> clientes = new ArrayList<>();
        ClienteArchivo archivo = new ClienteArchivo();
        MascotaArchivo archivo_mascotas = new MascotaArchivo();
        ArrayList<Mascota> mascotas = new ArrayList<>();

        System.out.println("Cargando datos de clientes...");
        try{
            clientes = archivo.leeClientes();
            System.out.println("Listo...");
        }catch(Exception e){
            System.out.println(e + "\n Creando archivo Clientes.csv");
        }
        try{
            mascotas = archivo_mascotas.leeMascotas();
        }catch(Exception e){
            System.out.println(e + "\n Creando archivo Mascotas.csv");
        }

        do{
            System.out.println("1.Agrega");
            System.out.println("2.Consulta");
            System.out.println("3.Busca");
            System.out.println("4.Eliminar");
            System.out.println("5.Editar");
            System.out.println("6. Salir");
            System.out.println("Selecciona una opción : ");

            try{
                op = s.nextInt();
            }catch (InputMismatchException e) {
                s.next();
                System.out.println("Ingresa un número como opción");
            }
            
            if(op > 0 && op < 7){
                switch(op){
                    case 1:
                        overwrite_clientes = true;
                        System.out.print("Ingresa el id del cliente : ");
                        int id = s.nextInt();

                        System.out.print("Ingresa nombre : ");
                        String nombre_cliente = s1.nextLine();

                        System.out.print("Ingresa apellido paterno : ");
                        String apellido_paterno = s1.nextLine();

                        System.out.print("Ingresa apellido materno : ");
                        String apellido_materno = s1.nextLine();
                        
                        System.out.print("Ingresa CURP del cliente: ");
                        String curp = s1.nextLine();

                        System.out.print("Ingresa un correo : ");
                        String correo = s1.nextLine();

                        System.out.print("Ingresa el domicilio : ");
                        String domicilio = s1.nextLine();

                        System.out.print("Ingresa el código postal : ");
                        String codigo_postal = s1.nextLine();

                        clientes.add(new Cliente(id ,nombre_cliente ,apellido_paterno,apellido_materno, curp ,correo , domicilio, codigo_postal));
                    break;

                    case 2:
                        System.out.println("----------------------------------");
                        for(Cliente cl : clientes){
                            System.out.println(cl.toString());
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 3:
                        found = false;
                        System.out.print("Ingresa el id del cliente a buscar : ");
                        id = s.nextInt();
                        System.out.println("----------------------------------");
                        
                        j = 0;

                        while (j < clientes.size() && !found){
                            if (clientes.get(j).getId() == id){
                                found = true;
                            }
                            j++;
                        }
                        
                        if(!found){
                            System.out.println("Registro no encontrado :( ");
                        }else{
                            System.out.println(clientes.get(j-1));
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 4:
                        found = false;
                        System.out.print("Ingresa el id del cliente a eliminar : ");
                        id = s.nextInt();
                        System.out.println("----------------------------------");
                        j = 0;

                        while (j < clientes.size() && !found){
                            if (clientes.get(j).getId() == id){
                                found = true;
                                overwrite_clientes = true;
                                 // Tenemos que borrar a todas las máscotas también
                                Cliente eliminado = clientes.get(j);

                                if(!eliminado.getMascotas().isEmpty()){
                                    for(int i = 0; i < mascotas.size(); i++){
                                        if (mascotas.get(i).getDueño().getId() == eliminado.getId()){
                                            mascotas.remove(i);
                                            overwrite_mascotas = true;
                                        }
                                    }

                                }
                                clientes.remove(j);


                            }
                            j++;
                        }

                        if(!found){
                            System.out.println("El registro no fue encontrado :( ");
                        }else{
                            System.out.println("El registro se ha eliminado con éxito....! ");
                        }

                        System.out.println("----------------------------------");
                    break;

                    case 5:
                        found = false;
                        System.out.print("Ingresa el id del cliente a editar : ");
                        id = s.nextInt();
                        System.out.println("----------------------------------");
                        j = 0;

                        while (j < clientes.size() && !found){
                            if (clientes.get(j).getId() == id){
                                
                                System.out.print("Ingresa nuevo nombre : ");
                                nombre_cliente = s1.nextLine();

                                System.out.print("Ingresa nuevo apellido paterno : ");
                                apellido_paterno = s1.nextLine();

                                System.out.print("Ingresa nuevo apellido materno : ");
                                apellido_materno = s1.nextLine();

                                System.out.print("Ingresa nuevo CURP del cliente: ");
                                curp = s1.nextLine();

                                System.out.print("Ingresa nuevo correo : ");
                                correo = s1.nextLine();

                                System.out.print("Ingresa nuevo domicilio : ");
                                domicilio = s1.nextLine();

                                System.out.print("Ingresa nuevo código postal : ");
                                codigo_postal = s1.nextLine();
                                
                                clientes.set(j, new Cliente(id ,nombre_cliente ,apellido_paterno,apellido_materno, curp ,correo , domicilio, codigo_postal));
                                found = true;
                            }
                            j++;
                        }
                        
                        if(!found){
                            System.out.println("El registro no fue encontrado :( ");
                        }else{
                            System.out.println("El registro se ha actualizado con éxito....! ");
                            overwrite_clientes = true;
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 6:
                        if(overwrite_clientes){
                            System.out.println("Guardando datos de Clientes...");
                            archivo.escribeCliente(clientes);
                            System.out.println("Datos guardados");
                        }
                        
                        if(overwrite_mascotas){
                            System.out.println("Guardando datos de Mascotas...");
                            archivo_mascotas.escribeMascota(mascotas);
                            System.out.println("Datos guardados");
                        }
                        System.out.println("Cerrando archivo...\n");

                    break;
                        
                }
            }
        }while(op!=6);
    }




    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int opcion = 0;
        boolean bandera;
        Scanner input = new Scanner(System.in);
        do{
            bandera = true;
            System.out.println("Ingrese el archivo que desea cargar\n 1-Clientes\n 2-Mascotas\n 3-Médicos Veterinarios");
            System.out.println("\nO bien ingrese 7 para salir");
            try{
                opcion = input.nextInt();
            }catch (InputMismatchException e) {
		        input.next();
		    System.out.println("Ingresa un número como opción");
            }

            if (opcion > 0 && opcion < 8){
                switch(opcion){
                    case 1:
                        escribeClientes();
                    break;
                    case 2:
                        escribeMascotas();
                    break;
                    case 3:
                        escribeMedicos();
                    break;
                    case 7:
                        bandera = false;
                        System.out.println("Saliendo del sistema...\nHasta pronto.");
                }

            }
        }while(bandera);
    }  
}
