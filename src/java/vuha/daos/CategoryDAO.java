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
import java.util.ArrayList;
import javax.naming.NamingException;
import vuha.dtos.CategoryDTO;
import vuha.utils.DBUtil;

/**
 *
 * @author Admin
 */
public class CategoryDAO {

    public static ArrayList<CategoryDTO> getCategory() throws SQLException, NamingException {
        ArrayList<CategoryDTO> list = null;
        Connection cn = null;
        PreparedStatement pst = null;
        ResultSet rs = null;
        try {
            cn = DBUtil.makeConnetion();
            if (cn != null) {
                String sql = "select categoryID,categoryName\n"
                        + "from tblCategorys";
                pst = cn.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    String categoryID = rs.getString("categoryID");
                    String categoryName = rs.getString("categoryName");
                    CategoryDTO category = new CategoryDTO(categoryID, categoryName);
                    if (list == null) {
                        list = new ArrayList<>();
                    }
                    list.add(category);
                }
            }
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (pst != null) {
                pst.close();
            }
            if (cn != null) {
                cn.close();
            }
        }
        return list;
    }
}
