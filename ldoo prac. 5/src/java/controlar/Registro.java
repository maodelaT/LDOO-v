
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package controlar;

/**
 *
 * @author MDTL
 */
public class Registro {
    private String name;
    private String lastname1;
    private String lastname2;
    private String birth;
    private String mail;
    private String pass;

    public String getName() {
        return name;
    }

    public String getLastname1() {
        return lastname1;
    }

    public String getLastname2() {
        return lastname2;
    }

    public String getBrtdy() {
        return birth;
    }

    public String getMail() {
        return mail;
    }

    public String getPass() {
        return pass;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setLastname1(String lastname1) {
        this.lastname1 = lastname1;
    }

    public void setLastname2(String lastname2) {
        this.lastname2 = lastname2;
    }

    public void setBrtdy(String brtdy) {
        this.birth = birth;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
        
}