<%@ page import="java.sql.Connection"%>
<%@ page import="comm.conn.Dbconnect"%>
<%@ page import="comm.dao.StudentDao"%>
<%@ page import="java.util.List"%>
<%@ page import="comm.entity.Student"%><%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Allcss.jsp"%>
</head>
<body class = "bg-light" >
	<%@include file="Navbar.jsp"%>

	<div class="container p-4">
		<div class=" row">
			<div class="col-md-6 offset-md-3">
				<div class="card">
					<div class="card-body">
						<p class="fs-3  text-center">Edit Student</p>
						
						<%
						int id = Integer.parseInt(request.getParameter("id"));
						StudentDao dao = new StudentDao(Dbconnect.getConn());
						Student s = dao.getStudentbyid(id);
						%>
						

						<form action="Update" method="post">
							<div class="mb-3">
								<label class="form-label">FullName</label> <input type="text"
									name="name" value="<%=s.getFullname()%>" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Date of birth</label> <input
									type="date" name="dob" value="<%=s.getDob()%>"
									class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Address</label> <input type="text"
									name="address" value="<%=s.getAddress()%>" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">qualification</label> <input
									type="text" name="qualification"
									value="<%=s.getQualification()%>" class="form-control">
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label> <input type="email"
									name="email" value="<%=s.getEmail()%>" class="form-control">
							</div>
							<input type="hidden" name="id" value="<%=s.getId()%>">

							<button type="submit" class="btn btn-primary col-md-12 ">Update</button>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>