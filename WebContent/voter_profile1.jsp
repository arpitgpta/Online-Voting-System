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

		<%@ page import="java.sql.*, org.dao.DataExchange"%>
		 <!-- fetching all values -->
		<%
			
			ResultSet voter_rs = (ResultSet) session.getAttribute("fetched_req_voter_data");
			System.out.println(voter_rs);
			System.out.println((voter_rs == null));
			if(voter_rs == null){
				System.out.println("ok");
				response.sendRedirect("index.jsp");
			}
			%>
			<%
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
<br> <br>
	<!-- check for already voted -->
	<%
		DataExchange de = new DataExchange();
		voter_rs = de.get_voter(voter_uname, voter_pass);
		voter_rs.next();
		boolean already_voted = voter_rs.getBoolean("is_voted");
		boolean ongoing = false;
		ResultSet ongoing_election = de.ongoing_election();
		if(already_voted && ongoing_election!=null){
			out.print("<br><p style=\"color : red; text-align:center;\"> you have already voted</p>");
			out.print("<br>");
		}	
	%>
	<!-- /check for already voted -->	
	
	<%	
		out.println("<div class=\"row\">");
			out.println("<div class=\"col-1\"></div>");
			
//	<!-- Upcoming elections -->
			out.println("<div class=\"col-4\">");
			ResultSet rs = de.get_elections();
			if(rs.next()){
				out.println("<h3>Upcoming Election(s)</h3>");
				out.println("<table class=\"table table-bordered\"><tr><th>Election Name</th><th>Election Date</th></tr>");
				do{
					if(!rs.getBoolean("is_ongoing"))
						out.println("<tr><td>"+rs.getString("ename")+"</td><td>"+rs.getString("edate")+"</td></tr>");
				}while(rs.next());
				out.println("</table>");
				
			}				
			out.println("</div>");
//	<!-- /Upcoming elections -->
			
			out.println("<div class=\"col-1\"></div>");
	
// candi list			
			out.println("<div class=\"col-5\">");			
			ResultSet candis = de.get_candidates(voter_consti);
			if(candis.next()){
				out.println("<h3>Your Candidates</h3>");
				out.println("<table class=\"table table-bordered\"><tr><th>Candidate Name</th><th>Candidate Party</th></tr>");
				do{
						out.println("<tr><td>"+candis.getString("fullname")+"</td><td>"+candis.getString("party")+"</td></tr>");
				}while(candis.next());
				out.println("</table>");
				
			}				
			out.println("</div>");
// /candi list
			
			out.println("<div class=\"col-1\"></div>");
		out.println("</div>");	
	%>

<!-- /main course -->
	<br>
	<br>
	<br>
	<br>
	<hr>
</body>
</html>
