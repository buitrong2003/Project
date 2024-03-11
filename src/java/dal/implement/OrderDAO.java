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

    public List<Order> getListOrder() {
        String sql = "select * from [Order] order by \n"
                + "[order_id] desc";
        parameterMap = new LinkedHashMap<>();
        return queryGenericDAO(Order.class, sql, parameterMap);
    }

    public static void main(String[] args) {
        for (Order order : new OrderDAO().getListOrder()) {
            System.out.println(order);
        }
    }

    @Override
    public int insert(Order order) {
        String sql = "INSERT INTO [dbo].[Order]\n"
                + "           ([order_date]\n"
                + "           ,[total_amount]\n"
                + "           ,[id_status]\n"
                + "           ,[id_customer]\n"
                + "           ,[user_name])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("date", order.getOrder_date());
        parameterMap.put("totalAmount", order.getTotal_amount());
        parameterMap.put("status", order.getId_status());
        parameterMap.put("customer", order.getId_customer());
        parameterMap.put("userName", order.getUser_name());
        return insertGenericDAO(sql, parameterMap);
    }

    public List<Order> findOrderByUsernameCustomer(String userName) {
        String sql = "select * from [Order] where [user_name] = ? \n"
                + "order by id_customer desc";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("userName", userName);
        return queryGenericDAO(Order.class, sql, parameterMap);
    }

    public void deleteOrder(int idOrder) {
        String sql = "delete from [Order] where order_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("idOrder", idOrder);
        queryGenericDAO(Order.class, sql, parameterMap);
    }

    public void updateOrder(int idOrder, int statusID) {
        String sql = "UPDATE [dbo].[Order]\n"
                + "SET [id_status] = ?\n"
                + "WHERE order_id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("idStatus", statusID);
        parameterMap.put("idOrder", idOrder);
        updateGenericDAO(sql, parameterMap);
    }

}
