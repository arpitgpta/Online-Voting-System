package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/keep_candi")
public class KeepCandi extends HttpServlet {
	
	Connection con;
	public KeepCandi() throws ClassNotFoundException, SQLException {
		String sql_url = "jdbc:mysql://localhost:3306/voting_system";
		String sql_uname = "arpit";
		String sql_pass = "ArpitPro";
		Class.forName("com.mysql.jdbc.Driver");
		this.con = DriverManager.getConnection(sql_url, sql_uname, sql_pass);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) {
		try {
			String uname = req.getParameter("uname");
			String pass = req.getParameter("pass");
			String fullname = req.getParameter("fullname");
			String fname = req.getParameter("fname");
			String dob = req.getParameter("dob");
			String gender = req.getParameter("gender");

			String q_personal = "insert into candi_info (uname, pass, fullname, fname, dob, gender, votes ) values(?, ?, ?, ?, ?, ?, 0)";
			PreparedStatement st = con.prepareStatement(q_personal);
			st.setString(1,uname);
			st.setString(2, pass);
			st.setString(3, fullname);
			st.setString(4, fname);
			st.setString(5, dob);
			st.setString(6, gender);
			st.executeUpdate();
			
// IMPORTANT if consti name is not in consti name then add it t			
			
			String state = req.getParameter("state");
			int pin = Integer.parseInt(req.getParameter("pin"));
			String addr = req.getParameter("addr");
			String mob = req.getParameter("mob");
			String email = req.getParameter("email");
			String party = req.getParameter("party");
			String consti = req.getParameter("consti");
			String moto = req.getParameter("moto");
			String q_other = "update candi_info set state = ?, pin = ?, addr = ?, mob = ?, email = ?, party = ?, constituency = ?, moto = ? where uname = ? and pass = ?";
		
			st = con.prepareStatement(q_other);
			st.setString(1, state);
			st.setInt(2, pin);
			st.setString(3, addr);
			st.setString(4, mob);
			st.setString(5, email);
			st.setString(6, party);
			st.setString(7, consti);
			st.setString(8, moto);
			st.setString(9, uname);
			st.setString(10, pass);
			st.executeUpdate();
		      
			// if consti name is not there then updating consti list
			String query = "select * from consti where cname = ?";
			st = con.prepareStatement(query);
			st.setString(1, consti);
			ResultSet rs = st.executeQuery();
			if(!rs.next()) {
				query = "insert into consti values(?)";
				st = con.prepareStatement(query);
				st.setString(1, consti);
				st.executeUpdate();
			}
			
			res.sendRedirect("index.jsp");

		} catch (Exception e) {
			System.out.println(e);
		}

	}

}
