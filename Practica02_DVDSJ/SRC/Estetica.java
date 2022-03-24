package SRC;

import java.time.LocalTime;

/**
 * Clase para modelar el objeto tipo Estetica. Cada objeto esta constituido por el nombre de la Estetica, direccion compuesta por: 
 * estado, calle, numero, codigo postal (CP), telefono y horario. Ademas puede tener a lo mas cuatro consultorios.
 * @author  Diego Padilla
 * @version 23.3.22
 */
public class Estetica {
    private String   nombre, telefono;
    private String[] direccion;
    private LocalTime[][] horario;
    private Consultorio[] consultorios;

    /**
     * Constructor de Estetica. 
     * Recibe parametros para nombre y direccion, pero establece un horario y consultorios predeterminados.
     * @param nombre   el nombre de la Estetica
     * @param estado   estado donde se encuentra la Estetica
     * @param calle    calle donde se encuentra la Estetica
     * @param numero   numero de la direccion de la Estetica
     * @param cp       codigo postal de la Estetica
     * @param telefono numero telefonico de la Estetica
     */
    public Estetica(String nombre, String estado, String calle, String numero, String cp, String telefono) {
        this.nombre = nombre;
        this.telefono = telefono;
        this.direccion = new String[] {
            estado,
            calle,
            numero,
            cp
        };
        this.setHorarios();
        this.setConsultorios();
    }

    /**
     * Otro constructor de Estetica.
     * Recibe parametros para nombre, direccion y horario en forma de una {@code LocalTime[7][2]} donde las filas 
     * representan los dias de la semana y las columnas los horarios de cierre y apertura.
     * @param nombre   el nombre de la Estetica
     * @param estado   estado donde se encuentra la Estetica
     * @param calle    calle donde se encuentra la Estetica
     * @param numero   numero de la direccion de la Estetica
     * @param cp       codigo postal de la Estetica
     * @param telefono numero telefonico de la Estetica
     * @param horario  el horario semanal de la Estetica
     */
    public Estetica(String nombre, String estado, String calle, String numero, String cp, String telefono, LocalTime[][] horario) {
        this(nombre, estado, calle, numero, cp, telefono);
        this.horario = horario;
        this.setConsultorios();
    }

    /**
     * Constructor predeterminado de Estetica.
     */
    public Estetica() {
        this.nombre    = "";
        this.telefono  = "";
        this.direccion = new String[4];
        this.horario   = new LocalTime[7][2];
        this.consultorios = new Consultorio[4];
    }


    /**
     * Metodo encargado de establecer los horarios predeterminados de Estetica.
     * Establece para todos los dias de la semana el horario de apertura a las 9:00 y 
     * el de cierre a las 17:30
     */
    private void setHorarios() {
        this.horario = new LocalTime[7][2];
        LocalTime[] horarioDeAtencion = new LocalTime[] {LocalTime.of(9, 0), LocalTime.of(17, 30)};
        for(int dia = 0; dia <= 6; dia++) {
          this.horario[dia] = horarioDeAtencion;
        }
    }

    /**
     * Metodo encargado de establecer el {@code Consultorio[]} de Estetica.
     * @see Consultorio#Consultorio()
     */
    private void setConsultorios() {
        this.consultorios = new Consultorio[4];
        for (int no = 0; no < 4; no++) {
            this.consultorios[no] = new Consultorio();
        }
    }

    /**
     * Permite cambiar el horario de cierre y apertura para un dia en especifico.
     * @param diaSemana el dia de la semana Lunes-Domingo (1-7)
     * @param horario   arreglo que contiene la hora de apretura (horario[0]) y la hora de cierre (horario[1])
     */
    public void setHorarioDia(int diaSemana, LocalTime[] horario) { // TODO throw exceptions
        this.horario[diaSemana - 1] = horario;
    }

    /**
     * Cambia el horario de apertura para un dia en especifico.
     * @param diaSemana el dia de la semana Lunes-Domingo (1-7)
     * @param horario   la hora de apertura para el dia 
     */
    public void setHorarioApertura(int diaSemana, LocalTime horario) {
        this.horario[diaSemana - 1][0] = horario;
    }

    /**
     * Permite cambiar el horario de apertura para un dia en especifico.
     * @param diaSemana el dia de la semana Lunes-Domingo (1-7)
     * @param hora      la hora de apertura
     * @param minutos   los minutos de la hora de apertura
     */
    public void setHorarioApertura(int diaSemana, int hora, int minutos) {
        this.horario[diaSemana - 1][0] = LocalTime.of(hora, minutos);
    }

    /**
     * Cambia el horario de cierre para un dia en especifico.
     * @param diaSemana el dia de la semana Lunes-Domingo (1-7)
     * @param horario   la hora de cierre para el dia 
     */
    public void setHorarioCierre(int diaSemana, LocalTime horario) {
        this.horario[diaSemana - 1][1] = horario;
    }

