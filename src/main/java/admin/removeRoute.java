package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class removeRoute extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public removeRoute() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String routeId = request.getParameter("routeId");
		String source = request.getParameter("source");
		String destination = request.getParameter("destination");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
			PreparedStatement stmt= con.prepareStatement("delete from routes where routeId=? and source=? and destination=?");
			stmt.setString(1, routeId);
			stmt.setString(2, source);
			stmt.setString(3, destination);
			stmt.execute();
			stmt.close();con.close();
			RequestDispatcher rd = request.getRequestDispatcher("adminHome.jsp");
			rd.forward(request, response);
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			PrintWriter out = response.getWriter();
			out.println("Route ID or Route Name doesnt exists, Please check your input...");
			out.println("Go try, <a href='route.jsp'>again</a>");
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
	}

}
