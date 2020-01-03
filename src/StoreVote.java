
import java.io.IOException;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.dao.DataExchange;

@WebServlet("/store_vote")
public class StoreVote extends HttpServlet {
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String voteTo = req.getParameter("vote");
			System.out.println(voteTo);
			DataExchange de = new DataExchange();
			de.store_vote(voteTo);
			System.out.println("ok");
			HttpSession sess = req.getSession();
			ResultSet rs = (ResultSet) sess.getAttribute("fetched_req_voter_data");
			String voter = rs.getString("uname");
			System.out.println(voteTo);
			
			System.out.println("voter " + voter);
			de.mark_voted(voter);
			
			res.sendRedirect("voter_profile1.jsp");
			
		} catch (Exception e) {
			System.out.println(e);
		}
	}

}
