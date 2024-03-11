/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.util.LinkedHashMap;
import java.util.List;
import model.Customer;

/**
 *
 * @author d
 */
public class CustomerDAO extends GenericDAO<Customer> {

    @Override
    public List<Customer> findAll() {
        return queryGenericDAO(Customer.class);
    }

    public static void main(String[] args) {
        Customer customer = Customer.builder()
                .name("Nguyen Van A")
                .address("Ha Noi")
                .phone("09475874876")
                .email("fdgdf@gmail.com")
                .build();
        System.out.println(new CustomerDAO().insert(customer));
    }

    @Override
    public int insert(Customer t) {
        String sql = "INSERT INTO [dbo].[Customer]\n"
                + "           ([name]\n"
                + "           ,[address]\n"
                + "           ,[phone]\n"
                + "           ,[email])\n"
                + "     VALUES\n"
                + "           (?\n"
                + "           ,?\n"
                + "           ,?\n"
                + "           ,?)";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("name", t.getName());
        parameterMap.put("address", t.getAddress());
        parameterMap.put("phone", t.getPhone());
        parameterMap.put("email", t.getEmail());
        return insertGenericDAO(sql, parameterMap);
    }

    public Customer findCustomerById(int id) {
        String sql = "select * from Customer where id = ?";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("id", id);
        List<Customer> listCustomer = queryGenericDAO(Customer.class, sql, parameterMap);
        if (listCustomer.isEmpty()) {
            return null;
        }
        return listCustomer.get(0);
    }
}
