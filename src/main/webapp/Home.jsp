<%@ page import="java.sql.Connection"%>
<%@ page import="comm.conn.Dbconnect"%>
<%@ page import="comm.dao.StudentDao"%>
<%@ page import="java.util.List"%>
<%@ page import="comm.entity.Student"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="Allcss.jsp"%>
</head>
<body class="bg-light">

	<%@include file="Navbar.jsp"%>

	<%
	Connection conn = Dbconnect.getConn();
	out.print(conn);
	%>



	<div class="container p-3">
		<div class="card">
			<div class="card-body">
				<p class="text-center fs-1">All Student Details</p>
				<c:if test="${not empty succMsg }">
					<p class="text-center text-success">${succMsg}</p>
					<c:remove var="succMsg" />

				</c:if>

				<c:if test="${not empty ErrorMsg }">
					<p class="text-center text-success">${ErrorMsg}</p>
					<c:remove var="ErrorMsg" />
				</c:if>
				<table class="table">
					<thead>
						<tr>
							<th scope="col">FullName</th>
							<th scope="col">DOB</th>
							<th scope="col">Address</th>
							<th scope="col">Qualification</th>
							<th scope="col">Email</th>
							<th scope="col">Action</th>

						</tr>
					</thead>
					<tbody>

						<%
						StudentDao dao = new StudentDao(Dbconnect.getConn());
						List<Student> list = dao.getAllStudent();

						for (Student s : list) {
						%>
						<tr>
							<th scope="row"><%=s.getFullname()%></th>
							<td><%=s.getDob()%></td>
							<td><%=s.getAddress()%></td>
							<td><%=s.getQualification()%></td>
							<td><%=s.getEmail()%></td>



							<td><a href="Edit.jsp?id=<%=s.getId()%>"
								class="btn btn-sm btn-primary">Edit</a>
							<td><a href="Delete?id=<%=s.getId()%>"
								class="btn btn-sm btn-danger ms-1">Delete</a>
						</tr>
						<%
						}
						%>


					</tbody>
				</table>
			</div>
		</div>
	</div>
	</div>
	</div>
</body>
</html>