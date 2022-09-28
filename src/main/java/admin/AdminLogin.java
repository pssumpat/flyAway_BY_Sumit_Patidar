package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class AdminLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AdminLogin() {
        // TODO Auto-generated constructor stub
    }
    private String userId;
	private String pass;

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
	
		
	    PrintWriter out = res.getWriter();
		String adminId = req.getParameter("adminId");
		String adminPass = req.getParameter("adminPass");
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from adminCredentials;");
			while(rs.next())
			{
				userId = rs.getString(1);
				pass = rs.getString(2);	
			
			}
			if(adminId.equals(userId) && adminPass.equals(pass))
			{
				RequestDispatcher rd = req.getRequestDispatcher("adminHome.jsp");
				rd.forward(req, res);
			}
			else
			{
				out.println("invalid Credentials<br>");
				out.println("go to <a href ='AdminLogin.html'>log-in</a> page");
			}	
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	
		
	
	}

}
