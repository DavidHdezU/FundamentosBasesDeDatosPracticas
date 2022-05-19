package littleFriends.practica09.Servicio;

import java.util.List;

import littleFriends.practica09.Modelo.Mascota;
import littleFriends.practica09.Repositorio.MascotaRepositorio;


/**
 * Clase que se encarga de hacer CRUD con las mascotas
 * @author David Herández Uriostegui
 * @version  16-MAYO-2022
 */
public class MascotaServicio {
    private MascotaRepositorio mascotaRepositorio = new MascotaRepositorio();

    /**
     * Metodo que se encarga de obtener a todos las mascotas
     * @return List<Mascota> -- La lista de las mascotas
     * @throws Exception -- En caso de que suceda algun error
     */
    public List<Mascota> getMascotas() throws Exception{
        return mascotaRepositorio.getMascotas();
    }

    /**
     * Metodo que se encarga de insertar una mascota
     * @param mascota -- La mascota a insertar
     * @throws Exception  -- En caso de que suceda algun error
     */
    public void insertarMascota(Mascota mascota) throws Exception{
        mascotaRepositorio.insertarMascota(mascota);
    }

    /**
     * Metodo que se encarga de obtener una mascota
     * @param idMascota -- El id de la mascota a buscar
     * @throws Exception -- En caso de que ocurra algun error
     */
    public Mascota getMascota(String idMascota)throws Exception{
        return mascotaRepositorio.getMascota(idMascota);
    }

    /**
     * Metodo que actualiza una mascota
     * @param idMascota -- El id de la mascota a buscar
     * @param mascota -- Los valores nuevos a actualizar
     * @throws Exception -- En caso de que ocurra algun error 
     */
    public void actualizarMascota(String idMascota, Mascota mascota)throws Exception{
        mascotaRepositorio.actualizarMascota(idMascota, mascota);
    }

    /**
     * Metodo que borra una mascota
     * @param curp -- El curp del cliente a borrar
     * @throws Exception  -- EN caso de que ocurra algun error
     */
    public void borrarMascota(String idMascota)throws Exception{
        mascotaRepositorio.borrarMascota(idMascota);
    }
}
