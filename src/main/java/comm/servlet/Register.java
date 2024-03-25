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

@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = request.getParameter("name");
		String dob = request.getParameter("dob");
		String address = request.getParameter("address");
		String qualification = request.getParameter("qualification");
		String email = request.getParameter("email");

		Student student = new Student(name, dob, address, qualification, email);
		StudentDao dao = new StudentDao(Dbconnect.getConn());
		HttpSession session = request.getSession();
		boolean f = dao.addStudent(student);
		if (f) {

			session.setAttribute("succMsg", "Student Details submitted sucessfully");
			response.sendRedirect("AddStudent.jsp");

		} else {
			session.setAttribute("ErrorMsg", "something wrong on server");
			response.sendRedirect("AddStudent.jsp");
		}

	}

}
