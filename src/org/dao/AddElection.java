package org.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/addElection")
public class AddElection extends HttpServlet {
	Connection con;
	public AddElection() throws ClassNotFoundException, SQLException {
		String sql_url = "jdbc:mysql://localhost:3306/voting_system";
		String sql_uname = "arpit";
		String sql_pass = "ArpitPro";
		Class.forName("com.mysql.jdbc.Driver");
		this.con = DriverManager.getConnection(sql_url, sql_uname, sql_pass);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
		try {
			String ename = request.getParameter("ename").toString();
			String edate = request.getParameter("edate").toString();
			System.out.println(ename+" "+edate);
			String query = "insert into upc_election values(?, ?, ?)";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, ename);
			st.setString(2, edate);
			st.setBoolean(3, false);
			
			st.executeUpdate();
			response.sendRedirect("officer_profile.jsp");
		} catch (Exception e) {

			e.printStackTrace();
		}
	}

}
