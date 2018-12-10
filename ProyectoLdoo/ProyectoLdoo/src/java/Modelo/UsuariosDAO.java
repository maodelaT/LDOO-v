package Modelo;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Mauricio de la Torre
 */
public class UsuariosDAO {

    //Declaracion de variables:
    private Connection conexion;

    //Metodos:
    private void abrirConexion() throws SQLException {
        String dbURI = "jdbc:derby://localhost:1527/Usuarios";
        String username = "fcfm";
        String password = "escuadronjava";
        conexion = DriverManager.getConnection(dbURI, username, password);
    }

    private void cerrarConexion() throws SQLException {
        conexion.close();
    }

    public void registrar(UsuariosPOJO pojo) {
        try {
            abrirConexion();
            String query = "insert into USUARIOS values (\'" + pojo.getNombre() + "\', \'" + pojo.getApellido() + "\', \'" + pojo.getCorreo() + "\', \'" + pojo.getPassword() + "\', " + pojo.getVoto() + ")";
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(query);
            cerrarConexion();
        } catch (SQLException e) {
            System.out.print("Ha ocurrido un error al tratar de registrarse " + e.toString());
        }
    }

    public boolean logear(UsuariosPOJO pojo) {
        ResultSet usuario;
        Boolean esUsuario = false;

        try {
            abrirConexion();
            String query = "select * from USUARIOS where CORREO = \'" + pojo.getCorreo() + "\' and PASSWORD = \'" + pojo.getPassword() + "\'";
            Statement stmt = conexion.createStatement();
            usuario = stmt.executeQuery(query);

            //Proceso:
            esUsuario = usuario.next();

            cerrarConexion();
        } catch (SQLException e) {
            System.out.print("Ha ocurrido un error al tratar de iniciar sesion " + e.toString());
        }
        return esUsuario;
    }

    public UsuariosPOJO getUsuario(String correo, String password) {
        UsuariosPOJO uPOJO = null;
        ResultSet usuario;

        try {
            abrirConexion();
            String query = "select * from USUARIOS where CORREO = \'" + correo + "\' and PASSWORD = \'" + password + "\'";
            Statement stmt = conexion.createStatement();
            usuario = stmt.executeQuery(query);

            //Proceso:
            if(usuario.next()) {
                uPOJO = new UsuariosPOJO();
                String nombre = usuario.getString("NOMBRE");
                String apellido = usuario.getString("APELLIDO");
                String correo2 = usuario.getString("CORREO");
                String password2 = usuario.getString("PASSWORD");
                boolean voto = usuario.getBoolean("VOTO");

                uPOJO.setNombre(nombre);
                uPOJO.setApellido(apellido);
                uPOJO.setCorreo(correo2);
                uPOJO.setPassword(password2);
                uPOJO.setVoto(voto);
            }
            cerrarConexion();
        } catch (SQLException e) {
            System.out.print("Ha ocurrido un error al tratar de obtener usuario " + e.toString());
        }

        return uPOJO;
    }
    
    public void setVoto(String correo){
        ResultSet usuario;
        try{
        abrirConexion();
        String query = "UPDATE USUARIOS SET VOTO = true WHERE CORREO = \'" + correo + "\'";
        Statement stmt = conexion.createStatement();
        stmt.executeUpdate(query);
        cerrarConexion();
        }catch(SQLException e){
            System.out.print("Ha ocurrido un error al intentar establecer voto "+e.toString());
        }
    }
}
