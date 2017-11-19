<%-- 
    Document   : taskList
    Created on : Oct 8, 2017, 4:07:29 PM
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
        <li class="breadcrumb-item active"> Role List</li>
    </ol>
            
            
        <div class="card mb-3">
            <div class="card-header" style="background-color: #ff4444;color: whitesmoke;">
                <i class="fa fa-table" ></i> Role List</div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
<%

                                Role_Controller rc = new Role_Controller();
                                List rcc = rc.listRoles();
                                for (Iterator iter = rcc.iterator(); iter.hasNext();) {
                                    Role element = (Role) iter.next();
                                    out.println("<tr>");
                                    out.println("<td>");
                                    out.println(element.getRoleID());
                                    out.println("</td>");
             
                                    out.println("<td>");
                                    out.println(element.getTitle());
                                    out.println("</td>");
                                    
                                    out.println("<td>");
                                                                        out.println("<a type='button' class='btn btn-warning' href='roleEdit.jsp?id="+element.getRoleID()+"'><i class='fa fa-pencil' ></i></a>");
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