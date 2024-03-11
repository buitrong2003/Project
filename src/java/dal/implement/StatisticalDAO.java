/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal.implement;

import dal.GenericDAO;
import java.time.LocalDate;
import java.util.LinkedHashMap;
import java.util.List;
import model.Statistical;

/**
 *
 * @author d
 */
public class StatisticalDAO extends GenericDAO<Statistical> {

    @Override
    public List<Statistical> findAll() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        LocalDate currentDate = LocalDate.now();
        int year = currentDate.getYear();
        System.out.println("Năm hiện tại là: " + year);
    }

    public List<Statistical> getListStatistical(String year) {
        String sql = "select Month(order_date) as [month], sum(total_amount)\n"
                + "as [totalAmount] from [Order]\n"
                + "where YEAR(order_date) = ? and id_status = ?\n"
                + "group by Month(order_date) ";
        parameterMap = new LinkedHashMap<>();
        parameterMap.put("year", year);
        parameterMap.put("status", 3);
        return queryGenericDAO(Statistical.class, sql, parameterMap);
    }

    @Override
    public int insert(Statistical t) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

}
