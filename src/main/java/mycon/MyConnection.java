
package mycon;

import java.sql.Connection;
import java.sql.DriverManager;


public class MyConnection {
    private static Connection con;
    public static Connection getconnection(){
        try{
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = System.getenv(DB_URL);
            String user = System.getenv(DB_USER);
            String password = System.getenv(DB_PASSWORD);

            con = DriverManager.getConnection(url, user, password);
       
        } catch(Exception ex){
           ex.printStackTrace();
        }
        return con;
    }
    
}
