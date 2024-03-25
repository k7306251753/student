package comm.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import comm.conn.Dbconnect;
import comm.dao.StudentDao;
import comm.entity.Student;

@WebServlet("/Update")
public class Update extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String qualification = request.getParameter("qualification");
		String email = request.getParameter("email");
		int id = Integer.parseInt(request.getParameter("id"));
		Student student = new Student(id, name, dob, address, qualification, email);

		StudentDao dao = new StudentDao(Dbconnect.getConn());
		HttpSession session = request.getSession();

		boolean f = dao.updateStudent(student);
		if (f) {

			session.setAttribute("succMsg", "Student Details updated sucessfully");
			response.sendRedirect("Home.jsp");

		} else {
			session.setAttribute("ErrorMsg", "something wrong on server");
			response.sendRedirect("Home.jsp");
		}
	}

}
