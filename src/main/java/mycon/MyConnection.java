
package mycon;

import java.sql.Connection;
import java.sql.DriverManager;


public class MyConnection {
    private static Connection con;
    public static Connection getconnection(){
        try{
        
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://yamanote.proxy.rlwy.net:23471/sunny?useSSL=false";
            String user = "root";
            String password = "gFBcSIcWsHIaNeUjxDNiUPOoXzrpJBOP";

            con = DriverManager.getConnection(url, user, password);
       
        } catch(Exception ex){
            System.out.println(ex);
        }
        return con;
    }
    
}
