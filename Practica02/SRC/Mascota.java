package SRC;
/**
 * Clase que representa una Mascota
 * @author David Hernández Uriostegui
 * @version 22.3.22
 */
public class Mascota {
    private int id;
    private String nombre;
    private int edad;
    private float peso;
    private String raza;
    private Cliente dueño;

    /**
     * Constructor por parametros que genera una Mascoto
     * @param id - Id de la mascota
     * @param nombre - Nombre de la mascoto
     * @param edad - Edad de la mascota
     * @param peso - Peso en kilogramos de la mascota
     * @param raza - Raza de la mascota
     * @param dueño - Dueño de la mascota
     */
    public Mascota(int id, String nombre, int edad, float peso, String raza, Cliente dueño){
        this.id = id;
        this.nombre = nombre;
        this.edad = edad;
        this.peso = peso;
        this.raza = raza;
        this.dueño = dueño;
    }

    /**
    * Metodo getId que obtiene el id de la Mascota
    * @return id - El id de la mascota
    */
    public int getId(){
        return this.id;
    }

    /**
    * Metodo getNombre que obtiene el nombre de la Mascota
    * @return nombre - El nombre de la mascota
    */
    public String getNombre(){
        return this.nombre;
    }

    /**
    * Metodo getEdad que obtiene la edad de la Mascota
    * @return edad - La edad de la mascota
    */
    public int getEdad(){
        return this.edad;
    }

    /**
    * Metodo getPeso que obtiene el peso de la Mascota
    * @return peso - El peso de la mascota
    */
    public float getPeso(){
        return this.peso;
    }

    /**
    * Metodo getNombre que obtiene la raza de la Mascota
    * @return raza - La raza de la mascota
    */
    public String getRaza(){
        return this.raza;
    }

    /**
    * Metodo getDueño que obtiene el dueño de la Mascota
    * @return dueño - El dueño de la mascota
    */
    public Cliente getDueño(){
        return this.dueño;
    }

    /**
     * Metodo setId que define el nuevo id de la Mascota
     * @param id  - El nuevo id de la Mascota
     */
    public void setId(int id){
        this.id = id;
    }
      

    /**
     * Metodo setNombre que define el nuevo nombre de la Mascota
     * @param nombre  - El nuevo nombre de la Mascota
     */
    public void setNombre(String nombre){
        this.nombre = nombre;
    }

    /**
     * Metodo setNombre que define la nueva edad de la Mascota
     * @param edad  - La nueva edad de la Mascota
     */
    public void setEdad(int edad){
        this.edad = edad;
    }

    /**
     * Metodo setPeso que define el nuevo peso de la Mascota
     * @param peso  - El nuevo peso de la Mascota
     */
    public void setPeso(float peso){
        this.peso = peso;
    }

    /**
     * Metodo setRaza que define la nueva raza de la Mascota
     * @param raza - La nueva raza de la Mascota
     */
    public void setRaza(String raza){
        this.raza = raza;
    }

    /**
     * Metodo setDueño que define el nuevo dueño de la Mascota
     * @param dueño  - El dueño nombre de la Mascota
     */
    public void setDueño(Cliente dueño){
        this.dueño = dueño;
    }

    @Override
    public String toString(){
        return this.nombre + "," + Integer.toString(this.edad) + "," + Float.toString(this.peso) +
                "," + this.raza + "," + this.dueño.getNombre() + "," + this.dueño.getApellido_paterno() + "," + this.dueño.getApellido_materno();
    }

}
