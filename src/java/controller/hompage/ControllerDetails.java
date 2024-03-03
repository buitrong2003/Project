/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hompage;

import controller.hompage.BookDeserializer;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import model.Book;
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author d
 */
public class ControllerDetails extends HttpServlet {

    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String bookJSON = request.getParameter("book");
        if (bookJSON != null) {
            bookJSON = URLDecoder.decode(bookJSON, StandardCharsets.UTF_8.name());
            response.setContentType("application/json; charset=UTF-8");
            Gson gson = new GsonBuilder()
                    .registerTypeAdapter(Book.class, new BookDeserializer())
                    .create();
            Book book = gson.fromJson(bookJSON, Book.class);
            HttpSession session = request.getSession(false);
            User user = (User) session.getAttribute("acount");
            String listCartJson = null;
            if (user != null) {
                Cookie[] cookies = request.getCookies();
                if (cookies != null) {
                    for (Cookie cookie : cookies) {
                        if (cookie.getName().equalsIgnoreCase(user.getUser_name())) {
                            listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                        }
                    }
                }
            }

            int remainingQuantity = book.getQuantity();
            Gson gsonItem = new GsonBuilder()
                    .registerTypeAdapter(Item[].class, new ItemDeserialize())
                    .create();
            Item[] itemArray = gsonItem.fromJson(listCartJson, Item[].class);
            if (itemArray != null) {
                for (Item item : itemArray) {
                    if (item.getBook().getBook_id() == book.getBook_id()) {
                        remainingQuantity = book.getQuantity() - item.getQuantity();
                        break;
                    }
                }
            }
            request.setAttribute("maxQuantityCart", remainingQuantity);
            request.setAttribute("book", book);
            request.getRequestDispatcher("view/details.jsp").forward(request, response);
        }
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
        Gson gson = new GsonBuilder()
                .registerTypeAdapter(Book.class, new BookDeserializer())
                .create();
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("acount");
        Cookie[] cookies = request.getCookies();
        Item[] itemArray = null;
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equalsIgnoreCase(user.getUser_name())) {
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        Gson gsonItem = new GsonBuilder()
                .registerTypeAdapter(Item[].class, new ItemDeserialize())
                .create();
        itemArray = gsonItem.fromJson(listCartJson, Item[].class);
        String bookJSON = request.getParameter("book");
        int quantity = Integer.parseInt(request.getParameter("quantityBook"));
        if (bookJSON != null) {
            bookJSON = URLDecoder.decode(bookJSON, StandardCharsets.UTF_8.name());
            response.setContentType("application/json; charset=UTF-8");
            Book book = gson.fromJson(bookJSON, Book.class);
            Item item = new Item(book, quantity, book.getPrice());
            Cart cart = new Cart(user.getUser_name(), itemArray, item);
            item = cart.getItemById(user.getUser_name(), book.getBook_id());
            String jsonCart = new Gson().toJson(cart.getListCart().get(user.getUser_name()));
            String encodedJson = URLEncoder.encode(jsonCart, "UTF-8");
            if (quantity > book.getQuantity() - item.getQuantity()) {
                quantity = book.getQuantity() - item.getQuantity();
            }
            Cookie cookieItem = new Cookie(user.getUser_name(), encodedJson);
            cookieItem.setPath("/");
            response.addCookie(cookieItem);
            request.setAttribute("book", item.getBook());
            request.setAttribute("quantity", quantity);
            request.setAttribute("maxQuantityCart", book.getQuantity() - item.getQuantity());
            request.getRequestDispatcher("view/details.jsp").forward(request, response);
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
