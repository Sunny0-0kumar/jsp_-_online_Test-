
package mycon;

import java.sql.Connection;
import java.sql.DriverManager;


public class MyConnection {
    private static Connection con;
    public static Connection getconnection(){
        try{
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = System.getenv("MYSQL_PUBLIC_URL");
            String user = System.getenv("MYSQLUSER");
            String password = System.getenv("MYSQL_ROOT_PASSWORD");

            con = DriverManager.getConnection(url, user, password);
       
        } catch(Exception ex){
           ex.printStackTrace();
        }
        return con;
    }
    
}
