/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import com.google.gson.Gson;
import dal.implement.BookDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.net.URLDecoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Book;
import model.User;

/**
 *
 * @author d
 */
public class ControllerCart extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("acount");
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(user.getUser_name())) {
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        List<Book> listCartBook = new ArrayList<>();
        if (listCartJson != null) {
            Gson gson = new Gson();
            Book[] booksArray = gson.fromJson(listCartJson, Book[].class);
            listCartBook.addAll(Arrays.asList(booksArray));
        }
        request.setAttribute("listBookCart", listCartBook);
        request.getRequestDispatcher("view/shoppingcart.jsp").forward(request, response);
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
        BookDAO daoBook = new BookDAO();
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(user.getUser_name())) {
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
            listCartBook.addAll(Arrays.asList(booksArray));
        }
        int limit = 5;
        String raw_page = request.getParameter("page") == null ? "1" : request.getParameter("page");
        int page = Integer.parseInt(raw_page);
        int limitPage = listCartBook.size() / limit + (listCartBook.size() % limit == 0 ? 0 : 1);
        if (limitPage > 1) {
            //listCartBook = daoBook.getListBookPagination(page, limit, listCartBook);
        }
        request.setAttribute("page", page);
        request.setAttribute("limitPage", limitPage);
        request.setAttribute("listBookCart", listCartBook);
        request.getRequestDispatcher("view/shoppingcart.jsp").forward(request, response);
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
