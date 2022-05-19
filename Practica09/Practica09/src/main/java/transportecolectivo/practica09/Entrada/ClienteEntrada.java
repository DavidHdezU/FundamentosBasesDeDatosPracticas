package transportecolectivo.practica09.Entrada;

import java.io.*;
import java.util.List;

import transportecolectivo.practica09.Modelo.Cliente;
import transportecolectivo.practica09.Servicio.ClienteServicio;

/**
 * Clase auxiliar para realizar queries en la tabla cliente
 * @author David Hernández Uriostegui
 * @version 16-MAYO-2022
 */
public class ClienteEntrada {
    private BufferedReader br;
    private ClienteServicio consultador;

    /**
     * Constructor inicial
     */
    public ClienteEntrada(){
        this.br = new BufferedReader(new InputStreamReader(System.in));
        this.consultador = new ClienteServicio();
    }

    /**
     * Método auxiliar para actualizar un cliente
     */
    private void actualizaCliente(){
        Cliente cliente = null;
        String curp_buscado;
        String curp, nombre, apellidoPaterno, apellidoMaterno, numero, codigoPostal, calle, estado, telefono;
        try{
            System.out.println("Ingrese el curp del cliente a modificar: ");
            curp_buscado = br.readLine();

            System.out.println("Ingresa por favor los siguientes datos");
            System.out.println("curp: ");
            curp = br.readLine();

            System.out.println("nombre: ");
            nombre = br.readLine();

            System.out.println("apellidoPaterno: ");
            apellidoPaterno = br.readLine();

            System.out.println("apellidoMaterno: ");
            apellidoMaterno = br.readLine();

            System.out.println("numero: ");
            numero = br.readLine();

            System.out.println("codigoPostal: ");
            codigoPostal = br.readLine();

            System.out.println("calle: ");
            calle = br.readLine();

            System.out.println("estado: ");
            estado = br.readLine();

            System.out.println("telefono: ");
            telefono = br.readLine();

            cliente = new Cliente(curp, nombre, apellidoPaterno, apellidoMaterno, numero, codigoPostal, calle, estado, telefono);

            this.consultador.actualizarCliente(curp_buscado, cliente);

        }catch(IOException io){
            System.out.println("Problemas al leer stdin");
        }catch(Exception e){
            System.out.println(e);
        }

        
    }

    /**
     * Método auxiliar para insertar un Cliente nuevo
     */
    private void insertaCliente(){
        Cliente cliente = null;
        System.out.println("Ingresa por favor los siguientes datos");
        String curp, nombre, apellidoPaterno, apellidoMaterno, numero, codigoPostal, calle, estado, telefono;
        try{
            System.out.println("curp: ");
            curp = br.readLine();

            System.out.println("nombre: ");
            nombre = br.readLine();

            System.out.println("apellidoPaterno: ");
            apellidoPaterno = br.readLine();

            System.out.println("apellidoMaterno: ");
            apellidoMaterno = br.readLine();

            System.out.println("numero: ");
            numero = br.readLine();

            System.out.println("codigoPostal: ");
            codigoPostal = br.readLine();

            System.out.println("calle: ");
            calle = br.readLine();

            System.out.println("estado: ");
            estado = br.readLine();

            System.out.println("telefono: ");
            telefono = br.readLine();

            cliente = new Cliente(curp, nombre, apellidoPaterno, apellidoMaterno, numero, codigoPostal, calle, estado, telefono);

            this.consultador.insertarCliente(cliente);

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
        String curp;
        do{
            System.out.println("Actualmente estaŕas haciendo queries a la tabla clientes");
            System.out.println("Estas son las opciones existentes:");
            System.out.println("1 - Obten la lista de todos los clientes existente");
            System.out.println("2 - Inserta un nuevo cliente");
            System.out.println("3 - Busca un cliente por su curp");
            System.out.println("4 - Actualiza los datos de un cliente");
            System.out.println("5 - Borra un cliente de la base de datos mediante su curp");
            bandera = true;
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
                            List<Cliente> clientes = this.consultador.getClientes();

                            for(Cliente cliente : clientes){
                                System.out.println(cliente);
                            }
                        }catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    
                    case 2:
                        this.insertaCliente();
                        break;
                    
                    case 3:
                        Cliente cliente = null;
                        try{
                            System.out.println("Ingresa el curp:");
                            curp = br.readLine();
                            cliente = this.consultador.getCliente(curp);
                            if (cliente != null){
                                System.out.println(cliente);
                            }else{
                                System.out.println("No se encontró ningún cliente con el curp proveido...\n");
                            }
                        }catch(Exception e){
                            System.out.println(e);
                        }
                        break;
                    
                    case 4:
                        this.actualizaCliente();
                        break;
                    
                    case 5:
                        try{
                            System.out.println("Ingresa el curp:");
                            curp = br.readLine();
                            this.consultador.borrarCliente(curp);
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
