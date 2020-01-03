package org.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class DataExchange {

	Connection con;

	public DataExchange() throws ClassNotFoundException, SQLException {
		String sql_url = "jdbc:mysql://localhost:3306/voting_system";
		String sql_uname = "arpit";
		String sql_pass = "ArpitPro";
		Class.forName("com.mysql.jdbc.Driver");
		this.con = DriverManager.getConnection(sql_url, sql_uname, sql_pass);
	}

	public ResultSet get_candidate(String uname, String pass) throws SQLException {

		String query = "select * from candi_info where uname = ? and pass = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, uname);
		st.setString(2, pass);
		return st.executeQuery();

	}

	public ResultSet get_voter(String uname, String pass) throws SQLException {

		String query = "select * from voter_info where uname = ? and pass = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, uname);
		st.setString(2, pass);
		return st.executeQuery();

	}

	public ResultSet get_officer(String uname, String pass) throws SQLException {

		String query = "select * from officer_info where uname = ? and pass = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, uname);
		st.setString(2, pass);
		return st.executeQuery();

	}

	// function returns information of all the candidates of certain constituency
	public ResultSet get_candidates(String cname) throws SQLException {

		String query = "select * from candi_info where constituency = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, cname);
		ResultSet rs = st.executeQuery();

		return rs;
	}

	// function returns election detail if any election is ongoing else null
	public ResultSet ongoing_election() throws SQLException {

		String query = "select * from upc_election";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();
		while (rs.next())
			if (rs.getBoolean("is_ongoing")) {
				query = "select * from upc_election where ename = ?";
				st = con.prepareStatement(query);
				st.setString(1, rs.getString("ename"));
				return st.executeQuery();
			}

		return null;
	}

	// function to return all upcoming elections
	public ResultSet get_elections() throws SQLException {
		String query = "select * from upc_election";
		PreparedStatement st = con.prepareStatement(query);
		ResultSet rs = st.executeQuery();
		return rs;
	}

	// function to store vote it takes input of candidate's name, finds his current
	// vote and then stores by increasing one
	public void store_vote(String cname) throws SQLException {
		System.out.println("came here");
		String query = "select * from candi_info where uname = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, cname);
		ResultSet rs = st.executeQuery();
		rs.next();
		int current_votes = rs.getInt("votes");
		System.out.println(current_votes);
		query = "update candi_info set votes = ? where uname = ?";
		st = con.prepareStatement(query);
		st.setInt(1, current_votes + 1);
		st.setString(2, cname);
		st.executeUpdate();
	}

	// this function willl mark a voter as voted
	public void mark_voted(String uname) throws SQLException {
		String query = "update voter_info set is_voted = true where uname = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, uname);
		st.executeUpdate();

	}

	// generate result
	// it will consist of two functions one provides name of all constituency
	// and second gives winner of given constituency

	public ResultSet constis() throws SQLException {
		String query = "select * from consti";
		PreparedStatement st = con.prepareStatement(query);
		return st.executeQuery();
	}

	public ResultSet get_winner(String cname) throws SQLException {
		String query = "select * from candi_info where constituency = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, cname);
		ResultSet rs = st.executeQuery();
		String winner = "";
		int votes = 0;
		while (rs.next()) {
			int temp_votes = rs.getInt("votes");
			if (temp_votes > votes) {
				winner = rs.getString("uname");
				votes = temp_votes;
			}
		}
		query = "select * from candi_info where constituency = ? and uname =?";
		st = con.prepareStatement(query);
		st.setString(1, cname);
		st.setString(2, winner);
		rs = st.executeQuery();
		return rs;
	}

	// end election-- delete -- takes input consti name and deletes from
	// upc_election
	public void end_election() throws SQLException {
		ResultSet ongoing = ongoing_election();
		if(ongoing != null) {
			ongoing.next();
			String query = "delete from upc_election where ename =?";
			PreparedStatement st = con.prepareStatement(query);
			st.setString(1, ongoing.getString("ename"));
			st.executeUpdate();
			
		}
		
		// mark not voted
	}
	public void start_election() throws SQLException {
		String query = "update candi_info set votes = 0";
		PreparedStatement st = con.prepareStatement(query);
		st.executeUpdate();
		query = "update voter_info set is_voted = false";
		st = con.prepareStatement(query);
		st.executeUpdate();
	}

}
