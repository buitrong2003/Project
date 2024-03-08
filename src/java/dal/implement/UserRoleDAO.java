/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.UserRole;

/**
 *
 * @author d
 */
public class UserRoleDAO extends GenericDAO<UserRole> {

    @Override
    public List<UserRole> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public UserRole getRoleUser(String userName) {
        String sql = "select * from [UserRole] where user_name = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", userName);
        return queryGenericDAO(UserRole.class, sql, parameterMap).get(0);
    }

    @Override
    public int insert(UserRole t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void deleteUser(String username) {
        String sql = "delete from UserRole where \n"
                + "[user_name] = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        deleteGenericDAO(sql, parameterMap);
    }

}
