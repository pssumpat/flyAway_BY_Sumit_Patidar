package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ChangePass extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public ChangePass() {
        super();
        // TODO Auto-generated constructor stub
    }
    private String pass;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String newPassConf = request.getParameter("newPassConf");
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/admin","root","tiger");
			Statement stmt= con.createStatement();
			ResultSet rs = stmt.executeQuery("select * from adminCredentials;");
			while(rs.next())
			{
				pass = rs.getString(2);	
			
			}
			if(oldPass.equals(pass))
			{
				if(newPass.equals(newPassConf))
				{
					PreparedStatement stmt1 = con.prepareStatement("update adminCredentials set password = ? where userId = 'sumit';"); 
					stmt1.setString(1, newPassConf);
					stmt1.execute();
					PrintWriter out = response.getWriter();
					out.println("Password changed successfull <br>");
					out.println("go to <a href ='AdminLogin.html'>log-in</a> page");
				}
				else
				{
					PrintWriter out = response.getWriter();
					out.println("Password doesnt matches confirm password <br>");
					out.println("go to <a href ='adminHome.jsp'>log-in</a> page");
				}
			}
			else
			{
				PrintWriter out = response.getWriter();
				out.println("invalid old Password<br>");
				out.println("go to <a href ='adminHome.jsp'>log-in</a> page");
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
