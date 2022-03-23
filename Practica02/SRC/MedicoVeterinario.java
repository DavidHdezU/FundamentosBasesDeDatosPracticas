package SRC;

import java.time.LocalTime;

class MedicoVeterinario{

    private String nombre_Vet;
    private String apellido_paterno;
    private String apellido_materno;
    private String rfc;
    private String correo;
    private char turno;
    
    public MedicoVeterinario(String nombre_vet, String appellido_paterno, String apellido_materno, String rfc, String correo, char turno){
            this.nombre_Vet = nombre_vet;
            this.apellido_paterno = appellido_paterno;
            this.apellido_materno = apellido_materno;
            this.rfc = rfc;
            this.correo = correo;
            this.turno = turno;

    }

    public String getNombre_vet(){
        return this.nombre_Vet;
    }
    public String getApellidoPaterno(){
        return this.apellido_paterno;
    }
    public String getaApellido_Materno(){
        return this.apellido_materno;
    }
    public String getRfc(){
        return this.rfc;
    }
    public String getCorreo(){
        return this.correo;
    }
    public char getTurno(){
        return this.turno;
    }
    public void setNombre_Vet(String nombre_Vet){
        this.nombre_Vet = nombre_Vet;
    }
    public void setApellido_Paterno(String appelido_Paterno){
        this.apellido_paterno = appelido_Paterno;
    }
    public void setApellido_Materno (String apellido_Materno){
        this.apellido_materno = apellido_Materno;
    }
    public void setRfc(String rfc){
        this.rfc = rfc;
    }
    public void setTurno(char turno){
        this.turno = turno;
    }
    public String leeTurno(char turno){
        if(turno == 'M' || turno == 'm'){
            return "Matutino";
        } else{
            if(turno == 'V' || turno == 'v'){
                return "Vespertino";
            } else{
                if(turno == 'N' || turno == 'n'){
                    return "Nocturno";
                } 
            }
        throw new IllegalArgumentException("Entrada inválida");
        }
    }
    public String toString(){
        String nombre = "Nombre del veterinario: "+this.nombre_Vet+" "+ this.apellido_paterno +" "+this.apellido_materno;
        return nombre+", rfc: "+this.rfc+", correo: "+ this.correo+", turno: "+leeTurno(this.turno);

    }
}