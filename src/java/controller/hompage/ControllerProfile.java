/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hompage;

import dal.implement.AcountDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;
import java.io.File;
import model.User;

/**
 *
 * @author d
 */
@MultipartConfig
public class ControllerProfile extends HttpServlet {

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    AcountDAO daoAcount = new AcountDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("view/profile.jsp").forward(request, response);
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
        try {
            String username = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String type = request.getParameter("type");
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
            User user = User.builder()
                    .user_name(username)
                    .password(password)
                    .email(email)
                    .type(type)
                    .image(imagePath)
                    .build();
            daoAcount.updateUser(user);
            HttpSession acountSession = request.getSession();
            acountSession.setAttribute("acount", user);
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
        response.sendRedirect("profile");
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
