package transportecolectivo.practica09.Modelo;

/**
 * Clase que modela a un Cliente
 * @author David Hernández Uriostegui
 * @version 16-MAYO-2022
 */
public class Cliente {
    private String curp;
    private String nombre;
    private String apellidoPaterno;
    private String apellidoMaterno;
    private String numero;
    private String codigoPostal;
    private String calle;
    private String estado;
    private String telefono;

    /**
     * Constructor por parametros que crea un Cliente
     * @param curp - curp del cliente
     * @param nombre - nombre del cliente
     * @param apellidoPaterno - apellido paterno del cliente
     * @param apellidoMaterno - apellido materno del cliente
     * @param numero - numero del del cliente
     * @param codigoPostal - codigo postal del del cliente
     * @param calle - calle del del cliente
     * @param estado - estado donde vive el cliete
     * @param telefono - telefono del cliente
     */
    public Cliente(String curp, String nombre, String apellidoPaterno, String apellidoMaterno, String numero, String codigoPostal, String calle, String estado, String telefono){
        this.curp = curp;
        this.nombre = nombre;
        this.apellidoPaterno = apellidoPaterno;
        this.apellidoMaterno = apellidoMaterno;
        this.numero = numero;
        this.codigoPostal = codigoPostal;
        this.calle = calle;
        this.estado = estado;
        this.telefono = telefono;
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
     * @return String return the apellidoPaterno
     */
    public String getApellidoPaterno() {
        return apellidoPaterno;
    }

    /**
     * @param apellidoPaterno the apellidoPaterno to set
     */
    public void setApellidoPaterno(String apellidoPaterno) {
        this.apellidoPaterno = apellidoPaterno;
    }

    /**
     * @return String return the apellidoMaterno
     */
    public String getApellidoMaterno() {
        return apellidoMaterno;
    }

    /**
     * @param apellidoMaterno the apellidoMaterno to set
     */
    public void setApellidoMaterno(String apellidoMaterno) {
        this.apellidoMaterno = apellidoMaterno;
    }

    /**
     * @return String return the numero
     */
    public String getNumero() {
        return numero;
    }

    /**
     * @param numero the numero to set
     */
    public void setNumero(String numero) {
        this.numero = numero;
    }

    /**
     * @return String return the codigoPostal
     */
    public String getCodigoPostal() {
        return codigoPostal;
    }

    /**
     * @param codigoPostal the codigoPostal to set
     */
    public void setCodigoPostal(String codigoPostal) {
        this.codigoPostal = codigoPostal;
    }

    /**
     * @return String return the calle
     */
    public String getCalle() {
        return calle;
    }

    /**
     * @param calle the calle to set
     */
    public void setCalle(String calle) {
        this.calle = calle;
    }

    /**
     * @return String return the estado
     */
    public String getEstado() {
        return estado;
    }

    /**
     * @param estado the estado to set
     */
    public void setEstado(String estado) {
        this.estado = estado;
    }

    /**
     * @return String return the telefono
     */
    public String getTelefono() {
        return telefono;
    }

    /**
     * @param telefono the telefono to set
     */
    public void setTelefono(String telefono) {
        this.telefono = telefono;
    }

    @Override
    public String toString(){
        String str = "Cliente{curp=" + this.curp + ", nombre=" + this.nombre + ", apellidoPaterno=" + this.apellidoPaterno;
        str += ", apellidoMaterno=" + this.apellidoMaterno + ", numero=" + this.numero + ", codigoPostal=" + this.codigoPostal;
        str += ", calle=" + this.calle + ", estado=" + this.estado + ", telefono=" + this.telefono + "}";
        return str;
    }

}
