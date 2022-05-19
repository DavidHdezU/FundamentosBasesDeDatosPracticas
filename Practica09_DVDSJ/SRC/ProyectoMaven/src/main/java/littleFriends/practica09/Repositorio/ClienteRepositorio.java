package littleFriends.practica09.Repositorio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import littleFriends.practica09.Conexion.ConexionBD;
import littleFriends.practica09.Modelo.Cliente;

/**
 * Clase que permite las operaciones CRUD de la tabla Cliente de la base de 
 * datos
 * @author David Hernández Uriostegui
 * @version  16-MAYO-2022
 */
public class ClienteRepositorio {
    private ConexionBD conexion = new ConexionBD();
    //Objeto para ejecutar queries
    private Statement stmt;
    //Objeto para prepara un querie para su ejecucion
    private PreparedStatement ps;
    
    /**
     * Metodo que se conecta a la base de datos y obtiene todas las entradas
     * de los Clientees
     * @return List<Cliente> Una lista de Clientees
     * @throws SQLException -- Excepcion que sale si no se logra a hacer 
     * la query de la consulta o la conexion
     */
    public List<Cliente> getClientes() throws SQLException{
        String query = "SELECT * FROM cliente"; //Escribimos nuestra query
        List ClienteLista = new ArrayList<Cliente>();
        try{
            //Nos conectamos a la base de datos
            conexion.conectar();
            //Preparamos la base de datos
           stmt = conexion.prepararDeclaracion();
           //Ejecuto mi query y me regresa un iterador
           ResultSet rs = stmt.executeQuery(query);
           while(rs.next()){
               //System.out.println(rs.getString("curp"));
               Cliente cliente = new Cliente(
                   rs.getString("curp"),
                   rs.getString("nombre"),
                   rs.getString("apellidoPaterno"),
                   rs.getString("apellidoMaterno"),
                   rs.getString("numero"),
                   rs.getString("codigoPostal"),
                   rs.getString("calle"),
                   rs.getString("estado"),
                   rs.getString("telefono")
               );
               //Agrego el resultado
               ClienteLista.add(cliente);
           }        
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            try{
                conexion.cerrar();
            }catch(SQLException sql){
                sql.printStackTrace();
            }
        }
        return ClienteLista;
    }


    /**
     * Metodo que obtiene a un operador dentro de la base a partir de su curp
     * @param curp -- La curp del operador a buscar
     * @return Cliente -- El Cliente en caso de encontrarse null, en otro caso
     * @throws SQLException --Excepcion que sale si no se logra a hacer 
     * la query de la consulta o la conexion
     */
    public Cliente getCliente(String curp) throws SQLException{
        String query = "SELECT * FROM cliente WHERE curp = ?";
        Cliente cliente = null;
        try{
            //Conectamos a la Base
            conexion.conectar();
            //Preparamos la Base para la consulta
            ps = conexion.prepararDeclaracionPreparada(query);
            //Modificamos la consulta, para ver que sustituira
            ps.setString(1, curp);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                cliente = new Cliente(
                   rs.getString("curp"),
                   rs.getString("nombre"),
                   rs.getString("apellidoPaterno"),
                   rs.getString("apellidoMaterno"),
                   rs.getString("numero"),
                   rs.getString("codigoPostal"),
                   rs.getString("calle"),
                   rs.getString("estado"),
                   rs.getString("telefono")
               );
            }
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            try{
                conexion.cerrar();
            }catch(SQLException sql){
                sql.printStackTrace();
            }
        }
        return cliente;
    }

    /**
     * Metodo que inserta un cliente dentro de la base de datos
     * @param cliente -- El cliente que deseamos insertar en la base de datos
     */
    public void insertarCliente(Cliente cliente){
        String query = "INSERT INTO cliente "
                + "(curp, nombre, apellidoPaterno, apellidoMaterno, numero, codigoPostal, calle, estado, telefono)"
                + " VALUES (?,?,?,?,?,?,?,?,?)";
        try{
            conexion.conectar();
            ps = conexion.prepararDeclaracionPreparada(query);
            ps.setString(1, cliente.getCurp());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getApellidoPaterno());
            ps.setString(4, cliente.getApellidoMaterno());
            ps.setString(5, cliente.getNumero());
            ps.setString(6, cliente.getCodigoPostal());
            ps.setString(7, cliente.getCalle());
            ps.setString(8, cliente.getEstado());
            ps.setString(9, cliente.getTelefono());

            ps.executeUpdate();    //Utilizamos esta instruccion para insertar y actualizar
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            try{
                conexion.cerrar();
            }catch(SQLException sql){
                sql.printStackTrace();
            }
        } 
    }

    /**
     * Metodo que actualiza un cliente dentro de la base de datos
     * @param curp -- El curp del operador a buscar para actualizar
     * @param cliente -- El cliente que vamos a intercambiar sus valores
     */
    public void actualizarCliente(String curp, Cliente cliente){
        String query = "UPDATE cliente SET curp = ?, nombre = ?, "
                + "apellidoPaterno = ?, apellidoMaterno = ?, "
                + "numero=?, codigoPostal =?, calle=?, estado =?, telefono =? WHERE curp = ?";
        try{
            conexion.conectar();;
            ps = conexion.prepararDeclaracionPreparada(query);
            ps.setString(1, cliente.getCurp());
            ps.setString(2, cliente.getNombre());
            ps.setString(3, cliente.getApellidoPaterno());
            ps.setString(4, cliente.getApellidoMaterno());
            ps.setString(5, cliente.getNumero());
            ps.setString(6, cliente.getCodigoPostal());
            ps.setString(7, cliente.getCalle());
            ps.setString(8, cliente.getEstado());
            ps.setString(9, cliente.getTelefono());
            ps.setString(10, curp);
            ps.executeUpdate();
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            try{
                conexion.cerrar();
            }catch(SQLException sql){
                sql.printStackTrace();
            }
        } 
    }

    /**
     * Metodo para borrar un cliente
     * @param curp -- Curp del operador a eliminar
     * @return Boolean -- true si se realizo, false en caso contrario
     */
    public Boolean borrarCliente(String curp){
        String query = "DELETE FROM cliente WHERE curp = ?";
        boolean ok = false;
        try{
            conexion.conectar();
            ps = conexion.prepararDeclaracionPreparada(query);
            ps.setString(1, curp);
            ps.executeUpdate();
            ok = true;
        }catch(SQLException sql){
            sql.printStackTrace();
        }finally{
            try{
                conexion.cerrar();
            }catch(SQLException sql){
                sql.printStackTrace();
            }
        } 
       return ok;
    }
    
    
    
}
