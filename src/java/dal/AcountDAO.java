/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.LinkedHashMap;
import java.util.List;
import model.User;

/**
 *
 * @author d
 */
public class AcountDAO extends GenericDAO<User> {

    @Override
    public List<User> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {

    }

    @Override
    public int insert(User user) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([user_name]\n"
                + "           ,[password]\n"
                + "           ,[email])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", user.getUser_name());
        parameterMap.put("password", user.getPassword());
        parameterMap.put("email", user.getEmail());
        return insertGenericDAO(sql, parameterMap);
    }

    public User getUser(String username, String password) {
        String sql = "select * from [User] where user_name = ? and password = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        parameterMap.put("password", password);
        return queryGenericDAO(User.class, sql, parameterMap).get(0);
    }

    public void addUserRole(String username, int role) {
        String sql = "INSERT INTO [dbo].[UserRole]\n"
                + "           ([user_name]\n"
                + "           ,[id_role])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        parameterMap.put("role", role);
        insertGenericDAO(sql, parameterMap);
    }
}
