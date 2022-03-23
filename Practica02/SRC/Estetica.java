package SRC;

import java.time.LocalTime;
    
public class Estetica {
	String   nombre;
	String   telefono;
	String[] direccion;
	LocalTime[][] horario;
	Consultorio[] consultorios;
	
	public Estetica(String nombre, String estado, String calle, String numero, String cp, String telefono) { // TODO handle non-business days
		this.nombre    = nombre;
		this.telefono  = telefono;
		this.direccion = new String[] {
			estado,
			calle,
			numero,
			cp
		};
		this.setHorarios();
		this.consultorios = new Consultorio[4];
	}

	public Estetica(String nombre, String estado, String calle, String numero, String cp, String telefono, LocalTime[][] horario) {
		this(nombre, estado, calle, numero, cp, telefono);
		this.horario = horario;
		this.consultorios = new Consultorio[4];
	}

	public Estetica() {
		this.nombre    = "";
		this.telefono  = "";
		this.direccion = new String[4];
		this.horario   = new LocalTime[7][2];
		this.consultorios = new Consultorio[4];
	}


	private void setHorarios() {
		this.horario = new LocalTime[7][2];
		LocalTime[] horarioDeAtencion = new LocalTime[] {LocalTime.of(9, 0), LocalTime.of(17, 30)};
		for(int dia = 0; dia <= 6; dia++) {
			this.horario[dia] = horarioDeAtencion;
		}
	}

	public void setHorarioDia(int diaSemana, LocalTime[] horario) { // TODO throw exceptions
		this.horario[diaSemana - 1] = horario;
	}

	public void setHorarioApertura(int diaSemana, LocalTime horario) {
		this.horario[diaSemana - 1][0] = horario;
	}

	public void setHorarioApertura(int diaSemana, int hora, int minutos) {
		this.horario[diaSemana - 1][0] = LocalTime.of(hora, minutos);
	}

	public void setHorarioCierre(int diaSemana, LocalTime horario) {
		this.horario[diaSemana - 1][1] = horario;
	}

	public void setHorarioCierre(int diaSemana, int hora, int minutos) {
		this.horario[diaSemana - 1][1] = LocalTime.of(hora, minutos);
	}


	public String getNombre() {
		return this.nombre;
	}

	public String[] getDireccion() {
		return this.direccion;
	}

	public String getEstado() {
		return this.direccion[0];
	}

	public String getCalle() {
		return this.direccion[1];
	}

	public String getNumero() {
		return this.direccion[2];
	}

	public String getCP() {
		return this.direccion[3];
	}


	public LocalTime[][] getHorario() {
		return this.horario;
	}

	public LocalTime[] getHorarioDia(int diaSemana) {
		return this.horario[diaSemana - 1];
	}

	public LocalTime getHorarioDeApertura(int diaSemana) {
		return this.horario[diaSemana - 1][0];
	}

	public LocalTime getHorarioDeCierre(int diaSemana) {
		return this.horario[diaSemana - 1][1];
	}


	@Override
	public String toString() {
		String info = this.nombre + "," + this.getEstado() + "," + this.getCalle() + ",";
		info += this.getNumero() + "," + this.getCP() + "," + this.telefono + ",";
		info += this.getHorarios();

		return info;
	}

	public String getHorarios() {
		String horarios = "";
		for (int i = 0; i < this.horario.length; i++) {
			if (i != 0)
				horarios += ",";

			horarios += Integer.toString(i + 1) + "," + this.getHorarioDeApertura(i + 1).toString() + "," + this.getHorarioDeCierre(i + 1).toString();
		}

		return horarios;
	}


}
