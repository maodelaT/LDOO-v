package usuario;

/**
 *
 * @author USER END
 */
public class usuario {

    private String nombre;
    private String apellido;
    private String correo;
    private String contrasenia;
    
    public usuario(){
        this("Desconocido");
    }
    
    public usuario(String nombre){
        this(nombre, "Desconocido");
    }
    
    public usuario(String nombre, String apellido){
        setNombre(nombre);
        setApellido(apellido);
    }
    
   
    
    
    
    
    public void setNombre(String nombre){
        if(nombre.length() > 0){
            this.nombre = nombre;
        }
    }
    
    public String getNombre(){
        return nombre;
    }
    
    public void setApellido(String apellido){
        if(apellido.length() > 0){
            this.apellido = apellido;
        }
    }
    
    public String getApellido(){
        return apellido;
    }
    
    public void setContrasenia(String contrasenia){
        if(contrasenia.length() > 0){
            this.contrasenia = contrasenia;
        }
    }
    
    public String getContrasenia(){
        return contrasenia;
    }
    
    public void setCorreo(String correo){
        if(correo.length() > 0){
            this.correo = correo;
        }
    }
    
    public String getCorreo(){
        return correo;
    }
}