    /**
     * Permite cambiar el horario de cierre para un dia en especifico.
     * @param diaSemana el dia de la semana Lunes-Domingo (1-7)
     * @param hora      la hora de apertura
     * @param minutos   los minutos de la hora de cierre
     */
    public void setHorarioCierre(int diaSemana, int hora, int minutos) {
        this.horario[diaSemana - 1][1] = LocalTime.of(hora, minutos);
    }

    /**
     * Establece el consultorio de la Estetica segun su numero.
     * @param noConsultorio el numero de Consultorio (1-4)
     * @param consultorio el nuevo Consultorio
     */
    public void setConsultorio(int noConsultorio, Consultorio consultorio) {
        this.consultorios[noConsultorio - 1] = consultorio;
    }


    /**
     * Regresa un {@code String} con el nombre de la Estetica.
     * @return nombre de la Estetica
     */
    public String getNombre() {
        return this.nombre;
    }

    /**
     * Regresa un arreglo {@code String[]} donde cada elemento es un componente de la direccion 
     * de la Estetica.
     * @return la direccion de la Estetica
     */
    public String[] getDireccion() {
        return this.direccion;
    }

    /**
     * Obten el estado donde se encuentra la Estetica. 
     * @return el estado de la Estetica
     */
    public String getEstado() {
        return this.direccion[0];
    }

    /**
     * Obten la calle donde se encuentra la Estetica.
     * @return la calle de la Estetica
     */
    public String getCalle() {
        return this.direccion[1];
    }

    /**
     * Obten el numero donde se encuentra la Estetica. 
     * @return el numero de la Estetica
     */
    public String getNumero() {
        return this.direccion[2];
    }

    /**
     * Obten el codigo postal donde se encuentra la Estetica. 
     * @return el codigo postal de la Estetica
     */
    public String getCP() {
        return this.direccion[3];
    }


    /**
     * Regresa una matriz {@code LocalTime[][]} con los horarios de apertura y cierre de 
     * todos los dias de la semana para la Estetica.
     * @return el horario semanal de la Estetica
     */
    public LocalTime[][] getHorario() {
        return this.horario;
    }

    /**
     * Regresa un arreglo {@code LocalTime[]} con los horarios de apertura ({@code LocalTime[0]}) 
     * y cierre ({@code LocalTime[1]}) de un dia de la semana para la Estetica.
     * @param diaSemana el dia de la semana (1-7)
     * @return          el horario de apertura y cierre
     */
    public LocalTime[] getHorarioDia(int diaSemana) {
        return this.horario[diaSemana - 1];
    }

    /**
     * Regresa un {@code LocalTime} con el horario de apertura de un dia de la semana para la Estetica.
     * @param diaSemana el dia de la semana (1-7)
     * @return          el horario de apertura 
     */
    public LocalTime getHorarioDeApertura(int diaSemana) {
        return this.horario[diaSemana - 1][0];
    }

    /**
     * Regresa un {@code LocalTime} con el horario de cierre de un dia de la semana para la Estetica.
     * @param diaSemana el dia de la semana (1-7)
     * @return          el horario de cierre 
     */
    public LocalTime getHorarioDeCierre(int diaSemana) {
        return this.horario[diaSemana - 1][1];
    }

    /**
     * Regresa un objeto {@code Consultorio} del espacio de los {@code Consultorio[]} de la Estetica
     * @param noConsultorio el numero del Consultorio (1-4)
     * @return el Consultorio segun su numero
     */
    public Consultorio getConsultorio(int noConsultorio) {
        return this.consultorios[noConsultorio - 1];
    }
    
    /**
     * Regresa un {@code Consultorio[]}, que son todos los consultorios de la Estetica.
     * @return los objetos Consultorio de la Estetica
     */
    public Consultorio[] getConsultorios() {
        return this.consultorios;
    }


    /**
     * Regresa un {@code String} con el nombre, direccion, telefono y horarios de la Estetica separados 
     * por comas.
     * @return la representacion del objeto Estetica
     */
    @Override
    public String toString() {
        String info = this.nombre + "," + this.getEstado() + "," + this.getCalle() + ",";
        info += this.getNumero() + "," + this.getCP() + "," + this.telefono + ",";
        info += this.getHorarios() + "," + this.getConsultoriosInfo();

        return info;
    }

    /**
     * Regresa un {@code String} que contiene los dias de la semana y sus horarios de cierre y apertura 
     * separados por comas. 1,9:00,17:30,2, ...
     * @return el horario de cierre y apertura de todos los dias de la semana
     */
    public String getHorarios() {
        String horarios = "";
        for (int i = 0; i < this.horario.length; i++) {
          if (i != 0)
            horarios += ",";

          horarios += Integer.toString(i + 1) + "," + this.getHorarioDeApertura(i + 1).toString() + "," + this.getHorarioDeCierre(i + 1).toString();
        }

        return horarios;
    }

    /**
     * Regresa un {@code String} que contiene la informacion de los consultorios de la Estetica separado por comas.
     * @return la informacion de los consultorios 
     * @see Consultorio#toString()
     */
    public String getConsultoriosInfo() {
        String info = "";
        for (Consultorio foo : this.consultorios) {
            info += foo.toString();
        }
        
        return info;
    }

}
