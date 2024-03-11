/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.List;
import model.Status;

/**
 *
 * @author d
 */
public class StatusDAO extends GenericDAO<Status>{

    @Override
    public List<Status> findAll() {
        return queryGenericDAO(Status.class);
    }
    public static void main(String[] args) {
        for (Status status : new StatusDAO().findAll()) {
            System.out.println(status);
        }
    }

    @Override
    public int insert(Status t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
