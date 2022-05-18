package transportecolectivo.practica09;

import java.sql.SQLException;
import java.io.*;
import java.util.*;
import transportecolectivo.practica09.Conexion.ConexionBD;
import transportecolectivo.practica09.Cliente.OperadorCliente;
import transportecolectivo.practica09.Modelo.Cliente;
/**
import transportecolectivo.practica09.Conexion.ConexionBD;
import java.sql.SQLException;
import transportecolectivo.practica09.Modelo.Operador;
import transportecolectivo.practica09.Repositorio.OperadorRepositorio;
*/
/**
 * Clase que ejecuta la aplicacion de java de escritorio
 * @author Ricardo Badillo Macias
 * @version 11-MAYO-2022
 */
public class Practica09 {
    
    public static void main(String[] args){
        BufferedReader br = new BufferedReader(new InputStreamReader(System.in));
        OperadorCliente opCliente = new OperadorCliente();
        try{
            System.out.println("Ingrese el curp a buscar: ");
            String curp = br.readLine();
            Cliente cliente = opCliente.getCliente(curp);
            System.out.println(cliente);
        }catch(SQLException sql){
            sql.printStackTrace();
        }catch(IOException io){
            System.out.println("Problema al intentar leer entrada standar");
        }

    }
}

