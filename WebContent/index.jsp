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
		session.setAttribute("start_now", false);
		session.setAttribute("end_now", false);
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

	<div class="row">
		<div class="col-1"></div><!-- to give margin of one col -->
		
		<div class="col-4" style="margin-left: 2%;">
			<!-- Heading -->
			<div class="row">
				<h1 style="font-family: cursive; color: #0b038d;">National Polling
					System</h1>
				<p style="font-family: cursive; color: #0b038d; opacity: 0.5;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					This is safe, secure and reliable voting system for national level
					elections. This system provides single platform for voters,
					candidates and executing officers.</p>
			</div>
			<!-- /Heading -->

			<!-- to give gap after heading -->
			<div class="row" style="height: 50px;"></div>

			<!-- Upcoming Elections -->
			<div class="row" style="border-left: 10px solid #008000; background-color:#f1d2f4;">
					<div class="col-10" >
					<%@ page import="org.dao.*" %>
					<%@ page import="java.sql.*" %>
					<%
						DataExchange de = new DataExchange();
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
						
					%>
					</div>				
			</div>

			<!-- /Upcoming Elections -->

		</div>

		<div class="col-1"></div>
		<!-- to give margin of one col -->

		 <!-- image part -->
		
		<div class="col-4"
			style="margin-top: 5%; border: 3px solid #fcf8a0; height: 370px; border-radius: 20px; padding: 1%;">
			<img src="ballot-safe.png" style="height: 100%; width: 100%;">
		</div>
		 <!-- /image part --> 

		<div class="col-1"></div>
		<!-- to give margin of one col -->



	</div>
	<!-- /body part -->



</body>
</html>
