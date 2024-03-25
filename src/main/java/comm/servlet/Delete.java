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


@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		int id = 	Integer.parseInt(request.getParameter("id"));
			 StudentDao dao = new StudentDao(Dbconnect.getConn());
		boolean f =	dao.deleteStudent(id);
		if (f) {
			
			session.setAttribute("succMsg", "Student Details deleted sucessfully");
			response.sendRedirect("Home.jsp");

		} else {
			session.setAttribute("ErrorMsg","something wrong on server");
			response.sendRedirect("Home.jsp");
		}
	}

}
