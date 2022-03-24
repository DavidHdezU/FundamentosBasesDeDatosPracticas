package SRC;

import java.util.ArrayList;

/**
 * Clase que representa una Mascota
 * @author David Hernández Uriostegui
 * @version 22.3.22
 */
class Cliente{

  private int id;
  private String nombre_cliente;
  private String apellido_paterno;
  private String apellido_materno;
  private String curp;
  private String correo;
  private String domicilio;
  private String codigo_postal;
  private ArrayList<Mascota> mascotas;

  /**
   * Construcción por parametros de Cliente
   * @param id - id del cliente
   * @param nombre_cliente - nombre del cliente
   * @param apellido_paterno - apellido paterno del cliente
   * @param apellido_materno - apellido materno del cliente
   * @param curp - curp del cliente
   * @param correo - correo del cliente
   * @param domicilio - domicilio del cliente
   * @param codigo_postal - código postal del cliente
   * @param mascotas - mascotas del cliente
   */
  Cliente(int id, String nombre_cliente, String apellido_paterno, String apellido_materno, String curp, String correo, String domicilio, String codigo_postal, ArrayList<Mascota> mascotas){
    this.id = id;
    this.nombre_cliente = nombre_cliente;
    this.apellido_paterno = apellido_paterno;
    this.apellido_materno = apellido_materno;
    this.curp = curp;
    this.correo = correo;
    this.domicilio = domicilio;
    this.codigo_postal = codigo_postal;
    this.mascotas = mascotas;
  }

  /**
   * Construcción por parametros de Cun Cliente que aún no tiene mascotas asociadas
   * @param id - id del cliente
   * @param nombre_cliente - nombre del cliente
   * @param apellido_paterno - apellido paterno del cliente
   * @param apellido_materno - apellido materno del cliente
   * @param curp - curp del cliente
   * @param correo - correo del cliente
   * @param domicilio - domicilio del cliente
   * @param codigo_postal - código postal del cliente
   */
  Cliente(int id, String nombre_cliente, String apellido_paterno, String apellido_materno, String curp, String correo, String domicilio, String codigo_postal){
    this.id = id;
    this.nombre_cliente = nombre_cliente;
    this.apellido_paterno = apellido_paterno;
    this.apellido_materno = apellido_materno;
    this.curp = curp;
    this.correo = correo;
    this.domicilio = domicilio;
    this.codigo_postal = codigo_postal;
    this.mascotas = new ArrayList<>();
  }

  /**
   * Metodo getId que obtiene el id del cliente
   * @return id - el id del cliente
   */
  public int getId(){
    return this.id;
  }

  /**
   * Metodo getNombre que obtiene el nombre del cliente
   * @return nombre - el nombre del cliente
   */
  public String getNombre(){
    return this.nombre_cliente;
  }

  /**
   * Metodo getApellido_paterno que obtiene el apellido paterno del cliente
   * @return nombre - el apellido paterno del cliente
   */
  public String getApellido_paterno(){
    return this.apellido_paterno;
  }

  /**
   * Metodo getApellido_materno que obtiene el apellido materno del cliente
   * @return nombre - el apellido materno del cliente
   */
  public String getApellido_materno(){
    return this.apellido_materno;
  }

  /**
   * Metodo getCURP que obtiene el curp del cliente
   * @return curp - el curp del cliente
   */
  public String getCURP(){
    return this.curp;
  }

  /**
   * Metodo getCorreo que obtiene el correo del cliente
   * @return correo - el correo del cliente
   */
  public String getCorreo(){
    return this.correo;
  }


  /**
   * Metodo getDomicilio que obtiene el domicilio del cliente
   * @return domicilio - el domicilio del cliente
   */
  public String getDomicilio(){
    return this.domicilio;
  }

  /**
   * Metodo getCodico_postal que obtiene el código postal del cliente
   * @return codigo_postal - el código postal del cliente
   */
  public String getCodico_postal(){
    return this.codigo_postal;
  }

  /**
   * Metodo getCgetMascotasodico_postal que obtiene la lista de mascotas del cliente
   * @return mascotas - la lista de mascotas del cliente
   */
  public ArrayList<Mascota> getMascotas(){
    return this.mascotas;
  }

  /**
   * Método setNombre que define el nuevo nombre del Cliente
   * @param nombre - nuevo nombre del Cliente
   */
  public void setNombre(String nombre){
    this.nombre_cliente = nombre;
  }

  /**
   * Método setApellido_paterno que define el nuevo apellido paterno del Cliente
   * @param apellido - nuevo apellido paterno del Cliente
   */
  public void setApellido_paterno(String apellido){
    this.apellido_paterno = apellido;
  }

  /**
   * Método setApellido_materno que define el nuevo apellido materno del Cliente
   * @param apellido - nuevo apellido materno del Cliente
   */
  public void setApellido_materno(String apellido){
    this.apellido_materno = apellido;
  }

  /**
   * Método setCurp que define el nuevo curp del Cliente
   * @param curp - nuevo curp del Cliente
   */
  public void setCurp(String curp){
    this.curp = curp;
  }

  /**
   * Método setCorreo que define el nuevo correo del Cliente
   * @param correo - nuevo correo del Cliente
   */
  public void setCorreo(String correo){
    this.correo = correo;
  }

  /**
   * Método setDomicilio que define el nuevo domicilio del Cliente
   * @param domicilio - nuevo domicilio del Cliente
   */
  public void setDomicilio(String domicilio){
    this.domicilio = domicilio;
  }

  /**
   * Método setCodigo_postal que define el nuevo código postal del Cliente
   * @param codigo - nuevo código postal del Cliente
   */
  public void setCodigo_postal(String codigo){
    this.codigo_postal = codigo;
  }

  /**
   * Método setCodigo_postal que define la nueva lista de mascotas del Cliente
   * @param mascotas - nueva lista de mascotas del Cliente
   */
  public void setMascotas(ArrayList<Mascota> mascotas){
    this.mascotas = mascotas;
  }


  @Override
  public String toString(){
    String res = Integer.toString(this.id) + "," + this.nombre_cliente + "," + this.apellido_paterno + "," + this.apellido_materno + "," + this.curp + "," + this.correo + "," + this.domicilio + "," + this.codigo_postal;

    for(int i = 0; i < this.mascotas.size(); i++){
      res += "," + this.mascotas.get(i).getId();
    }
    return res;
  }
}
