package user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.SQLIntegrityConstraintViolationException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class userLogin extends HttpServlet {
	private static final long serialVersionUID = 1L;
 
    public userLogin() {
        super();
        // TODO Auto-generated constructor stub
    }
    String userName;
    String password;
    String name;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String userName= request.getParameter("userName");
		String password= request.getParameter("password");
		System.out.println(userName);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/user","root","tiger");
			Statement stmt = con.createStatement();
			ResultSet rs = stmt.executeQuery("select name,password from users where userName ='"+userName+"';");
			while(rs.next())
			{
				this.password = rs.getString(2);
				name=rs.getString(1);
			}
			if(password.equals(this.password))
			{
				request.setAttribute("k",name);
				RequestDispatcher rd = request.getRequestDispatcher("userHome.jsp");
				rd.forward(request, response);
			}
			else
			{
				PrintWriter out = response.getWriter();
				out.println("Invalid User Name or Pssword, Please try again :<br>");
				out.println("Go to <a href='userLogin.html'>login</a> Page");
			}
			
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}	
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String userName = request.getParameter("userName");
		String password = request.getParameter("password");
		
		System.out.println(name);System.out.println(email);System.out.println(userName);System.out.println(password);
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection("jdbc:mysql://localHost:3006/user","root","tiger");
			PreparedStatement stmt= con.prepareStatement("insert into users values(?,?,?,?);");
			stmt.setString(1, name);
			stmt.setString(2, email);
			stmt.setString(3, userName);
			stmt.setString(4, password);
			stmt.execute();
			stmt.close();con.close();
			RequestDispatcher rd = request.getRequestDispatcher("userLogin.html");
			rd.forward(request, response);
		}
		catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} 
		catch (SQLIntegrityConstraintViolationException e)
		{
			PrintWriter out = response.getWriter();
			out.println("Cant register with empty fields or Account with email "+email+" exists....");
			out.println("Go try, <a href='userLogin.html'>again</a>");
			out.close();
		}
		catch (SQLException e) {
			PrintWriter out = response.getWriter();
			out.println("Account with email '"+email+"' exists, Please try to log-in");
			out.println("Go try, <a href='userLogin.html'>again</a>");
			// TODO Auto-generated catch block
			e.printStackTrace();
			out.close();
		}
	}

}
