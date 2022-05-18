package transportecolectivo.practica09.Modelo;

/**
 * Clase que modela a una Mascota
 * @author David Hernández Uriostegui
 * @version 16-MAYO-2022
 */
public class Mascota {
    private String idMascota;
    private String curp;
    private String nombreDueño;
    private String nombre;
    private int edad;
    private String raza;
    private String especie;
    private float peso;

    /**
     * Constructor por parametros que crea una Mascota
     * @param idMascota - id de la Mascota
     * @param curp - curp de la Mascota
     * @param nombreDueño - nombre del dueño de la Mascota
     * @param nombre - nombre de la Mascota
     * @param edad - edad de la Mascota
     * @param raza - raza de la Mascota
     * @param especie - especie de la Mascota
     * @param peso - peso de la Mascota
     */
    public Mascota(String idMascota, String curp, String nombreDueño, String nombre, int edad, String raza, String especie, float peso){
        this.idMascota = idMascota;
        this.curp = curp;
        this.nombreDueño = nombreDueño;
        this.nombre = nombre;
        this.edad = edad;
        this.raza = raza;
        this.especie = especie;
        this.peso = peso;
    }

    /**
     * @return String return the idMascota
     */
    public String getIdMascota() {
        return idMascota;
    }

    /**
     * @param idMascota the idMascota to set
     */
    public void setIdMascota(String idMascota) {
        this.idMascota = idMascota;
    }

    /**
     * @return String return the curp
     */
    public String getCurp() {
        return curp;
    }

    /**
     * @param curp the curp to set
     */
    public void setCurp(String curp) {
        this.curp = curp;
    }

    /**
     * @return String return the nombreDueño
     */
    public String getNombreDueño() {
        return nombreDueño;
    }

    /**
     * @param nombreDueño the nombreDueño to set
     */
    public void setNombreDueño(String nombreDueño) {
        this.nombreDueño = nombreDueño;
    }

    /**
     * @return String return the nombre
     */
    public String getNombre() {
        return nombre;
    }

    /**
     * @param nombre the nombre to set
     */
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    /**
     * @return int return the edad
     */
    public int getEdad() {
        return edad;
    }

    /**
     * @param edad the edad to set
     */
    public void setEdad(int edad) {
        this.edad = edad;
    }

    /**
     * @return String return the raza
     */
    public String getRaza() {
        return raza;
    }

    /**
     * @param raza the raza to set
     */
    public void setRaza(String raza) {
        this.raza = raza;
    }

    /**
     * @return String return the especie
     */
    public String getEspecie() {
        return especie;
    }

    /**
     * @param especie the especie to set
     */
    public void setEspecie(String especie) {
        this.especie = especie;
    }

    /**
     * @return float return the peso
     */
    public float getPeso() {
        return peso;
    }

    /**
     * @param peso the peso to set
     */
    public void setPeso(float peso) {
        this.peso = peso;
    }

}
