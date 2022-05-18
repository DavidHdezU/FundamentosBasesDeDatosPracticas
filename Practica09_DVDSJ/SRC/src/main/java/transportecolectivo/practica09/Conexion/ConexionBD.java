
package transportecolectivo.practica09.Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * Clase que permite la conexión con la base de datos
 * @author Ricardo Badillo Macias
 * @version  11-MAYO-2022
 */
public class ConexionBD {
    private Connection conexion = null;
    /**
     * Metodo que hace la conexion con nuestra Base De Datos
     * @throws SQLException -- SI no se logra la conexión lanza una excepcion
     */
    public void conectar() throws SQLException{
        //Colocamos la información de nuestra base de datos en este caso
        //sera jdbc:nombreDelSMBD:LaDirecciónDeLaPagina:Puerto(por defecto 5432)/nombreBD
        String jdbc = "jdbc:postgresql://localhost:5432/P09";
        //Intentamos la conexion
        conexion = DriverManager.getConnection(jdbc,"postgres", "david2015");
        System.out.println("Conexion exitosa");
    }
   
    /**
     * Metodo que se encarga de preparar la base de datos para recibir una 
     * sentencia
     * @return Statement -- Objeto que utilizaremos para crear sentencias sql
     * @throws SQLException -- Si no se logra preparar lanza un error
     */
    public Statement prepararDeclaracion() throws SQLException{
        return conexion.createStatement();
    }
    
    /**
     * Metodo que se encarga de preparar la base de datos para recibir una 
     * sentencia preparada
     * @param query -- La query que modificaremos en caso de necesitar parametros
     * @return PreparedStatement -- Objeto que utilizaremos para las sentencias sql
     * @throws SQLException -- Si no se logra prepara lanza un error
     */
    public PreparedStatement prepararDeclaracionPreparada(String query)  throws SQLException{
        return conexion.prepareStatement(query);
    }
    /**
     * Metodo que cierra la conexion con nuestra Base de Datos
     * @throws SQLException -- Si no se cerro la conexion con la base de datos lanza un error
     */
    public void cerrar() throws SQLException{
        //Cerramos la conexion
        conexion.close();
        System.out.println("Conexion finalizada");
    }
}
