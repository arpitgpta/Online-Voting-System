<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<!-- master style sheet for whole system -->
<link rel="stylesheet" href="StyleSheet.css">

<meta charset="ISO-8859-1">
<title>Online Voting System--Home</title>


<!-- bootstrap -->
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


	<!-- initialy making marker of wrong pass false -->
	<%
		session.setAttribute("wrongPass", false);
	%>
	<!-- header -->
	<div style="z-index:2; position: fixed; background-color: white; width: 100%;">
	<div class="row head">
		<div class="col-1"></div>
		<!-- to leave gap left before img-->

		<!-- img -->
		<div class="col-3 ">
			<img class="logo" alt="img"
				src="https://www.nvsp.in/Content/images/logo.png">
		</div>

		<div class="col-1"></div>
		<!-- to leave gap after img-->

		<!-- links -->
		<div class="col-6">
			<div class="col-3 home_btn ptr">
				<a style="text-decoration: none; color: white;" href="index.jsp">
					Home</a>
			</div>
			<div class="col-9 other_links">
				<div class="row">
					<div class="col-3">
						<a href="results.jsp" style="text-decoration: none; color: black;">Result</a>
					</div>
					<div class="col-3" style="">
						<a href="aboutus.html"
							style="text-decoration: none; color: black;">About Us</a>
					</div>
					<div class="col-3 dropdown ptr">
						<span class="dropdown-toggle" data-toggle="dropdown">Sign
							In <span class="caret"></span>
						</span>
						<ul class="dropdown-menu dd_menu">
							<li><a href="voter_login.jsp">Voter</a></li>
							<li><a href="candi_login.jsp">Candidate</a></li>
							<li><a href="officer_login.jsp">Officer</a></li>

						</ul>
					</div>
					<div class="col-3 dropdown ptr">
						<span class="dropdown-toggle" data-toggle="dropdown">Sign
							Up <span class="caret"></span>
						</span>
						<ul class="dropdown-menu dd_menu">
							<li><a href="voter_register.jsp">Voter</a></li>
							<li><a href="candi_register.jsp">Candidate</a></li>
						</ul>
					</div>
				</div>
			</div>

		</div>

		<div class="col-1"></div>
		<!-- to leave gap rightmost-->


	</div>
	</div>
	<div style="height:120px;"></div>
	<!-- /header -->

	<!-- to give gap after heading -->
	<div class="row" style="height: 50px;"></div>



	<!-- body part -->

	<%@ page import="org.dao.DataExchange"%>
	<%@ page import="java.sql.*"%>

	<div class="row">
		<div class="col-4"></div> <!-- for spacing -->
		<div class="col-4" style="font-size:130%">
			<div class="row"><div class="col-12" style="height:10px;"></div></div>
			<div class="row"><div class="col-12"><img alt="no_img" src="congo.jpg" style="height:120px; width:100%;"></div></div>
			<div class="row">
				<div class="col-1"></div>
				<div class="col-9">
					<table class="table table-bordered table-striped">
						<tr>
							<th>Constituency</th>
							<th>Winner</th>
							<th>votes</th>
						</tr>
						<%
							DataExchange de = new DataExchange();
							ResultSet constis = de.constis();
							while (constis.next()) {
								String cname = constis.getString("cname");
								ResultSet winner = de.get_winner(cname);
								if (winner.next()) {
									String wname = winner.getString("fullname");
									int votes = winner.getInt("votes");
									out.println("<tr>");
									out.println("<td>" + cname + "</td>");
									out.println("<td>" + wname + "</td>");
									out.println("<td>" + votes + "</td>");
									out.println("</tr>");
								}
							}
							boolean end_now = (boolean)session.getAttribute("end_now");
							if(end_now){
								de.end_election();
								session.setAttribute("end_now", false);
							}
						%>				
					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- /body part -->


	<!-- // first generate result and then end the election
			// find all constituency 
			//find winner of constituency
			// print on result page  -->



	<!--		
			
			// end election 
//				mark votes of all candidates 0
//	  			delete entry from upc_election -->


</body>
</html>