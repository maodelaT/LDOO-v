package Modelo;

/**
 *
 * @author Mauricio de la Torre
 */
public class UsuariosPOJO {

    //Declaracion de variables:
    private String nombre;
    private String apellido;
    private String correo;
    private String password;
    private boolean voto;
    
    //Metodos:

    /**
     * @return the nombre
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
     * @return the apellido
     */
    public String getApellido() {
        return apellido;
    }

    /**
     * @param apellido the apellido to set
     */
    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    /**
     * @return the correo
     */
    public String getCorreo() {
        return correo;
    }

    /**
     * @param correo the correo to set
     */
    public void setCorreo(String correo) {
        this.correo = correo;
    }

    /**
     * @return the password
     */
    public String getPassword() {
        return password;
    }

    /**
     * @param password the password to set
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     * @return the voto
     */
    public boolean getVoto() {
        return voto;
    }

    /**
     * @param voto the voto to set
     */
    public void setVoto(boolean voto) {
        this.voto = voto;
    }
}
