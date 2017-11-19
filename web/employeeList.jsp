<%-- 
    Document   : employeeList
    Created on : Oct 7, 2017, 12:07:20 PM
    Author     : SAM
--%>

<%@page import="com.model.*"%>
<%@page import="java.util.List"%>
 
<%@page import="java.util.Iterator"%>
<%@ page import="com.controller.*"%>
<%@ include file = "header.jsp" %>
 
 
    <div class="container-fluid">
 
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
           <a href="index.jsp">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Employee List</li>
    </ol>
            
            
        <div class="card mb-3">
            <div class="card-header" style="background-color: #00C851;color: whitesmoke;">
                <i class="fa fa-table" ></i> Employee List</div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>NAME</th>
                                <th>ROLE</th>
                                <th>TASK</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                             
                            <%

                                Employee_controller ec = new Employee_controller();
                                List ecc = ec.listEmployee();
                                for (Iterator iter = ecc.iterator(); iter.hasNext();) {
                                    Employee element = (Employee) iter.next();
                                    out.println("<tr>");
                                    out.println("<td>");
                                    out.println(element.getEmployeeID());
                                    out.println("</td>");
             
                                    out.println("<td>");
                                    out.println(element.getName());
                                    out.println("</td>");
                                    
                                    String roleidis ="<b>-NOT ASSIGN-</b>";
                                        if (element.getRole() != null) {
                                            roleidis = String.valueOf(element.getRole().getTitle());
                                        }
                                    out.println("<td>");
                                    out.println(roleidis);
                                    out.println("</td>");
                                    
                                    out.println("<td>");
                                    
                                    for (Iterator ite = element.getCollection().iterator(); ite.hasNext();) {
                                       Task e = (Task) ite.next();
                                       out.println(e.getDescription()+"<br>");
                                    }
                                    
                                    out.println("</td>");
                                    
                                    out.println("<td>");
                                    out.println("<a type='button' class='btn btn-warning' href='employeeEdit.jsp?id="+element.getEmployeeID()+"'><i class='fa fa-pencil' ></i></a>");
                                    out.println("</td>");
                                    out.println("</tr>");
                                
                                }
                                

                            %>                           
                            
                            
                            
                            
                           
                        </tbody>
                    </table>
                </div>
            </div>
            
        </div>
          
            

                           
                         
    </div>
 
<%@ include file = "footer.jsp" %>