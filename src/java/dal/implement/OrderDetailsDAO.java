/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.OrderDetails;

/**
 *
 * @author d
 */
public class OrderDetailsDAO extends GenericDAO<OrderDetails> {

    @Override
    public List<OrderDetails> findAll() {
        return queryGenericDAO(OrderDetails.class);
    }

    @Override
    public int insert(OrderDetails t) {
        String sql = "INSERT INTO [dbo].[OrderDetails]\n"
                + "           ([order_id]\n"
                + "           ,[book_id]\n"
                + "           ,[quantity]\n"
                + "           ,[price])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("idOrder", t.getOrder_id());
        parameterMap.put("idBook", t.getBook_id());
        parameterMap.put("quantity", t.getQuantity());
        parameterMap.put("price", t.getPrice());
        return insertGenericDAO(sql, parameterMap);
    }

    
}
