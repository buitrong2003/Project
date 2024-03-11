/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hompage;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import dal.implement.BookDAO;
import dal.implement.CustomerDAO;
import dal.implement.OrderDAO;
import dal.implement.OrderDetailsDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.sql.Date;
import java.util.List;
import model.Book;
import model.Cart;
import model.Customer;
import model.Item;
import model.Order;
import model.OrderDetails;
import model.User;

/**
 *
 * @author d
 */
public class ControllerCheckOut extends HttpServlet {

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
    OrderDetailsDAO daoOrderDetails = new OrderDetailsDAO();
    BookDAO daoBook = new BookDAO();
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
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
        List<Book> listBook = daoBook.findAll();
        String nameCustomer = request.getParameter("name");
        String address = request.getParameter("address");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acount");
        String username = user == null ? "|" : user.getUser_name();
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(username)) {
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        Gson gsonItem = new GsonBuilder()
                .registerTypeAdapter(Item[].class, new ItemDeserialize())
                .create();
        Item[] itemArray = gsonItem.fromJson(listCartJson, Item[].class);
        Cart cart = null;
        if (listCartJson != null) {
            cart = new Cart(username, itemArray, null);
        }
        if (cart != null) {
            double totalAmount = cart.totalMoney(username);
            Customer customer = Customer.builder()
                    .name(nameCustomer)
                    .address(address)
                    .phone(phone)
                    .email(email)
                    .build();
            int idCustomer = daoCustomer.insert(customer);
            Date currentDate = new Date(System.currentTimeMillis());
            Order order = Order.builder()
                    .order_date(currentDate)
                    .total_amount(totalAmount)
                    .id_status(1)
                    .id_customer(idCustomer)
                    .user_name(username)
                    .build();
            int orderID = daoOrder.insert(order);
            for (Item item : cart.getListCart().get(username)) {
                OrderDetails orderDetails = OrderDetails.builder()
                        .order_id(orderID)
                        .book_id(item.getBook().getBook_id())
                        .quantity(item.getQuantity())
                        .price(item.getQuantity() * item.getPrice())
                        .build();
                daoOrderDetails.insert(orderDetails);
            }
            processCheckout(listBook, itemArray);
        }
        Cookie cookieDelete = new Cookie(username, "");
        cookieDelete.setPath("/");
        cookieDelete.setMaxAge(0);
        response.addCookie(cookieDelete);
        response.sendRedirect("completed");
    }
    
    private void processCheckout(List<Book> listBook, Item[] itemArray) {
        for (Item item : itemArray) {
            for (Book book : listBook) {
                if (item.getBook().getBook_id() == book.getBook_id()) {
                    int quantity = book.getQuantity() - item.getQuantity();
                    if (quantity >= 0) {
                        book.setQuantity(quantity);
                        daoBook.setQuantity(book.getBook_id(), quantity);
                    }
                }
            }
        }
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
