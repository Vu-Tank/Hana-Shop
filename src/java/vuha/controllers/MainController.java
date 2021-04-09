/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vuha.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig
/**
 *
 * @author Admin
 */
public class MainController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    private final static String ERROR="index.html";
    private final static String LOGIN="LoginController";
    private final static String VIEW_PRODUCT="ViewProductController";
    private final static String LOGOUT="LogOutController";
    private final static String ADDTOCART="AddToCartController";
    private final static String VIEWCART="ViewCartController";
    private final static String SEARCHPRODUCT="SearchProductController";
    private final static String CHECKOUT="CheckOutController";
    private final static String UPDATECART="UpdateCartController";
    private final static String DELETECART="DeleteCartController";
    private final static String VIEWHISTORY="ViewHistoryController";
    private final static String ADMIN="AdminController";
    private final static String UPDATEPRODUCT="UpdateProductController";
    private final static String DELETEPRODUCT="DeleteProductController";
    private final static String CREARPRODUCT="CreateProductController";
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String url=ERROR;
        try {
            String action=request.getParameter("btnAction");
            if("Login".equals(action)){
                url=LOGIN;
            }else if("View Product".equals(action)){
                url=VIEW_PRODUCT;
            }else if("LogOut".equals(action)){
                url=LOGOUT;
            }else if("Add to cart".equals(action)){
                url=ADDTOCART;
            }else if("ViewCart".equals(action)){
                url=VIEWCART;
            }else if("Search".equals(action)){
                url=VIEW_PRODUCT;
            }else if("Pay Now".equals(action)){
                url=CHECKOUT;
            }else if("updateCart".equals(action)){
                url=UPDATECART;
            }else if("deleteCart".equals(action)){
                url=DELETECART;
            }else if("Shopping history".equals(action)){
                url=VIEWHISTORY;
            }else if("adminMode".equals(action)){
                url=ADMIN;
            }else if("Update Product".equals(action)){
                url=UPDATEPRODUCT;
            }else if("Create".equals(action)){
                url=CREARPRODUCT;
            }else if("DeleteProduct".equals(action)){
                url=DELETEPRODUCT;
            }
        } catch (Exception e) {
            log("Error at MainController: "+e.toString());           
        }finally{
            request.getRequestDispatcher(url).forward(request, response);
        }
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
