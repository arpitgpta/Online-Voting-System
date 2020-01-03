package org.dao;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/end_election")
public class EndElection extends HttpServlet {
	Connection con;
	public EndElection() throws ClassNotFoundException, SQLException {
		String sql_url = "jdbc:mysql://localhost:3306/voting_system";
		String sql_uname = "arpit";
		String sql_pass = "ArpitPro";
		Class.forName("com.mysql.jdbc.Driver");
		this.con = DriverManager.getConnection(sql_url, sql_uname, sql_pass);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		try {
			
			// first generate result and then end the election
			
			// find all constituency 
//				find winner of constituency
//				pirnt on result page 
			
			
			
			
			// end election 
//				mark votes of all candidates 0
//				delete entry from upc_election
			
			System.out.println("end page");
			DataExchange de = new DataExchange();
			ResultSet rs = de.ongoing_election();
			if (rs.next()) {

				String ename = rs.getString("ename");

			}
			response.sendRedirect("officer_profile.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
