<%-- 
    Document   : index
    Created on : Oct 7, 2017, 10:49:21 AM
    Author     : SAM
--%>

<%@ include file = "header.jsp" %>
<%@page import="com.model.*"%>
<%@page import="java.util.List"%>
 
<%@page import="java.util.Iterator"%>
<%@ page import="com.controller.*"%>


    <div class="container-fluid">
         
        <ol class="breadcrumb">
            <li class="breadcrumb-item">
               <a href="index.jsp">Dashboard</a>
            </li>
            <li class="breadcrumb-item active">My Dashboard</li>
        </ol>

        <div class="row" >
            
            
            
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-success o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fa fa-fw fa-user"></i>
                        </div>
                        <div class="mr-5">
                            <%
                                Employee_controller ec = new Employee_controller();
                                out.print(ec.employeeCount());
                            %>
                            New Employees</div>
                    </div>
                            <a class="card-footer text-white clearfix small z-1" href="employeeList.jsp">
                        <span class="float-left">View Details</span>
                        <span class="float-right">
                            <i class="fa fa-angle-right"></i>
                        </span>
                    </a>
                </div>
            </div>
            
            
            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-warning o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fa fa-fw fa-list"></i>
                        </div>
                        <div class="mr-5">
                            <%
                                Task_Controller tc = new Task_Controller();
                                out.print(tc.taskCount());
                            %>
                            New Tasks!</div>
                    </div>
                    <a class="card-footer text-white clearfix small z-1" href="taskList.jsp">
                        <span class="float-left">View Details</span>
                        <span class="float-right">
                            <i class="fa fa-angle-right"></i>
                        </span>
                    </a>
                </div>
            </div>


            <div class="col-xl-3 col-sm-6 mb-3">
                <div class="card text-white bg-danger o-hidden h-100">
                    <div class="card-body">
                        <div class="card-body-icon">
                            <i class="fa fa-fw fa-support"></i>
                        </div>
                        <div class="mr-5">
                            <%
                                Role_Controller rc = new Role_Controller();
                                out.print(rc.roleCount());
                            %>
                            New Roles!</div>
                    </div>
                            <a class="card-footer text-white clearfix small z-1" href="roleList.jsp">
                        <span class="float-left">View Details</span>
                        <span class="float-right">
                            <i class="fa fa-angle-right"></i>
                        </span>
                    </a>
                </div>
            </div>


        </div>
    </div>

<%@ include file = "footer.jsp" %>