package admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class scheduleFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public scheduleFlight() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String flightName = request.getParameter("flightName");
		String routeId = request.getParameter("routeId");
		String date = request.getParameter("date");
		String timeDepart = request.getParameter("timeDepart");
		String timeArrive = request.getParameter("timeArrive");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
			PreparedStatement stmt= con.prepareStatement("insert into schedule values(?,?,?,?,?);");
			stmt.setString(1, flightName);
			stmt.setString(2, routeId);
			stmt.setString(3, date);
			stmt.setString(4, timeDepart);
			stmt.setString(5, timeArrive);
			stmt.execute();
			stmt.close();con.close();
			RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
			rd.forward(request, response);
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}
