package transportecolectivo.practica09.Repositorio;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import transportecolectivo.practica09.Conexion.ConexionBD;
import transportecolectivo.practica09.Modelo.Mascota;

/**
 * Clase que permite las operaciones CRUD de la tabla Mascota de la base de 
 * datos
 * @author David Hernández Uriostegui
 * @version  16-MAYO-2022
 */
public class MascotaRepositorio {
    private ConexionBD conexion = new ConexionBD();
    //Objeto para ejecutar queries
    private Statement stmt;
    //Objeto para prepara un querie para su ejecucion
    private PreparedStatement ps;

    /**
     * Metodo que se conecta a la base de datos y obtiene todas las entradas
     * de las Mascotas
     * @return List<Mascota> Una lista de Mascotas
     * @throws SQLException -- Excepcion que sale si no se logra a hacer 
     * la query de la consulta o la conexion
     */
    public List<Mascota> getMascotas() throws SQLException{
        String query = "SELECT * FROM mascota"; //Escribimos nuestra query
        List listaMascotas = new ArrayList<Mascota>();
        try{
            //Nos conectamos a la base de datos
            conexion.conectar();
            //Preparamos la base de datos
           stmt = conexion.prepararDeclaracion();
           //Ejecuto mi query y me regresa un iterador
           ResultSet rs = stmt.executeQuery(query);
           while(rs.next()){
               //System.out.println(rs.getString("curp"));
               Mascota mascota = new Mascota(
                   rs.getString("idMascota"),
                   rs.getString("curp"),
                   rs.getString("nombreDueño"),
                   rs.getString("nombre"),
                   rs.getInt("edad"),
                   rs.getString("raza"),
                   rs.getString("especie"),
                   rs.getFloat("estado")
               );
               //Agrego el resultado
               listaMascotas.add(mascota);
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
        return listaMascotas;
    }
    /**
     * Metodo que obtiene una mascota dentro de la base a partir de su idMascota
     * @param idMascota -- El idMascota de la mascota a buscar
     * @return Mascota -- La Mascota en caso de encontrarse null, en otro caso
     * @throws SQLException --Excepcion que sale si no se logra a hacer 
     * la query de la consulta o la conexion
     */
    public Mascota getMascota(String idMascota) throws SQLException{
        String query = "SELECT * FROM mascota WHERE idMascota = ?";
        Mascota mascota = null;
        try{
            //Conectamos a la Base
            conexion.conectar();
            //Preparamos la Base para la consulta
            ps = conexion.prepararDeclaracionPreparada(query);
            //Modificamos la consulta, para ver que sustituira
            ps.setString(1, idMascota);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                mascota = new Mascota(
                   rs.getString("idMascota"),
                   rs.getString("curp"),
                   rs.getString("nombreDueño"),
                   rs.getString("nombre"),
                   rs.getInt("edad"),
                   rs.getString("raza"),
                   rs.getString("especie"),
                   rs.getFloat("estado")
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
        return mascota;
    }

    /**
     * Metodo que inserta una mascota dentro de la base de datos
     * @param mascota -- La mascota que deseamos insertar en la base de datos
     */
    public void insertarMascota(Mascota mascota){
        String query = "INSERT INTO mascota "
                + "(idMascota, curp, nombreDueño, nombre, edad, raza, especie, peso)"
                + " VALUES (?,?,?,?,?,?,?,?)";
        try{
            conexion.conectar();
            ps = conexion.prepararDeclaracionPreparada(query);
            ps.setString(1, mascota.getIdMascota());
            ps.setString(2, mascota.getCurp());
            ps.setString(3, mascota.getNombreDueño());
            ps.setString(4, mascota.getNombre());
            ps.setInt(5, mascota.getEdad());
            ps.setString(6, mascota.getRaza());
            ps.setString(7, mascota.getEspecie());
            ps.setFloat(8, mascota.getPeso());

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
     * Metodo que actualiza una mascota dentro de la base de datos
     * @param idMascota -- El idMascota de la mascota a buscar para actualizar
     * @param mascota -- La mascota que vamos a intercambiar sus valores
     */
    public void actualizarMascota(String idMascota, Mascota mascota){
        String query = "UPDATE mascota SET idMascota = ?, curp = ?, "
                + "nombreDueño = ?, nombre = ?, "
                + "edad=?, raza =?, especie=?, peso =? WHERE idMascota = ?";
        try{
            conexion.conectar();;
            ps = conexion.prepararDeclaracionPreparada(query);
            ps.setString(1, mascota.getIdMascota());
            ps.setString(2, mascota.getCurp());
            ps.setString(3, mascota.getNombreDueño());
            ps.setString(4, mascota.getNombre());
            ps.setInt(5, mascota.getEdad());
            ps.setString(6, mascota.getRaza());
            ps.setString(7, mascota.getEspecie());
            ps.setFloat(8, mascota.getPeso());
            ps.setString(9, idMascota);
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
     * Metodo para borrar una mascota
     * @param idMascota -- idMascota de la mascota a eliminar
     * @return Boolean -- true si se realizo, false en caso contrario
     */
    public Boolean borrarMascota(String idMascota){
        String query = "DELETE FROM mascota WHERE idMascota = ?";
        boolean ok = false;
        try{
            conexion.conectar();
            ps = conexion.prepararDeclaracionPreparada(query);
            ps.setString(1, idMascota);
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
