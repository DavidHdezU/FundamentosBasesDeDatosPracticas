package SRC;

class Cliente{
  private int id;
  private String nombre_cliente;
  private String apellido_paterno;
  private String apellido_materno;
  private String curp;
  private String correo;
  private String domicilio;
  private String codigo_postal;

  Cliente(int id, String nombre_cliente, String apellido_paterno, String apellido_materno, String curp, String correo, String domicilio, String codigo_postal){
    this.id = id;
    this.nombre_cliente = nombre_cliente;
    this.apellido_paterno = apellido_paterno;
    this.apellido_materno = apellido_materno;
    this.curp = curp;
    this.correo = correo;
    this.domicilio = domicilio;
    this.codigo_postal = codigo_postal;
  }

  public int getId(){
    return this.id;
  }

  public String getNombre_cliente(){
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



  public String toString(){
    return Integer.toString(this.id) + "," + this.nombre_cliente + "," + this.apellido_paterno + "," + this.apellido_materno
            + "," + "," + this.curp + "," + this.correo + "," + this.domicilio + "," + this.codigo_postal;
  }
}
/**
class Cliente{
  public static void main(String[] args) {

    List<Datos> c = new ArrayList<Datos>();
    Scanner s = new Scanner(System.in);
    Scanner s1 = new Scanner(System.in);
    int op;
    do{
       System.out.println("1.Agrega");
       System.out.println("2.Consulta");
       System.out.println("3.Busca");
       System.out.println("4.Eliminar");
       System.out.println("5.Editar");
       System.out.println("Selecciona una opción : ");

       op = s.nextInt();

       switch(op){
         case 1:
             System.out.print("Ingresa el id del cliente : ");
             int id = s.nextInt();
             System.out.print("Ingresa nombre : ");
             String nombre_cliente = s1.nextLine();
             System.out.print("Ingresa apellido paterno : ");
             String apellido_paterno = s1.nextLine();
             System.out.print("Ingresa apellido materno : ");
             String apellido_materno = s1.nextLine();
             System.out.print("Ingresa un correo : ");
             String correo = s1.nextLine();
             System.out.print("Ingresa el domicilio : ");
             String domicilio = s1.nextLine();

             c.add(new Datos(id,nombre_cliente,apellido_paterno,apellido_materno,correo,domicilio));
         break;

         case 2:
             System.out.println("----------------------------------");
             Iterator<Datos> i = c.iterator();
             while(i.hasNext()){
               Datos d = i.next();
               System.out.println(d);
             }
             System.out.println("----------------------------------");
         break;

         case 3:
             boolean found = false;
             System.out.print("Ingresa el id del cliente a buscar : ");
             id = s.nextInt();
             System.out.println("----------------------------------");
             i = c.iterator();
             while(i.hasNext()){
               Datos d = i.next();
               if(d.getId() == id) {
                   System.out.println(d);
                   found = true;
             }
           }
             if(!found){
               System.out.println("Registro no encontrado :( ");
             }
             System.out.println("----------------------------------");
         break;

         case 4:
             found = false;
             System.out.print("Ingresa el id del cliente a eliminar : ");
             id = s.nextInt();
             System.out.println("----------------------------------");
             i = c.iterator();
             while(i.hasNext()){
               Datos d = i.next();
               if(d.getId() == id) {
                   i.remove();
                   found = true;
             }
           }
             if(!found){
               System.out.println("El registro no fue encontrado :( ");
             }else{
               System.out.println("El registro se ha eliminado con éxito....! ");
             }
             System.out.println("----------------------------------");
         break;

         case 5:
             found = false;
             System.out.print("Ingresa el id del cliente a editar : ");
             id = s.nextInt();
             System.out.println("----------------------------------");
             ListIterator<Datos>li = c.listIterator();
             while(li.hasNext()){
               Datos d = li.next();
               if(d.getId() == id) {
                   System.out.print("Ingresa nuevo nombre : ");
                   nombre_cliente = s1.nextLine();

                   System.out.print("Ingresa nuevo apellido paterno : ");
                   apellido_paterno = s1.nextLine();

                   System.out.print("Ingresa nuevo apellido materno : ");
                   apellido_materno = s1.nextLine();

                   System.out.print("Ingresa nuevo correo : ");
                   correo = s1.nextLine();

                   System.out.print("Ingresa nuevo domicilio : ");
                   domicilio = s1.nextLine();
                   li.set(new Datos(id,nombre_cliente,apellido_paterno,apellido_materno,correo,domicilio));
                   found = true;
                }
             }
             if(!found){
               System.out.println("El registro no fue encontrado :( ");
             }else{
               System.out.println("El registro se ha actualizado con éxito....! ");
             }
             System.out.println("----------------------------------");
         break;
       }
    }while(op!=0);
  }
}

*/