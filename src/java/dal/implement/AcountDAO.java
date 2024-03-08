/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
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
        return queryGenericDAO(User.class);
    }

    @Override
    public int insert(User user) {
        String sql = "INSERT INTO [dbo].[User]\n"
                + "           ([user_name]\n"
                + "           ,[password]\n"
                + "           ,[email]\n"
                + "           ,[image]\n"
                + "           ,[type])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", user.getUser_name());
        parameterMap.put("password", user.getPassword());
        parameterMap.put("email", user.getEmail());
        parameterMap.put("image", user.getImage());
        parameterMap.put("type", user.getType());
        return insertGenericDAO(sql, parameterMap);
    }

    public void updateUser(User user) {
        String sql = "UPDATE [dbo].[User]\n"
                + "   SET [password] = ?\n"
                + "      ,[email] = ?\n"
                + "      ,[image] = ?\n"
                + "      ,[type] = ?\n"
                + " WHERE [user_name] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("password", user.getPassword());
        parameterMap.put("email", user.getEmail());
        parameterMap.put("image", user.getImage());
        parameterMap.put("type", user.getType());
        parameterMap.put("username", user.getUser_name());
        updateGenericDAO(sql, parameterMap);
    }

    public List<User> getListByUser() {
        String sql = "select * from [User] where [type] != ? ";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("type", "Admin");
        return queryGenericDAO(User.class, sql, parameterMap);
    }

    public User getUser(String username, String password) {
        String sql = "select * from [User] where user_name = ? and password = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        parameterMap.put("password", password);
        List<User> listUser = queryGenericDAO(User.class, sql, parameterMap);
        if (listUser.isEmpty()) {
            return null;
        }
        return listUser.get(0);
    }

    public User checkExistAcount(String username) {
        String sql = "select * from [User]\n"
                + "where [user_name] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        List<User> listUser = queryGenericDAO(User.class, sql, parameterMap);
        return listUser.isEmpty() ? null : listUser.get(0);
    }
}
