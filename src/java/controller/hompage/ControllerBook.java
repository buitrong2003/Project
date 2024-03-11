/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hompage;

import dal.implement.BookDAO;
import dal.implement.ProposeDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import model.Book;
import model.Propose;
import model.User;

/**
 *
 * @author d
 */
public class ControllerBook extends HttpServlet {

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
        BookDAO daoBook = new BookDAO();
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acount");
        if (user != null) {
            List<Book> listBook = daoBook.findAll();
            ProposeDAO daoPropose = new ProposeDAO();
            List<Propose> listPropose = daoPropose.getListPropose(user.getUser_name());
            Set<Book> listBookPropose = getListBookPropose(listBook, listPropose);
            request.setAttribute("listPropose", listBookPropose);
        }
        List<Book> listBookHot = daoBook.getListBookHot();
        List<Book> listNewBook = daoBook.getListNewBook();
        request.setAttribute("listBookHot", listBookHot);
        request.setAttribute("listNewBook", listNewBook);
        request.getRequestDispatcher("view/home.jsp").forward(request, response);
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

    private Set<Book> getListBookPropose(List<Book> listBook, List<Propose> listPropose) {
        Set<Book> proposedBooks = new HashSet<>();
        for (Propose propose : listPropose) {
            for (Book book : listBook) {
                if ((book.getCategory_id() == (propose.getCategory_id()) || book.getAuthor().equals(propose.getAuthor()))
                        && book.getBook_id() != propose.getBook_id()) {
                    proposedBooks.add(book);
                    break;
                }
            }
        }
        return proposedBooks;
    }
}
