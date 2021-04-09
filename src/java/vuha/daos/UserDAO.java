/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.daos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.naming.NamingException;
import vuha.dtos.UserDTO;
import vuha.utils.DBUtil;

/**
 *
 * @author Admin
 */
public class UserDAO {
    public static UserDTO getUser(String userID,String password) throws SQLException, NamingException{
        UserDTO user=null;
        Connection cn=null;
        PreparedStatement pst=null;
        ResultSet rs=null;
        try{
            cn=DBUtil.makeConnetion();
            if(cn!=null){
               String sql="select userName,roleID from tblUsers where password=? and userID=?";
               pst=cn.prepareStatement(sql);
               pst.setString(1, password);
               pst.setString(2, userID);
               rs=pst.executeQuery();
               if(rs.next()){
                   String roleID=rs.getString("roleID");
                   String userName=rs.getString("userName");
                   user=new UserDTO(userID, roleID, userName);
               }
            }
        }finally{
            if(rs!=null) rs.close();
            if(pst!=null) pst.close();
            if(cn!=null)cn.close();
        }
        
        return user;
    }
}
