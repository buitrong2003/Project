/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

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
import java.util.List;
import model.Book;
import model.Customer;
import model.Order;
import model.OrderDetails;
import model.Status;

/**
 *
 * @author d
 */
public class OrderAdminServlet extends HttpServlet {

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
        List<Order> listOrder = daoOrder.getListOrder();
        List<Customer> listCustomer = daoCustomer.findAll();
        List<OrderDetails> listOrderDetailses = daoOrderDetail.findAll();
        List<Book> listBook = daoBook.findAll();
        List<Status> listStatus = daoStatus.findAll();
        request.setAttribute("listStatus", listStatus);
        request.setAttribute("listBook", listBook);
        request.setAttribute("listOrder", listOrder);
        request.setAttribute("listCustomer", listCustomer);
        request.setAttribute("listOrderDetails", listOrderDetailses);
        request.getRequestDispatcher("../view/admin/orderUser.jsp").forward(request, response);
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
        String action = request.getParameter("action") == null ? ""
                : request.getParameter("action");
        switch (action) {
            case "edit" ->
                editOrderOfUser(request);
            case "delete" ->
                deleteOrderOfUser(request);
        }
        response.sendRedirect("order");
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

    private void editOrderOfUser(HttpServletRequest request) {
        int statusID = Integer.parseInt(request.getParameter("statusID"));
        int idOrder = Integer.parseInt(request.getParameter("id"));
        daoOrder.updateOrder(idOrder, statusID);
    }

    private void deleteOrderOfUser(HttpServletRequest request) {
        int idOrder = Integer.parseInt(request.getParameter("idOrder"));
        daoOrder.deleteOrder(idOrder);
    }

}
