/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.admin;

import dal.implement.AcountDAO;
import dal.implement.RoleDAO;
import dal.implement.UserRoleDAO;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.util.List;
import model.Role;
import model.User;

/**
 *
 * @author d
 */
@MultipartConfig
public class UserAdminServlet extends HttpServlet {

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
    RoleDAO daoRole = new RoleDAO();
    UserRoleDAO daoUserRole = new UserRoleDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<User> listUser = daoAcount.getListByUser();
        List<Role> listRole = daoRole.getListRole();
        request.setAttribute("listRole", listRole);
        request.setAttribute("listUser", listUser);
        request.getRequestDispatcher("../view/admin/user.jsp").forward(request, response);
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
                addUser(request);
            case "edit" ->
                updateUser(request);
            case "delete" ->
                deleteUser(request);
        }
        response.sendRedirect("user");
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

    private void addUser(HttpServletRequest request) {
        try {
            String username = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            String type = request.getParameter("type");
            Part part = request.getPart("image");
            String pathOfFile = null;
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
                pathOfFile = image.getName();
            }
            User user = User.builder()
                    .user_name(username)
                    .password(password)
                    .email(email)
                    .image(pathOfFile)
                    .type(type)
                    .build();
            daoAcount.insert(user);
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }

    private void updateUser(HttpServletRequest request) {
        try {
            String username = request.getParameter("name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
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
        } catch (ServletException | IOException ex) {
            ex.printStackTrace();
        }
    }

    private void deleteUser(HttpServletRequest request) {
        String username = request.getParameter("username");
        daoUserRole.deleteUser(username);
    }

}
