<%-- 
    Document   : header
    Created on : Oct 7, 2017, 10:50:11 AM
    Author     : SAM
--%>


<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Human Resource Application</title>
        <!-- Bootstrap core CSS-->
        <link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <!-- Custom fonts for this template-->
        <link href="resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <!-- Page level plugin CSS-->
        <link href="resources/vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">
        <!-- Custom styles for this template-->
        <link href="resources/css/sb-admin.css" rel="stylesheet">
        
      
    </head>

    <body class="fixed-nav sticky-footer bg-light" id="page-top">
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top" id="mainNav">
            <a class="navbar-brand" ><span style="color:#ffbb33">Human</span> <span style="color:#ff4444">Resource</span> <span style="color:#00C851">Application</span></a>
            <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse " id="navbarResponsive">
                <ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" title="Dashboard">
                        <a class="nav-link" href="index.jsp">
                            <i class="fa fa-fw fa-dashboard" style="color:#33b5e5"></i>
                            <span class="nav-link-text" >Dashboard</span>
                        </a>
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" >
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#employeemanagement" >
                            <i class="fa fa-fw fa-user" style="color:#00C851"></i>
                            <span class="nav-link-text">Employee Management</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="employeemanagement">
                            <li>
                                <a href="employeeList.jsp">Employee List</a>
                            </li>
                            <li>
                                 <a href="employeeAdd.jsp">Employee Add</a>
                            </li>
                        </ul>           
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" >
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#taskmanagement" >
                            <i class="fa fa-fw fa-tasks" style="color:#ffbb33"></i>
                            <span class="nav-link-text">Task Management</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="taskmanagement">
                            <li>
                                <a href="taskList.jsp">Task List</a>
                            </li>
                            <li>
                                <a href="taskAdd.jsp">Task Add</a>
                            </li>
                        </ul>            
                    </li>
                    <li class="nav-item" data-toggle="tooltip" data-placement="right" >
                        <a class="nav-link nav-link-collapse collapsed" data-toggle="collapse" href="#rolemanagement" >
                            <i class="fa fa-fw fa-support" style="color:#ff4444"></i>
                            <span class="nav-link-text">Role Management</span>
                        </a>
                        <ul class="sidenav-second-level collapse" id="rolemanagement">
                            <li>
                                <a href="roleList.jsp">Role List</a>
                            </li>
                            <li>
                                <a href="roleAdd.jsp">Role Add</a>
                            </li>
                        </ul>
                    </li>


                </ul>
                <ul class="navbar-nav sidenav-toggler">
                    <li class="nav-item">
                        <a class="nav-link text-center" id="sidenavToggler">
                            <i class="fa fa-fw fa-angle-left"></i>
                        </a>
                    </li>
                </ul>
             <!--   <ul class="navbar-nav ml-auto">
                    <li class="nav-item">
                        <a class="nav-link" data-toggle="modal" data-target="#exampleModal">
                            <i class="fa fa-fw fa-sign-out"></i>Logout</a>
                    </li>
                </ul> -->
            </div>
        </nav>
        
        <div class="content-wrapper">
