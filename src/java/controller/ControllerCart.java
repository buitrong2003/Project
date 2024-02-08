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
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;
import model.Book;

/**
 *
 * @author d
 */
public class ControllerCart extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    List<Book> listCart = new ArrayList<>();

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
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
        int raw_numberBook = Integer.parseInt(request.getParameter("numberChange"));
        int quantity = Integer.parseInt(request.getParameter("quantityBook"));
        if (bookJSON != null) {
            bookJSON = URLDecoder.decode(bookJSON, StandardCharsets.UTF_8.name());
            response.setContentType("application/json; charset=UTF-8");
            Gson gson = new Gson();
            Book book = gson.fromJson(bookJSON, Book.class);
            if (checkCart(request, response, book)) {
                request.setAttribute("error", "Số lượng bạn chọn đã đạt mức tối đa của sản phẩm này");
            } else {
                boolean bookFound = false;
                Book book_cart = new Book(book.getBook_id(),
                        book.getName(), book.getAuthor(), book.getPublisher(),
                        book.getPrice(), book.getDescription(),
                        book.getGenre(), quantity, book.getPublication_date(),
                        book.getImage(), book.getCategory_id(), book.getBook_hot());

                if (listCart.size() >= 1) {
                    for (Book bookCart : listCart) {
                        if (bookCart.getBook_id() == book_cart.getBook_id()) {
                            bookCart.setQuantity(bookCart.getQuantity() + book_cart.getQuantity());
                            bookFound = true;
                        } else {
                            bookFound = false;
                        }
                    }
                    if (!bookFound) {
                        listCart.add(book_cart);
                    }
                }
                if (listCart.isEmpty()) {
                    listCart.add(book_cart);
                }
                String listCartJson = new Gson().toJson(listCart);
                String encodedJson = URLEncoder.encode(listCartJson, "UTF-8");
                Cookie cookie = new Cookie("listCartBook", encodedJson);
                response.addCookie(cookie);
            }
            request.setAttribute("changeNumber", raw_numberBook - quantity);
            request.setAttribute("book", book);
            request.getRequestDispatcher("view/details.jsp").forward(request, response);
        }
    }

    private boolean checkCart(HttpServletRequest request, HttpServletResponse response, Book bookCart)
            throws UnsupportedEncodingException {
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("listCartBook")) {
                    // Decode giá trị của cookie nếu cần
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        // Parse chuỗi JSON thành danh sách đối tượng
        List<Book> listCartBook = new ArrayList<>();
        if (listCartJson != null) {
            Gson gson = new Gson();
            Book[] booksArray = gson.fromJson(listCartJson, Book[].class);
            for (Book book : booksArray) {
                listCartBook.add(book);
            }
        }
        for (Book book : listCartBook) {
            if (book.getBook_id() == bookCart.getBook_id()) {
                if (book.getQuantity() >= bookCart.getQuantity()) {
                    return true;
                }
            }
        }
        return false;
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
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("listCartBook")) {
                    // Decode giá trị của cookie nếu cần
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }

        // Parse chuỗi JSON thành danh sách đối tượng
        List<Book> listCartBook = new ArrayList<>();
        if (listCartJson != null) {
            Gson gson = new Gson();
            Book[] booksArray = gson.fromJson(listCartJson, Book[].class);
            for (Book book : booksArray) {
                listCartBook.add(book);
            }
        }
        // In ra danh sách
        for (Book book : listCartBook) {
            response.getWriter().println(book);
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
