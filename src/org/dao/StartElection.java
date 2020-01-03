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

@WebServlet("/start_election")
public class StartElection extends HttpServlet {
	Connection con;

	public StartElection() throws ClassNotFoundException, SQLException {
		String sql_url = "jdbc:mysql://localhost:3306/voting_system";
		String sql_uname = "arpit";
		String sql_pass = "ArpitPro";
		Class.forName("com.mysql.jdbc.Driver");
		this.con = DriverManager.getConnection(sql_url, sql_uname, sql_pass);

	}

	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		try {
			String ename = request.getParameter("ename");
			System.out.println(ename);
			String query = "update upc_election set is_ongoing = 1 where ename = ?";
			System.out.println(query);
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, ename);
			st.executeUpdate();
			query = "update candi_info set votes = 0";
			st = con.prepareStatement(query);
			st.executeUpdate();
			query = "update voter_info set is_voted = false";
			st = con.prepareStatement(query);
			st.executeUpdate();
			response.sendRedirect("/VotingSystem/officer_profile.jsp");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
