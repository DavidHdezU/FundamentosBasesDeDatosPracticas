package SRC;

import java.util.ArrayList;

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

  public int getId(){
    return this.id;
  }

  public String getNombre(){
    return this.nombre_cliente;
  }

  public String getApellido_paterno(){
    return this.apellido_paterno;
  }

  public String getApellido_materno(){
    return this.apellido_materno;
  }

  public String getCURP(){
    return this.curp;
  }

  public String getCorreo(){
    return this.correo;
  }


  public String getDomicilio(){
    return this.domicilio;
  }

  public String getCodico_postal(){
    return this.codigo_postal;
  }

  public ArrayList<Mascota> getMascotas(){
    return this.mascotas;
  }

  public void setNombre(String nombre){
    this.nombre_cliente = nombre;
  }

  public void setApellido_paterno(String apellido){
    this.apellido_paterno = apellido;
  }

  public void setApellido_materno(String apellido){
    this.apellido_materno = apellido;
  }

  public void setCurp(String curp){
    this.curp = curp;
  }

  public void setCorreo(String correo){
    this.correo = correo;
  }

  public void setDomicilio(String domicilio){
    this.domicilio = domicilio;
  }

  public void setCodigo_postal(String codigo){
    this.codigo_postal = codigo;
  }

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