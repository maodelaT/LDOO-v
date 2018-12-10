package Modelo;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 *
 * @author Mauricio de la Torre
 */
public class JavaMD5Hash {

    public static String md5(String input) {

        //Variables:
        String md5 = null;

        //Metodos:
        if (input == null) {
            return null;
        } else {
            try {
                //Creacion de objeto MessageDigest para MD5:
                MessageDigest digest = MessageDigest.getInstance("MD5");

                //Actualizar la entrada en MessageDigest:
                digest.update(input.getBytes(), 0, input.length());

                //Convertir el valor de MessageDigest en base 16 (hex):
                md5 = new BigInteger(1, digest.digest()).toString(16);

            } catch (NoSuchAlgorithmException e) {
                System.out.print("Ups, algo salio mal\n"+ e.toString());
            }
        }
        return md5;
    }
}
