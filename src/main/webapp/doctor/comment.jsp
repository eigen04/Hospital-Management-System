<%@ page import="com.dao.AppointmentDao" %>
<%@ page import="com.entity.Appointment" %>
<%@ page import="com.db.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@ page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Patient Comment</title>
    <style type="text/css">
        .paint-card {
            box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
        }

        .backImg {
            background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)), url("../img/bg2.jpg");
            height: 20vh;
            width: 100%;
            background-size: cover;
            background-repeat: no-repeat;
        }
    </style>
    <%@ include file="../component/allcss.jsp" %>
</head>
<body>
    <c:if test="${empty doctObj}">
        <c:redirect url="../doctor_login.jsp"></c:redirect>
    </c:if>

    <%@ include file="navbar.jsp" %>

    <div class="container-fluid backImg p-5">
        <p class="text-center fs-2 text-white"></p>
    </div>

    <div class="container p-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">
                <div class="card paint-card">
                    <div class="card-body">
                        <p class="text-center fs-4">Patient Comment</p>

                        <%
                            // Get the appointment ID from the request parameter
                            int id = Integer.parseInt(request.getParameter("id"));
                            AppointmentDao dao = new AppointmentDao(DBConnect.getConn());

                            // Fetch appointment details using the ID
                            Appointment ap = dao.getAppointmentById(id);
                        %>

                        <form class="row" action="../updateStatus" method="post">
                            <div class="col-md-6">
                                <label>Patient Name</label>
                                <input type="text" readonly value="<%= ap.getFullName() %>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <label>Age</label>
                                <input type="text" readonly value="<%= ap.getAge() %>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <br>
                                <label>Mob No</label>
                                <input type="text" readonly value="<%= ap.getPhNo() %>" class="form-control">
                            </div>

                            <div class="col-md-6">
                                <br>
                                <label>Diseases</label>
                                <input type="text" readonly value="<%= ap.getDiseases() %>" class="form-control">
                            </div>

                            <div class="col-md-12">
                                <br>
                                <label>Comment</label>
                                <textarea required name="comm" class="form-control" rows="3" cols=""></textarea>
                            </div>

                            <!-- Hidden fields to send appointment ID and doctor ID -->
                            <input type="hidden" name="id" value="<%= ap.getId() %>">
                            <input type="hidden" name="doctorId" value="<%= ap.getDoctorId() %>">

                            <button class="mt-3 btn btn-primary col-md-6 offset-md-3">Submit</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
