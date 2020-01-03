<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="StyleSheet" href="StyleSheet.css">
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
</head>
<body>


<!-- header -->
<div style="z-index:2; position: fixed; background-color: white; width: 100%;">
	<div class="row head">
		<div class="col-1"></div> <!-- to leave gap left before img-->
		
		<!-- img -->
		<div class="col-3 ">
			<img class="logo" alt="img" src="https://www.nvsp.in/Content/images/logo.png">
		</div>
		
		<div class="col-1"></div> <!-- to leave gap after img-->

		<!-- links -->
		<div class="col-6">
			<div class="col-3 home_btn ptr" ><a style="text-decoration:none; color:white;" href="index.jsp"> Home</a></div> 
			<div class="col-9 other_links">
				<div class="row">
					<div class="col-3">
						<!-- just gap -->
					</div>
					<div class="col-3" style="">
						<a href="results.jsp" style="text-decoration: none; color: black;">Result</a>
					</div>
					<div class="col-3 dropdown ptr">
						<a href="aboutus.html"
							style="text-decoration: none; color: black;">Contact Us</a>
					</div>
					<div class="col-3 dropdown ptr">
						<a href="logout.jsp" style="text-decoration: none; color: black;">Logout</a>
					</div>
				</div>
			</div> 
		</div>
		<div class="col-1"></div> <!-- to leave gap rightmost-->
	</div>
</div>
<div style="height:120px;"></div>
<!-- /header -->


	<!-- to give gap after heading -->
	<div class="row" style="height:50px;"></div>

<!-- main course -->


		<%@ page import="java.sql.*, org.dao.DataExchange"%>
		 <!-- fetching all values -->
		<%
			ResultSet voter_rs = (ResultSet) session.getAttribute("fetched_req_voter_data");
			if(voter_rs == null){
				response.sendRedirect("voter_login.jsp");
			}
			String voter_consti = voter_rs.getString("constituency");
			String voter_name = voter_rs.getString("fullname");
			String voter_dob = voter_rs.getString("dob");
			String voter_fname = voter_rs.getString("fname");
			String voter_addr = voter_rs.getString("addr");
			String voter_gender = voter_rs.getString("gender");
			String voter_pin = voter_rs.getString("pin");
			String voter_email = voter_rs.getString("email");
			String voter_mob = voter_rs.getString("mob");
			String voter_state = voter_rs.getString("state");
			String voter_uname = voter_rs.getString("uname");
			String voter_pass = voter_rs.getString("pass");

		%>


<!-- main course -->
<%
		DataExchange de1 = new DataExchange();
		voter_rs = de1.get_voter(voter_uname, voter_pass);
		voter_rs.next();
		boolean already_voted = voter_rs.getBoolean("is_voted");
		if(already_voted){
			response.sendRedirect("voter_profile1.jsp");
		}	
	%>


	<h1 style="font-family:cursive; color:blue; margin-left: 170px;">Hello Voter!!</h1><br>


	<!-- personal informations -->
	<div class="row">
		<div class="col-2"></div>
		<div class="col-8"
			style="border: 2px solid black; border-radius: 20px; padding: 5px 0px 5px 50px;">

			<!-- personal info -->
			<div class="row">
				<div class="col-12">
					<br>
					
					<h3>Personal Details</h3>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Name:</div>
						<div class="col-2"><%=voter_name%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Father's Name:</div>
						<div class="col-2"><%=voter_fname%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Date of Birth:</div>
						<div class="col-2"><%=voter_dob%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Gender:</div>
						<div class="col-2"><%=voter_gender%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Username:</div>
						<div class="col-2"><%=voter_uname%></div>

					</div>
					<br> <br>
					
					<h3>Contact Informations</h3>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">State:</div>
						<div class="col-2"><%=voter_state%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Constituency:</div>
						<div class="col-2"><%=voter_consti%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Email:</div>
						<div class="col-2"><%=voter_email%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Mobile Number:</div>
						<div class="col-2"><%=voter_mob%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-2" style="font-weight: bold;">PIN Code:</div>
						<div class="col-2"><%=voter_pin%></div>
						<div class="col-1"></div>
						<div class="col-2" style="font-weight: bold;">Postal
							Address:</div>
						<div class="col-2"><%=voter_addr%></div>
						<div class="col-1"></div>
					</div>
					<br> <br>
				
				</div>
			</div>
		</div>
	</div>

	<br>
	
	<!-- vote -->
	<div class="row">
		<div class="col-3"></div>
		<div class="col-6">

		<!-- Election name -->
		<% 
			DataExchange de = new DataExchange();
			ResultSet elections = de.ongoing_election();
			if (elections != null)
				while (elections.next()) {
					if (elections.getBoolean("is_ongoing")) {
						out.println("<span style=\"color:green; font-size:200%; font-family: cursive; margin-left:200px;\">Vote for : &nbsp;"+elections.getString("ename")+"</span>");
					}
				}
		
//		<!-- /Election name -->
		
//		<!-- Voting Form -->
		
			ResultSet candis = de.get_candidates(voter_consti);

			out.println("<form action=\"store_vote\" method= \"post\">");
			out.println("<h4>Your Candidates : </h4>");
			out.println("<table class=\"table table-bordered\" ><tr><th>Candidate Name</th><th>Party</th><th></th></tr>");
			while (candis.next()) {
				String candi_name = candis.getString("fullname");
				String candi_uname = candis.getString("uname");
				String candi_party = candis.getString("party");
				out.print("<tr><td>" + candi_name + "</td><td>"+candi_party+"</td>");
				out.print("<td><input type=radio name = vote value =" + candi_uname + "></td></tr>");
			}	
			out.println("</table>");
				out.print("<br>");

			out.println("<input class=\"btn btn-warning\" type=\"submit\" value=\"Vote\" style=\"margin-left:700px;\">");
			out.println("</form>");
		%>
		<!-- /Voting Form -->
		
		</div>	
		<div class="col-3"></div>
	</div>
	<!-- /vote -->
		<br>
		<br>
		<br>
		<hr>


<!-- /main course -->






</body>
</html>
