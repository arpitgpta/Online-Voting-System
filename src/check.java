
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.DataExchange;

@WebServlet("/check")
public class check extends HttpServlet {
	public void service(HttpServletRequest req, HttpServletResponse res) {
		try {

			String req_type = req.getParameter("type");
			String req_uname = req.getParameter("uname");
			String req_pass = req.getParameter("pass");
			ResultSet rs;

			HttpSession sess = req.getSession();
			DataExchange de = new DataExchange();

			
// for candidate			
			if (req_type.equals("candi")) {

				rs = de.get_candidate(req_uname, req_pass);
				if (rs.next()) {
					sess.setAttribute("fetched_req_candi_data", rs);
					res.sendRedirect("candi_profile.jsp");
				} else {
					sess.setAttribute("wrongPass", true);
					res.sendRedirect("candi_login.jsp");
				}
			}

			
// for voter			
			else if (req_type.equals("voter")) {

				rs = de.get_voter(req_uname, req_pass);

				if (rs.next()) {
					sess.setAttribute("fetched_req_voter_data", rs);
					boolean voted = rs.getBoolean("is_voted");
					ResultSet on_going = de.ongoing_election();
					if (on_going == null) {						
						res.sendRedirect("voter_profile1.jsp");             // if voted 
					}
					else {						
						res.sendRedirect("voter_profile2.jsp");             // if not voted
					}
				} 
		// wrong pass		
				else {
					sess.setAttribute("wrongPass", true);
					res.sendRedirect("voter_login.jsp");
				}
			} 
			
			
// for officer			
			else if (req_type.equals("officer")) {

				rs = de.get_officer(req_uname, req_pass);
				if (rs.next()) {
					sess.setAttribute("fetched_req_officer_data", rs);
					res.sendRedirect("officer_profile.jsp");
				} 
		// wrong pass
				else {
					sess.setAttribute("wrongPass", true);
					res.sendRedirect("officer_login.jsp");
				}
			}

		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
