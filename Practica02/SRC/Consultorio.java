package SRC;

import java.util.*;
import java.util.stream.Collectors;

/**
 * Clase para modelar objetos tipo Consultorio. Usada en la implementacion de {@link Estetica}
 * @author Diego Padilla 
 * @version 23.3.22
 */
public class Consultorio {
    MedicoVeterinario veterinario;
    HashMap<Mascota, String> pacientes;

    /**
     * Constructor de Consultorio
     * @param veterinario el {@link MedicoVeterinario} con el que inicializar el consultorio
     */
    public Consultorio(MedicoVeterinario veterinario) {
        this.veterinario = veterinario;
        this.pacientes = new HashMap<Mascota, String>();
    }

    /**
     * Constructor sin parametros de Consultorio
     */
    public Consultorio() {
        this.veterinario = new MedicoVeterinario("Juan", "Perez", "Prado", "XXXXXX", "mail@domain.com", 'M');
        this.pacientes = new HashMap<Mascota, String>();
    }

    /**
     * Constructor copia de Consultorio
     * @param consultorio el consultorio a copiar
     */
    public Consultorio(Consultorio consultorio) {
        this.veterinario = consultorio.getVeterinario();
        this.pacientes = consultorio.getPacientes();
    }

    /**
     * Permite aniadir un paciente {@link Mascota} a nuestro registro
     */
    public void addPaciente(Mascota mascota, String estado) {
        this.pacientes.put(mascota, estado);
    }

    /**
     * Regresa el {@code MedicoVeterinario} del Consultorio
     * @return el MedicoVeterinario
     */
    public MedicoVeterinario getVeterinario() {
        return this.veterinario;
    }

    /**
     * Regresa el {@code HashMap} que contiene a los pacientes {@link Mascota}
     * @return los pacientes
     */
    public HashMap<Mascota, String> getPacientes() {
        return this.pacientes;
    }


    /**
     * Regresa un {@code String} con la informacion del Consultorio.
     * @return la representacion del objeto Consultorio
     */
    @Override
    public String toString() {
        String info = this.veterinario.toString();
        if (this.pacientes.isEmpty())
            return info;

        return info + "," + this.getPacientesInfo();
    }

    /**
     * Regresa un {@code String} con la informacion de los pacientes.
     * @return la informacion de todos los pacientes
     */
    public String getPacientesInfo() {
        String pacientes = this.pacientes.keySet().stream()
            .map(key -> key + "," + this.pacientes.get(key))
            .collect(Collectors.joining(",","",""));

        return pacientes;
    }

}
