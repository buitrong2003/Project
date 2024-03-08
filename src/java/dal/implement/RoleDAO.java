/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Role;

/**
 *
 * @author d
 */
public class RoleDAO extends GenericDAO<Role> {

    @Override
    public List<Role> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public List<Role> getListRole() {
        String sql = "select * from [Role]\n"
                + "where name_role != ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", "Admin");
        return queryGenericDAO(Role.class, sql, parameterMap);
    }

    @Override
    public int insert(Role t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
