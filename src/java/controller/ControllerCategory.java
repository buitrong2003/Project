/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import constant.CommonConst;
import dal.implement.BookDAO;
import dal.implement.CategoryDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Book;
import model.Category;
import model.PageControl;

/**
 *
 * @author d
 */
public class ControllerCategory extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    BookDAO daoBook = new BookDAO();
    CategoryDAO daoCategory = new CategoryDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PageControl pageControl = new PageControl();
        List<Book> listBook = findProductDoGet(request, pageControl);
        List<Category> listCategory = daoCategory.findAll();
        request.setAttribute("pageControl", pageControl);
        request.setAttribute("listCategory", listCategory);
        request.setAttribute("listBook", listBook);
        request.getRequestDispatcher("view/category.jsp").forward(request, response);
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

    private List<Book> findProductDoGet(HttpServletRequest request, PageControl pageControl) {
        String pageRaw = request.getParameter("page");
        int page;
        try {
            page = Integer.parseInt(pageRaw);
            if (page <= 0) {
                page = 1;
            }
        } catch (NumberFormatException e) {
            page = 1;
        }
        String actionSearch = request.getParameter("search") == null
                ? "default"
                : request.getParameter("search");
        List<Book> listBook = null;
        int totalRecord = 0;
        switch (actionSearch) {
            case "category" -> {
                String idCategory = request.getParameter("categoryid");
                listBook = daoBook.findByCategory(idCategory, page);
                totalRecord = daoBook.findTotalRecordByCategory(idCategory);
                pageControl.setUrlPattern("?search=category&categoryid=" + idCategory + "&");

            }
            case "searchByName" -> {
                String keyword = request.getParameter("keyword");
                listBook = daoBook.findByName(keyword, page);
                totalRecord = daoBook.findTotalRecordByName(keyword);
                pageControl.setUrlPattern("?search=searchByName&keyword=" + keyword + "&");
                request.setAttribute("keyword", keyword);
                request.setAttribute("option", "Name");
            }
            case "searchByAuthor" -> {
                String keyword = request.getParameter("keyword");
                listBook = daoBook.findByAuthor(keyword, page);
                totalRecord = daoBook.findTotalRecordByAuthor(keyword);
                pageControl.setUrlPattern("?search=searchByAuthor&keyword=" + keyword + "&");
                request.setAttribute("keyword", keyword);
                request.setAttribute("option", "Author");
            }
            default -> {
                listBook = daoBook.findByPage(page);
                totalRecord = daoBook.findTotalRecord();
                pageControl.setUrlPattern("?");
            }
        }
        String sort = request.getParameter("sort") == null ? "keepStable"
                : request.getParameter("sort");
        daoBook.sortBookByPrice(listBook, sort);
        request.setAttribute("sortBook", sort);
        int totalPage = (totalRecord % CommonConst.RECORD_PER_PAGE) == 0
                ? (totalRecord / CommonConst.RECORD_PER_PAGE)
                : (totalRecord / CommonConst.RECORD_PER_PAGE) + 1;
        pageControl.setTotalPage(totalPage);
        pageControl.setPage(page);
        return listBook;
    }

}
