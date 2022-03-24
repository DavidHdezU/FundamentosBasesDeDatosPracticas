package SRC;

/**
 * Clase que representa una Médico Veterinario
 * @author Santiago Raúl Díaz Pontón
 * @author David Hernández Uriostegui
 * @version 22.3.22
 */
class MedicoVeterinario{

    private String nombre_Vet;
    private String apellido_paterno;
    private String apellido_materno;
    private String rfc;
    private String correo;
    private char turno;
    /**
     * Constructor para un objeto MedicoVeterinario
     * @param nombre_vet nombre del veterinario
     * @param appellido_paterno apellido paterno del veterinario
     * @param apellido_materno apellido materno del veterinario
     * @param rfc rfc del veterinario
     * @param correo correo del veterinario
     * @param turno turno en el que trabaja el veterinario
     */
    public MedicoVeterinario(String nombre_vet, String apellido_paterno, String apellido_materno, String rfc, String correo, char turno){
            this.nombre_Vet = nombre_vet;
            this.apellido_paterno = apellido_paterno;
            this.apellido_materno = apellido_materno;
            this.rfc = rfc;
            this.correo = correo;
            this.turno = Character.toLowerCase(turno);

    }
    /**
     * Regresa el nombre del veterinario
     * @return nombre del veterinario
     */
    public String getNombre_vet(){
        return this.nombre_Vet;
    }
    /**
     * Regresa el apellido paterno del veterinario
     * @return apellido paterno del veterinario
     */
    public String getApellidoPaterno(){
        return this.apellido_paterno;
    }
    /**
     * Regresa el apellido materno del veterinario
     * @return apellido materno del veterinario
     */
    public String getaApellido_Materno(){
        return this.apellido_materno;
    }
    /**
     * Regresa el rfc del veterinario
     * @return rfc del veterinario
     */
    public String getRfc(){
        return this.rfc;
    }
     /**
     * Regresa el correo del veterinario
     * @return correo del veterinario
     */
    public String getCorreo(){
        return this.correo;
    }
    /**
     * Regresa el turno del veterinario
     * @return turno del veterinario
     */
    public char getTurno(){
        return this.turno;
    }
    /**
     * Actualiza el valor de la variable de clase nombre_vet
     * @param nombre_Vet el nuevo nombre del veterinario
     */
    public void setNombre_Vet(String nombre_Vet){
        this.nombre_Vet = nombre_Vet;
    }
    /**
     * Actualiza el valor de la variable de clase apellido_paterno
     * @param apellido_paterno el nuevo apellido paterno del veterinario
     */
    public void setApellido_Paterno(String apellido_paterno){
        this.apellido_paterno = apellido_paterno;
    }
    /**
     * Actualiza el valor de la variable de clase apellido_materno
     * @param apellido_materno el nuevo apellido materno del veterinario
     */
    public void setApellido_Materno (String apellido_Materno){
        this.apellido_materno = apellido_Materno;
    }
    /**
     * Actualiza el valor de la variable de clase rfc
     * @param rfc el nuevo rfc del veterinario
     */
    public void setRfc(String rfc){
        this.rfc = rfc;
    }
    /**
     * Actualiza el valor de la variable de clase turno
     * @param turno el nuevo turno de veterinario
     */
    public void setTurno(char turno){
        this.turno = turno;
    }
   
    @Override
    public String toString(){
        return this.nombre_Vet + "," + this.apellido_paterno + ","+this.apellido_materno + "," + this.rfc + "," + this.correo + ","+ this.turno;
    }
}