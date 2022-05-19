package transportecolectivo.practica09;

import java.sql.SQLException;
import java.io.*;
import java.util.*;
import transportecolectivo.practica09.Conexion.ConexionBD;
import transportecolectivo.practica09.Entrada.ClienteEntrada;
import transportecolectivo.practica09.Modelo.Cliente;
import transportecolectivo.practica09.Repositorio.ClienteRepositorio;
import transportecolectivo.practica09.Servicio.ClienteServicio;
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
        ClienteEntrada clienteEntrada = new ClienteEntrada();

        clienteEntrada.main();

    }
}

