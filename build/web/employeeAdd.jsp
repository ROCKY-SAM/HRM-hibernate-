<%-- 
    Document   : employeeAdd
    Created on : Oct 7, 2017, 12:09:27 PM
    Author     : SAM
--%>

<%@page import="com.model.*"%>
<%@ include file = "header.jsp" %>
<%@page import="java.util.Iterator"%>
<%@ page import="com.controller.*"%>
 
<%@page import="java.util.List"%>
 


<div class="container-fluid">

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
            <a href="index.jsp">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Employee Add</li>
    </ol>

    <div class="card mb-3">
        
        <% String error = (String)request.getAttribute("resultix");
        if(error=="Try Again"){
        out.print("<div class='alert alert-danger'>"+error+"</div>");
        }else if(error=="Added Successfully"){
        out.print("<div class='alert alert-success'>"+error+"</div>"); 
        }
        %>   
        
        
        <div class="card-header" style="background-color: #00C851;color: whitesmoke;">
            <i class="fa fa-user"></i> Add New Employee</div>
        <div class="card-body">
            <form action="addEmployee" >
            <div class="form-group row">
                <label for="usr" class="col-sm-2 col-form-label">Name</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="userName" required="">
                </div>
            </div> 
            <div class="form-group row">
                <label for="role" class="col-sm-2 col-form-label">Role</label>
                <div class="col-sm-10">
                    <select class="form-control" name="role_name" required>
                        
                       <%
                            Role_Controller rc = new Role_Controller();
                            List rcc = rc.listRole();
                            
                            for (Iterator iter = rcc.iterator(); iter.hasNext();) {
                               Role element = (Role) iter.next();
                                out.println("<option value="+element.getRoleID()+">"+element.getTitle()+"</option>");
                            }
                        %>
                    </select>
                </div>
            </div>
            <div class="form-group row">
                <label for="task" class="col-sm-2 col-form-label">Task</label>
                <div class="col-sm-10">
                    <select multiple class="form-control" name="task_nameList">
                       <%
                            Task_Controller tc = new Task_Controller();
                            List tcc = tc.listTask();
                            
                            for (Iterator iter = tcc.iterator(); iter.hasNext();) {
                               Task element = (Task) iter.next();
                                out.println("<option value="+element.getTaskID()+">"+element.getDescription()+"</option>");
                            }
                        %>
                    </select>
                </div>
            </div>           
            
            <div class="form-group row" style="color: whitesmoke;">
                <div class="col-sm-9"></div>
                <div class="col-sm-1">
                    <button type="reset" class="btn btn-danger"><i class="fa fa-times-rectangle-o" ></i> Reset</button>
                </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-primary" onclick="<%%>"><i class="fa fa-check-square" ></i> Submit</button>
                </div>
                            <% //out.print(rc_get.getRoleObject(request.getParameter("role_name"))); %>
                
            </div>
            </form>
        </div>
    </div>



</div>



<%@ include file = "footer.jsp" %>