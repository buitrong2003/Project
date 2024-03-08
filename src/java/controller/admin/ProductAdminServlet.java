/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.BookDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Date;
import model.Book;

/**
 *
 * @author d
 */
@MultipartConfig
public class ProductAdminServlet extends HttpServlet {

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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action") == null ? ""
                : request.getParameter("action");
        switch (action) {
            case "add" ->
                addProduct(request);
            case "edit" ->
                updateProduct(request);
            case "delete" -> {
                deleteProduct(request);
            }
        }
        response.sendRedirect("dashboard");
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

    private void addProduct(HttpServletRequest request) {
        try {
            String name = request.getParameter("name");
            String author = request.getParameter("authorInput");
            String publisher = request.getParameter("publisherInput");
            Date date = Date.valueOf(request.getParameter("dateInput"));
            String genre = request.getParameter("genreInput");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int category = Integer.parseInt(request.getParameter("category"));
            String description = request.getParameter("description");
            Part part = request.getPart("image");
            if (part.getSubmittedFileName() == null || part.getSubmittedFileName().trim().isEmpty()
                    || part == null) {
            } else {
                String path = request.getServletContext().getRealPath("/image");
                File file = new File(path);
                if (!file.exists()) {
                    file.mkdirs();
                }
                File image = new File(file, part.getSubmittedFileName());
                part.write(image.getAbsolutePath());
                String pathOfFile = image.getName();
                Book book = Book.builder()
                        .name(name)
                        .author(author)
                        .publisher(publisher)
                        .publication_date(date)
                        .genre(genre)
                        .price(price)
                        .quantity(quantity)
                        .category_id(category)
                        .description(description)
                        .image(pathOfFile)
                        .book_hot(0)
                        .build();
                daoBook.insert(book);
            }
        } catch (IOException | ServletException ex) {
            ex.printStackTrace();
        }
    }

    private void deleteProduct(HttpServletRequest request) {
        int id = Integer.parseInt(request.getParameter("id"));
        daoBook.deleteBook(id);
    }

    private void updateProduct(HttpServletRequest request) {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String author = request.getParameter("author");
            String publisher = request.getParameter("publisher");
            Date date = Date.valueOf(request.getParameter("date"));
            String genre = request.getParameter("genre");
            double price = Double.parseDouble(request.getParameter("price"));
            int quantity = Integer.parseInt(request.getParameter("quantity"));
            int category = Integer.parseInt(request.getParameter("category"));
            String description = request.getParameter("description");
            Part part = request.getPart("image");
            String imagePath = null;
            if (part.getSubmittedFileName() == null || part.getSubmittedFileName().trim().isEmpty()
                    || part == null) {
                imagePath = request.getParameter("currentImage");
            } else {
                String path = request.getServletContext().getRealPath("/image");
                File file = new File(path);
                if (!file.exists()) {
                    file.mkdirs();
                }
                File image = new File(file, part.getSubmittedFileName());
                part.write(image.getAbsolutePath());
                imagePath = image.getName();
            }
            Book book = Book.builder()
                    .book_id(id)
                    .name(name)
                    .author(author)
                    .publisher(publisher)
                    .publication_date(date)
                    .genre(genre)
                    .price(price)
                    .quantity(quantity)
                    .category_id(category)
                    .description(description)
                    .image(imagePath)
                    .book_hot(0)
                    .build();
            daoBook.updateBook(book);
        } catch (IOException | ServletException | NumberFormatException ex) {
        }
    }
}
