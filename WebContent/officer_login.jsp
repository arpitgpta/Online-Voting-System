<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<!-- master style sheet for whole system -->
<link rel="stylesheet" href="StyleSheet.css">

<meta charset="ISO-8859-1">
<title>Officer Login</title>


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
	<div class="row" style="height: 100px;"></div>

	<!-- login form -->
	<div class="row">
		<div class="col-4"></div>
		<!-- for gap -->
		<div class="col-4"
			style="text-align: center; border: 2px solid black; border-radius: 20px; padding: 20px;">
			<form action="check" method="post" class="">
				<h2 style="color: blue; font-family: cursive;">Officer Login</h2>
				<%
					boolean wrongPass = (boolean) session.getAttribute("wrongPass");
					if (wrongPass) {
						out.print("<span style=\"color:red;\" >try again</span>");
					}
					session.setAttribute("wrongPass", false);
				%>
				<input type="text" name="type" value="officer" hidden="hidden">
				<br> <input type="text" placeholder="Username" name="uname"
					style=""><br> <br> <input type="password"
					placeholder="Password" name="pass"> <br> <br> <input
					type="submit" class="btn btn-primary">
			</form>
		</div>
	</div>
	<!-- /login form -->

</body>
</html>