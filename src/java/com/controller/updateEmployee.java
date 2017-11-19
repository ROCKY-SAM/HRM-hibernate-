/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.controller;

import com.model.Task_Controller;
import com.model.Role_Controller;
import com.model.Employee_controller;
import com.model.Employee;
import com.model.Role;
import com.model.Task;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Iterator;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SAM
 */
public class updateEmployee extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            Role_Controller rc_get = new Role_Controller();
            Role ro = rc_get.getRoleObject(request.getParameter("role_names"));

            Employee_controller emm = new Employee_controller();
            Employee em = emm.getEmployeeObject(request.getParameter("employeeId"));

            for (Iterator iter = em.getCollection().iterator(); iter.hasNext();) {
                Task_Controller tccc = new Task_Controller();
                Task elements = (Task) iter.next();
                elements.setEmployee(null);
                int x = tccc.updateTask(elements);
            }

            em.setName(request.getParameter("userNames"));
            em.setRole(ro);
            int success = 0;
            success = emm.updateEmployee(em);

            String a[] = request.getParameterValues("task_nameLists");

            if (a != null) {
                for (String c : a) {

                    Task_Controller tcc = new Task_Controller();
                    Task tc = Task_Controller.getTaskObject(c);
                    tc.setEmployee(em);
                    success = tcc.updateTask(tc);

                }
            }
           
            if (success == 1) {
                request.setAttribute("result_emp", "Updated Successfully");
            } else {
                request.setAttribute("result_emp", "Try Again");
            }

            request.getRequestDispatcher("employeeEdit.jsp?id=" + request.getParameter("employeeId")).forward(request, response);

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
