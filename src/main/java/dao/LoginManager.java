
package dao;

import dto.RegUsers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class LoginManager {
    public int savelogin(RegUsers u1){
        
        String user=u1.getStud_id();
        String pass=u1.getPwd();
        
      if(user!="" && pass!="")
      {  
        Connection con=mycon.MyConnection.getconnection();
        try{
            PreparedStatement ps=con.prepareStatement("select * from student");
            ResultSet rs=ps.executeQuery();
            while(rs.next())
            {
                String stud_id=rs.getString(1);
                String pwd=rs.getString(4);
                if(user.equals(stud_id) && pass.equals(pwd)){
                        
                        return 1;
                }
            }
        }catch(Exception ex){
            System.out.println(ex);
        }  
      }
      return 0;
    }
}
