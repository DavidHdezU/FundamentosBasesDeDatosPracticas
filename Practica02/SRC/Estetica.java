import java.time.LocalTime;
import java.util.HashMap;

public class Estetica {
	String   nombre;
	String   telefono;
	String[] direccion;
	LocalTime[][] horario;
	Consultorio[] consultorios;
	
	public Estetica(String nombre, String estado, String calle, String numero, String cp, String telefono) {
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


	public static void main(String[] args) {
		Estetica es = new Estetica("Patitas", "CDMX", "Principal", "6", "15897", "(55) 8978 5986");
		Estetica es1 = new Estetica();
		System.out.println(es.getEstado());

		LocalTime[] horario = new LocalTime[] {LocalTime.of(9,0), LocalTime.of(16,30)};
		es.setHorarioDia(1, horario);
		es.setHorarioApertura(2, 10, 0);
		es.setHorarioCierre(7, 22, 30);

		System.out.println(es.getHorarioDeApertura(1));
		System.out.println(es.getHorarioDeApertura(2));
		System.out.println(es.getHorarioDeCierre(7));

	}
}
