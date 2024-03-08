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
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import model.Cart;
import model.Item;
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acount");
        String username = user == null ? "|" : user.getUser_name();
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(username)) {
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        List<Item> listItem = new ArrayList<>();
        Gson gsonItem = new GsonBuilder()
                .registerTypeAdapter(Item[].class, new ItemDeserialize())
                .create();
        Item[] itemArray = gsonItem.fromJson(listCartJson, Item[].class);
        if (listCartJson != null) {
            listItem.addAll(Arrays.asList(itemArray));
        }
        Cart cart = new Cart(username, itemArray, null);
        double totalMoney = cart.totalMoney(username);
        request.setAttribute("totalMoney", totalMoney);
        request.setAttribute("listItem", listItem);
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
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("acount");
        String username = user == null ? "|" : user.getUser_name();
        int id = Integer.parseInt(request.getParameter("id"));
        Cookie[] cookies = request.getCookies();
        response.setContentType("application/json; charset=UTF-8");
        String listCartJson = null;
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals(username)) {
                    listCartJson = URLDecoder.decode(cookie.getValue(), "UTF-8");
                }
            }
        }
        Gson gsonItem = new GsonBuilder()
                .registerTypeAdapter(Item[].class, new ItemDeserialize())
                .create();
        Item[] itemArray = gsonItem.fromJson(listCartJson, Item[].class);
        Cart cart = null;
        if (listCartJson != null) {
            cart = new Cart(username, itemArray, null);
        }
        if (cart != null) {
            cart.deleteItem(id, username);
            String jsonCart = new Gson().toJson(cart.getListCart().get(username));
            String encodedJson = URLEncoder.encode(jsonCart, "UTF-8");
            Cookie cookieItem = new Cookie(username, encodedJson);
            cookieItem.setPath("/");
            cookieItem.setMaxAge(86400);
            response.addCookie(cookieItem);
            double totalMoney = cart.totalMoney(username);
            request.setAttribute("totalMoney", totalMoney);
            request.setAttribute("listItem", cart.getListCart().get(username));
        }
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
