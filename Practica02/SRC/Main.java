/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package SRC;

import java.util.ArrayList;
import java.util.InputMismatchException;
import java.util.Scanner;

/**
 * Clase Main que sirve de ejemplo para lo que van a entregar en la practica 2
 * @author Ricardo Badillo Macias
 * @version 16/03/2022
 */
public class Main{

    public static void escribeClientes() {
        Scanner s = new Scanner(System.in);
        Scanner s1 = new Scanner(System.in);
        int op = 0;
        int j;
        boolean found;
        ArrayList<Cliente> operadores = new ArrayList<>();
        ClienteArchivo archivo = new ClienteArchivo();

        System.out.println("Cargando datos de Operadores...");
        try{
            operadores = archivo.leeOperadores();
            System.out.println("Listo...");
        }catch(Exception e){
            System.out.println(e);
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

                        operadores.add(new Cliente(id ,nombre_cliente ,apellido_paterno,apellido_materno, curp ,correo , domicilio, codigo_postal));
                    break;

                    case 2:
                        System.out.println("----------------------------------");
                        for(Cliente cl : operadores){
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

                        while (j < operadores.size() && !found){
                            if (operadores.get(j).getId() == id){
                                found = true;
                            }
                            j++;
                        }
                        
                        if(!found){
                            System.out.println("Registro no encontrado :( ");
                        }else{
                            System.out.println(operadores.get(j-1));
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 4:
                        found = false;
                        System.out.print("Ingresa el id del cliente a eliminar : ");
                        id = s.nextInt();
                        System.out.println("----------------------------------");
                        j = 0;

                        while (j < operadores.size() && !found){
                            if (operadores.get(j).getId() == id){
                                found = true;
                                operadores.remove(j);
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

                        while (j < operadores.size() && !found){
                            if (operadores.get(j).getId() == id){
                                
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
                                
                                operadores.set(j, new Cliente(id ,nombre_cliente ,apellido_paterno,apellido_materno, curp ,correo , domicilio, codigo_postal));
                                found = true;
                            }
                            j++;
                        }
                        
                        if(!found){
                        System.out.println("El registro no fue encontrado :( ");
                        }else{
                        System.out.println("El registro se ha actualizado con éxito....! ");
                        }
                        System.out.println("----------------------------------");
                    break;

                    case 6:
                        if(!operadores.isEmpty()){
                            System.out.println("Guardando datos de operadores...");
                            archivo.escribeCliente(operadores);
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
            System.out.println("Ingrese el archivo que desea cargar\n 1-Clientes\n");
            System.out.println("O bien ingrese 6 para salir");
            try{
                opcion = input.nextInt();
            }catch (InputMismatchException e) {
		        input.next();
		    System.out.println("Ingresa un número como opción");
            }

            if (opcion > 0 && opcion < 7){
                switch(opcion){
                    case 1:
                        escribeClientes();
                        break;
                    case 6:
                        bandera = false;
                        System.out.println("Saliendo del sistema...\nHasta pronto.");
                }

            }
        }while(bandera);
    }  
}
