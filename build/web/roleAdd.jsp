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
        <li class="breadcrumb-item active"> Role Add</li>
    </ol>

    <div class="card mb-3">
        
        <% String error = (String)request.getAttribute("resultiz");
        if(error=="Try Again"){
        out.print("<div class='alert alert-danger'>"+error+"</div>");
        }else if(error=="Added Successfully"){
        out.print("<div class='alert alert-success'>"+error+"</div>"); 
        }
        %>
        
        
        <div class="card-header" style="background-color: #ff4444;color: whitesmoke;">
            <i class="fa fa-user"></i> Add New Role</div>
        <div class="card-body">
            <form action="addRole">
            <div class="form-group row">
                <label for="title" class="col-sm-2 col-form-label">Title</label>
                <div class="col-sm-10">
                    <input type="text" class="form-control" name="title" required="">
                </div>
            </div>

            <div class="form-group row" style="color: whitesmoke;">
                <div class="col-sm-9"></div>
                <div class="col-sm-1">
                    <button type="reset" class="btn btn-danger"><i class="fa fa-times-rectangle-o" ></i> Reset</button>
                </div>
                <div class="col-sm-1">
                    <button type="submit" class="btn btn-primary" ><i class="fa fa-check-square" ></i> Submit</button>
                </div>
            </div>
            </form>
        </div>
    </div>
</div>
  

<%@ include file = "footer.jsp" %>