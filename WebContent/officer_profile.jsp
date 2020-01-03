<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="StyleSheet.css">
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

<script>
	function fun() {
		document.getElementById("popup").style.display = "flex";
	}
	document.querySelector('.close').addEventListener('click', function() {
		document.querySelector('.bg-modal').style.display = "none";
	});
	
</script>
<style type="text/css">
.bg-modal {
	background-color: rgba(0, 0, 0, .7);
	height: 100%;
	width: 100%;
	position: absolute;
	top: 0;
	display: none;
	justify-content: center;
	align-items: center;
}

.modal-content {
	background-color: white;
	box-shadow: 2px;
	height: 50%;
	width: 40%;
	padding: 10px;
	position: relative;
}

input {
	display: block;
	margin: 5% auto;
}

.close {
	top: 0;
	transform: rotate(45deg);
	cursor: pointer;
}
</style>
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
	<div class="row" style="height: 50px;"></div>


	<!-- main course -->
	<%@ page import="org.dao.*, java.sql.*"%>

	<h1 style="font-family:cursive; color:blue; margin-left: 170px;">Hello Officer!!</h1><br>


	<!-- ongoing election -->
	<%
		ResultSet officer_rs = (ResultSet) session.getAttribute("fetched_req_officer_data");
		if(officer_rs == null){
			response.sendRedirect("officer_login.jsp");
		}
		DataExchange de = new DataExchange();
		
	
		ResultSet ongoing = de.ongoing_election();
		ResultSet upc = de.get_elections();
		if (ongoing != null) {
			ongoing.next();
			out.println("<div class=\"row\">");
					out.println("<div class=\"col-2\"></div>");
					out.println("<div class=\"col-8\" style=\"border-left:10px solid black\">");
							out.println("<h2>Ongoing Election </h2>");
							out.println("&nbsp;&nbsp;&nbsp;&nbsp;"+ongoing.getString("ename"));
							out.println("<a  href=\"end_now.jsp\" class=\"btn btn-danger\" \">End now</a>");
					out.println("</div>");
			out.println("</div><br> <br>");
		
			//upcoming elections without start now button
			out.println("<div class=\"row\">");
					out.println("<div class=\"col-2\"></div>");
					out.println("<div class=\"col-6\" style=\"border-left:10px solid black\">");
							out.println("<h2>Upcoming Elections </h2>");
							out.println("<table class=\"table table-stepred table-hover\"");
									out.println("<tr><th>Election Name</th><th>Election Date</th></tr>");									
									while (upc.next()) {
										if (!upc.getBoolean("is_ongoing"))
											out.println("<tr><td>" + upc.getString("ename") + "</td><td>"
											            + upc.getString("edate") + "</td></tr>");
										out.println("<br>");
									}
							out.println("</table>");
							out.println("<button id=\"addElection\" onclick=\"fun()\" class=\"btn btn-primary\"style=\"margin-left:45%;\">add new</button>");
					out.println("</div>");
			out.println("</div>");
		}
		else{
			//upcoming elections with start now button
			out.println("<div class=\"row\">");
					out.println("<div class=\"col-2\"></div>");
					out.println("<div class=\"col-6\" style=\"border-left:10px solid black\">");
							out.println("<h2>Upcoming Elections </h2>");
							out.println("<table class=\"table table-stepred table-hover\"");
									out.println("<tr><th>Election Name</th><th>Election Date</th><th></th></tr>");									
									while (upc.next()) {
										if (!upc.getBoolean("is_ongoing"))
											out.println("<tr><td>"+ upc.getString("ename") + "</td><td>"+ upc.getString("edate") + "</td><td><a href = \"/VotingSystem/start_election?ename="+ upc.getString("ename") + "\" class=\"btn btn-success\">Start Now</a></td></tr>");
										out.println("<br>");
									}
							out.println("</table>");
							out.println("<button id=\"addElection\" onclick=\"fun()\" class=\"btn btn-primary\" style=\"margin-left:45%;\">add new</button>");
					out.println("</div>");
			out.println("</div>");
			
		}
			out.println();
			out.println();
	%>

	<!-- /ongoing election -->

<!-- add new pop up -->
<div class="bg-modal" id="popup" style="z-index:4">
	<div class="modal-content">
		<form action="addElection">
			<a href="officer_profile.jsp"><span class="close"> +</span></a> Add
			new election <span class="ffield"> <input type="text"
				placeholder="Election Name" name="ename"></span> <span
				class="ffield"> <input type="text"
				placeholder="Election Date" name="edate"></span> <span
				class="ffield"><input type="submit"></span>
		</form>

	</div>
</div>
<!-- /add new pop up -->

	<!-- /main course -->





</body>
</html>
<!-- 
out.println("<tr>" + "<td>" + upc.getString("ename") + "</td>" + "<td>"
					            + upc.getString("edate") + "</td>"
					            + "<td><a href = \"/VotingSystem/start_election?ename="
					            + upc.getString("ename") + "\">Start Now</a></td>" + "</tr>");
 -->