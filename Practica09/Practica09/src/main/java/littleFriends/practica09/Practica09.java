package littleFriends.practica09;


import java.util.InputMismatchException;
import java.util.Scanner;

import littleFriends.practica09.Entrada.*;

/**
import transportecolectivo.practica09.Conexion.ConexionBD;
import java.sql.SQLException;
import transportecolectivo.practica09.Modelo.Operador;
import transportecolectivo.practica09.Repositorio.OperadorRepositorio;
*/
/**
 * Clase que ejecuta la aplicacion de java de escritorio
 * @author David Hernández Uriostegui
 * @version 16-MAYO-2022
 */
public class Practica09 {
    
    public static void main(String[] args){
        Scanner input = new Scanner(System.in);

        ClienteEntrada consultadorCliente = new ClienteEntrada();
        MascotaEntrada consultadorMascota = new MascotaEntrada();

        int opcion = 0;
        boolean bandera;

        do{
            bandera = true;
            System.out.println("Opciones:");
            System.out.println("1 - Consultar tablas 'cliente'");
            System.out.println("2 - Consultar tablas 'mascota'");
            System.out.println("O bien ingrese 3 para salir");
            try{
                opcion = input.nextInt();
            }catch (InputMismatchException e) {
		        input.next();
		        System.out.println("Ingresa un número como opción");
            }

            if(opcion > 0 && opcion < 4){
                switch (opcion){
                    case 1:
                        consultadorCliente.main();
                        break;
                    case 2:
                        consultadorMascota.main();
                        break;
                    case 3:
                        bandera = false;
                        System.out.println("Saliendo del sistema...\nHasta pronto.");
                }
            }
            
        }while(bandera);
        

    }
}

