
package dao;

import dto.RegUsers;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class RegUsersManager {
    public int saveuser(RegUsers u){
  
     
     int x=0;
     Connection con=mycon.MyConnection.getconnection();
      PreparedStatement checkstat=null;
      ResultSet rs=null;
      
      try{
          checkstat=con.prepareStatement("select * from student where stud_id=?");
          checkstat.setString(1,u.getStud_id());
          rs=checkstat.executeQuery();
       
           if(rs.next()){
                return 0;
            }else{
                     PreparedStatement ps=con.prepareStatement("insert into student values(?,?,?,?)");
                     ps.setString(1,u.getStud_id() );
                     ps.setString(2,u.getStud_name());
                     ps.setString(3,u.getPhone());
                     ps.setString(4,u.getPwd());
                     x=ps.executeUpdate();
            }
            
      }catch(Exception ex){
          System.out.println(ex);
      }
     
     return x;
     
    } 
}
