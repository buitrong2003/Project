/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dal.BookDAO;
import dal.CategoryDAO;
import java.io.IOException;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;
import model.Category;

/**
 *
 * @author d
 */
public class ControllerCategory extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        CategoryDAO daoCategory = new CategoryDAO();
        BookDAO daoBook = new BookDAO();
        List<Category> listCategory = daoCategory.findAll();
        String raw_page = request.getParameter("page") == null ? "1" : request.getParameter("page");
        String action = request.getParameter("action");
        if (action == null) {
            action = "category";
        }
        int page = Integer.parseInt(raw_page);
        int limit = 10;
        String key = request.getParameter("keyCategory");
        if (key == null || key.equals("tat-ca")) {
            key = "";
        }
        List<Book> listBook = null;
        Integer sumBook = null;
        switch (action) {
            case "category" -> {
                listBook = daoBook.listBookByCategory(key);
                sumBook = listBook.size();
            }
            case "search" -> {
                String option = request.getParameter("option");
                String name = request.getParameter("name");
                if (option.equalsIgnoreCase("Name")) {
                    listBook = daoBook.getListBookByName(key, name);
                    sumBook = listBook.size();
                } else {
                    listBook = daoBook.getListBookByAuthor(key, name);
                    sumBook = listBook.size();
                }
                request.setAttribute("option", option);
                request.setAttribute("keywordNameSearch", name);
            }
        }
        if (key.isEmpty()) {
            key = "tat-ca";
        }
        int limitPage = sumBook / limit;
        if (sumBook % limit != 0) {
            limitPage += 1;
        }
        if (limitPage > 1) {
            listBook = daoBook.getListBookPagination(page, limit, listBook);
        }
        String sortName = request.getParameter("sortBy");
        if (sortName != null) {
            daoBook.sortBookByPrice(listBook, sortName);
            request.setAttribute("sortBook", sortName);
        }
        request.setAttribute("keywordCategory", key);
        request.setAttribute("action", action);
        request.setAttribute("listBook", listBook);
        request.setAttribute("page", page);
        request.setAttribute("limitPage", limitPage);
        request.setAttribute("listCategory", listCategory);
        request.getRequestDispatcher("view/category.jsp").forward(request, response);
    }

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
        processRequest(request, response);
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
        processRequest(request, response);
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
