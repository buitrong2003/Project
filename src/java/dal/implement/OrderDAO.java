/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Order;

/**
 *
 * @author d
 */
public class OrderDAO extends GenericDAO<Order> {

    @Override
    public List<Order> findAll() {
        return queryGenericDAO(Order.class);
    }

    @Override
    public int insert(Order t) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([order_name]\n"
                + "           ,[order_date]\n"
                + "           ,[total_amount]\n"
                + "           ,[id_status]\n"
                + "           ,[quantity]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", t.getOrder_name());
        parameterMap.put("date", t.getOrder_date());
        parameterMap.put("amount", t.getTotal_amount());
        parameterMap.put("status", t.getId_status());
        parameterMap.put("quantity", t.getQuantity());
        parameterMap.put("price", t.getPrice());
        return insertGenericDAO(sql, parameterMap);
    }

}
