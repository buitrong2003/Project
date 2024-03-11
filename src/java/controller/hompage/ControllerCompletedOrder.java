/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hompage;

import dal.implement.BookDAO;
import dal.implement.CustomerDAO;
import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import dal.implement.StatusDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Book;
import model.Customer;
import model.Order;
import model.OrderDetails;
import model.Status;
import model.User;

/**
 *
 * @author d
 */
public class ControllerCompletedOrder extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    OrderDAO daoOrder = new OrderDAO();
    CustomerDAO daoCustomer = new CustomerDAO();
    OrderDetailsDAO daoOrderDetail = new OrderDetailsDAO();
    BookDAO daoBook = new BookDAO();
    StatusDAO daoStatus = new StatusDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acount");
        List<Order> listOrderByUserName = daoOrder.findOrderByUsernameCustomer(user.getUser_name());
        List<Customer> listCustomer = daoCustomer.findAll();
        List<OrderDetails> listOrderDetailses = daoOrderDetail.findAll();
        List<Book> listBook = daoBook.findAll();
        List<Status> listStatus = daoStatus.findAll();
        request.setAttribute("listStatus", listStatus);
        request.setAttribute("listBook", listBook);
        request.setAttribute("listOrder", listOrderByUserName);
        request.setAttribute("listCustomer", listCustomer);
        request.setAttribute("listOrderDetails", listOrderDetailses);
        request.getRequestDispatcher("view/completedOrder.jsp").forward(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
