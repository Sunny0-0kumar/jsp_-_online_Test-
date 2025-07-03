
package mycon;

import java.sql.Connection;
import java.sql.DriverManager;


public class MyConnection {
    private static Connection con;
    public static Connection getconnection(){
        try{
        
            Class.forName("com.mysql.jdbc.Driver");
            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/sunny", "root", "Sunny@123");
       
        } catch(Exception ex){
            System.out.println(ex);
        }
        return con;
    }
    
}
