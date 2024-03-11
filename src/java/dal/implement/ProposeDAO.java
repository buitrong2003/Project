/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Propose;

/**
 *
 * @author d
 */
public class ProposeDAO extends GenericDAO<Propose> {

    @Override
    public List<Propose> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        for (Propose propose : new ProposeDAO().getListPropose("mrb")) {
            System.out.println(propose);
        }
    }

    public List<Propose> getListPropose(String username) {
        String sql = "select od.book_id,b.category_id,b.author from [OrderDetails] od\n"
                + "join [Order] o on od.order_id = o.order_id\n"
                + "join [Book] b on b.book_id = od.book_id\n"
                + "where [user_name] = ?  group by \n"
                + "od.book_id,b.category_id,b.author";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("username", username);
        return queryGenericDAO(Propose.class, sql, parameterMap);
    }

    @Override
    public int insert(Propose t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
