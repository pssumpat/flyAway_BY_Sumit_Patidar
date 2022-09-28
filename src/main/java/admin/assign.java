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

public class assign extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public assign() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		Flight ID / Name	:	 <input type = 'text' name='flightId'>
//		Route ID			:	 <input type = 'text' name='routeId'>
//		Ticket Price			:	 <input type = 'text' name='ticketPrice'>
		String routeId= request.getParameter("routeId");
		String flightId = request.getParameter("flightId");
		String ticketPrice = request.getParameter("ticketPrice");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
			PreparedStatement stmt= con.prepareStatement("insert into assign values(?,?,?);");
			stmt.setString(1, routeId);
			stmt.setString(2, flightId);
			stmt.setString(3, ticketPrice);
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
