/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.hompage;

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
import model.Cart;
import model.Item;
import model.User;

/**
 *
 * @author d
 */
public class ProcessCart extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        User user = (User) session.getAttribute("acount");
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        Item[] itemArray = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(user.getUser_name())) {
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        Gson gsonItem = new GsonBuilder()
                .registerTypeAdapter(Item[].class, new ItemDeserialize())
                .create();
        itemArray = gsonItem.fromJson(listCartJson, Item[].class);
        Cart cart = new Cart(user.getUser_name(), itemArray, null);
        int id = Integer.parseInt(request.getParameter("id"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));
        Item item = cart.getItemById(user.getUser_name(), id);
        item.setQuantity(quantity);
        if (item.getQuantity() <= 0) {
            cart.getListCart().get(user.getUser_name()).remove(item);
        }
        String jsonCart = new Gson().toJson(cart.getListCart().get(user.getUser_name()));
        String encodedJson = URLEncoder.encode(jsonCart, "UTF-8");
        Cookie cookieItem = new Cookie(user.getUser_name(), encodedJson);
        cookieItem.setPath("/");
        response.addCookie(cookieItem);
        double totalMoney = cart.totalMoney(user.getUser_name());
        request.setAttribute("totalMoney", totalMoney);
        request.setAttribute("listItem", cart.getListCart().get(user.getUser_name()));
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
