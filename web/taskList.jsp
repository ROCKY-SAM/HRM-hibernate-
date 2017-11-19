<%-- 
    Document   : taskList
    Created on : Oct 8, 2017, 4:07:29 PM
    Author     : SAM
--%>

<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="com.model.*"%>
<%@ page import="com.controller.*"%>

<%@ include file = "header.jsp" %>
 
 
    <div class="container-fluid">
           
    <ol class="breadcrumb">
        <li class="breadcrumb-item">
           <a href="index.jsp">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Task List</li>
    </ol>
            
            
        <div class="card mb-3">
            <div class="card-header" style="background-color: #ffbb33;color: whitesmoke;">
                <i class="fa fa-table" ></i> Task List</div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>DESCRIPTION</th>
                                <th>EMPLOYEE</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>                          
 <%

                                Task_Controller tc = new Task_Controller();
                                List tcc = tc.listTasks();
                                for (Iterator iter = tcc.iterator(); iter.hasNext();) {
                                    Task element = (Task) iter.next();
                                    out.println("<tr>");
                                    out.println("<td>");
                                    out.println(element.getTaskID());
                                    out.println("</td>");
             
                                    out.println("<td>");
                                    out.println(element.getDescription());
                                    out.println("</td>");
                                    
                                    String employeeName ="<b>-NOT ASSIGN-</b>";
                                        if (element.getEmployee()!= null) {
                                            employeeName = element.getEmployee().getName();
                                        }
                                    out.println("<td>");
                                    out.println(employeeName);
                                    out.println("</td>");
                                                                        
                                    out.println("<td>");
                                    out.println("<a type='button' class='btn btn-warning' href='taskEdit.jsp?id="+element.getTaskID()+"'><i class='fa fa-pencil' ></i></a>");
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