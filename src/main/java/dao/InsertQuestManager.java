
package dao;

import dto.Quest;
import java.sql.Connection;
import java.sql.PreparedStatement;


public class InsertQuestManager {
    public int questsave(Quest q){
        int c=0;
        Connection con=mycon.MyConnection.getconnection();
        if(q.getQ_id()!=0){
        try{
           PreparedStatement ps=con.prepareStatement("insert into question values(?,?,?,?,?,?,?)");
            ps.setInt(1,q.getQ_id());
            ps.setString(2,q.getQues());
            ps.setInt(3,q.getAns());
            ps.setString(4,q.getOp1());
            ps.setString(5,q.getOp2());
            ps.setString(6,q.getOp3());
            ps.setString(7,q.getOp4());
            
            c=ps.executeUpdate();
        }catch(Exception ex){
            System.out.println(ex);
        }
      } 
    return c;
        
    }
}
