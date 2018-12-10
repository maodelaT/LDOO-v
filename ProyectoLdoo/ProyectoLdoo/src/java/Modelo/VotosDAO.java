/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

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
public class VotosDAO {

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
    
    public void votar(VotosPOJO pojo){
        try{
            abrirConexion();
            String query = "UPDATE VOTACIONES SET VOTOS = VOTOS+1 WHERE TEMA = \'" + pojo.getTema() + "\'" + " AND CANDIDATO = \'" + pojo.getCandidato() + "\'";
            Statement stmt = conexion.createStatement();
            stmt.executeUpdate(query);
            cerrarConexion();
        }catch(SQLException e){
            System.out.print("Ha ocurrido un error al tratar de votar "+e.toString());
        }
    }
    
    public VotosPOJO getVotos(String tema, String candidato){
        VotosPOJO vPOJO = null;
        ResultSet votos;

        try {
            abrirConexion();
            String query = "SELECT * FROM VOTACIONES WHERE TEMA = \'" + tema + "\' AND CANDIDATO = \'" + candidato + "\'";
            Statement stmt = conexion.createStatement();
            votos = stmt.executeQuery(query);

            //Proceso:
            if(votos.next()) {
                vPOJO = new VotosPOJO();
                String tema2 = votos.getString("TEMA");
                String candidato2 = votos.getString("CANDIDATO");
                int votos2 = votos.getInt("VOTOS");

                vPOJO.setTema(tema2);
                vPOJO.setCandidato(candidato2);
                vPOJO.setVotos(votos2);
            }
            cerrarConexion();
        } catch (SQLException e) {
            System.out.print("Ha ocurrido un error al tratar de obtener usuario " + e.toString());
        }

        return vPOJO;
    }
}
