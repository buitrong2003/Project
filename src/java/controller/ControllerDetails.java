/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
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
import java.util.ArrayList;
import model.Book;
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
            Gson gson = new Gson();
            Book book = gson.fromJson(bookJSON, Book.class);
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
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("acount");
        if (!ManageCart.listCartBook.containsKey(user.getUser_name())) {
            ManageCart.listCartBook.put(user.getUser_name(), new ArrayList<>());
        }
        String bookJSON = request.getParameter("book");
        int quantity = Integer.parseInt(request.getParameter("quantityBook"));
        if (bookJSON != null) {
            bookJSON = URLDecoder.decode(bookJSON, StandardCharsets.UTF_8.name());
            response.setContentType("application/json; charset=UTF-8");
            Gson gson = new Gson();
            Book book = gson.fromJson(bookJSON, Book.class);
            boolean bookFound = false;
            Book book_cart = new Book(book.getBook_id(),
                    book.getName(), book.getAuthor(), book.getPublisher(),
                    book.getPrice(), book.getDescription(),
                    book.getGenre(), quantity, book.getPublication_date(),
                    book.getImage(), book.getCategory_id(), book.getBook_hot());
            if (ManageCart.listCartBook.get(user.getUser_name()).size() >= 1) {
                for (Book bookCart : ManageCart.listCartBook.get(user.getUser_name())) {
                    if (bookCart.getBook_id() == book_cart.getBook_id()) {
                        int quantityCart = bookCart.getQuantity() + book_cart.getQuantity();
                        if (quantityCart <= book.getQuantity()) {
                            bookCart.setQuantity(quantityCart);
                            book_cart.setQuantity(quantityCart);
                        } else {
                            book_cart.setQuantity(bookCart.getQuantity());
                            request.setAttribute("error", "Số lượng bạn chọn đã đạt mức tối đa của sản phẩm này");
                        }
                        bookFound = true;
                        break;
                    } else {
                        bookFound = false;
                    }
                }
                if (!bookFound) {
                    ManageCart.listCartBook.get(user.getUser_name()).add(book_cart);
                }
            }
            if (ManageCart.listCartBook.get(user.getUser_name()).isEmpty()) {
                ManageCart.listCartBook.get(user.getUser_name()).add(book_cart);
            }
            if (quantity > book.getQuantity() - book_cart.getQuantity()) {
                quantity = book.getQuantity() - book_cart.getQuantity();
            }
            String listCartJson = new Gson().toJson(ManageCart.listCartBook.get(user.getUser_name()));
            String encodedJson = URLEncoder.encode(listCartJson, "UTF-8");
            Cookie cookie = new Cookie(user.getUser_name(), encodedJson);
            int newQuantity = book.getQuantity() - book_cart.getQuantity();
            Cookie quantityMax = new Cookie("maxQuantity" + book.getBook_id(), book.getQuantity() + "");
            Cookie changeNumber = new Cookie("changeQuantityMaxBookCart", String.valueOf(newQuantity));
            changeNumber.setPath("/");
            cookie.setPath("/");
            quantityMax.setPath("/");
            response.addCookie(changeNumber);
            response.addCookie(quantityMax);
            response.addCookie(cookie);
            request.setAttribute("numberBook", quantity);
            request.setAttribute("book", book);
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
