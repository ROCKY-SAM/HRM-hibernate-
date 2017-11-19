<%-- 
    Document   : taskAdd
    Created on : Oct 8, 2017, 4:07:46 PM
    Author     : SAM
--%>

<%@page import="com.model.*"%>
<%@ page import="com.controller.*"%>
<%@ include file = "header.jsp" %>


<div class="container-fluid">

    <ol class="breadcrumb">
        <li class="breadcrumb-item">
           <a href="index.jsp">Dashboard</a>
        </li>
        <li class="breadcrumb-item active"> Edit Task</li>
    </ol>
    <form action="updateTask">
    <div class="card mb-3">
        
        <%
        Task_Controller tc = new Task_Controller();
        Task tcc = tc.getTaskObject(request.getParameter("id"));
        %>  
        <% String error = (String)request.getAttribute("result_task");
        if(error=="Try Again"){
        out.print("<div class='alert alert-danger'>"+error+"</div>");
        }else if(error=="Updated Successfully"){
        out.print("<div class='alert alert-success'>"+error+"</div>"); 
        }
        %>
        
        <div class="card-header" style="background-color: #ffbb33;color: whitesmoke;">
            <i class="fa fa-user"></i> Edit Task</div>
        <div class="card-body">

            <div class="form-group row">
                <label for="description" class="col-sm-2 col-form-label">Description</label>
                <div class="col-sm-10">
                    <input type="text" name="taskID" class="form-control" value="<% out.print(tcc.getTaskID()); %>" hidden="">
                    <input type="text" name="description" class="form-control" value="<% out.print(tcc.getDescription()); %>">
                </div>
            </div>

            <div class="form-group row" style="color: whitesmoke;">
                <div class="col-sm-9"></div>
                <div class="col-sm-1">
                    <button type="reset" class="btn btn-danger"><i class="fa fa-times-rectangle-o" ></i> Reset</button>
                </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-primary" ><i class="fa fa-check-square" ></i> Submit</button>
                </div>alert
            </div>
        </div>
    </div>
    </form>
</div>
  

<%@ include file = "footer.jsp" %>