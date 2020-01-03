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
	<div class="row" style="height: 50px;"></div>

	<!-- Main Course -->
	<div class="row">
		<div class="col-2"></div>
		<!-- for gap -->

		<div class="col-8" style="border: 2px solid black; border-radius: 10px;">
			<form action="keep_voter" method="post" >
				<h2 style="font-family: cursive; color: blue">Voter Register</h2> <br>
				<h3 style="margin-left: 80px;">Personal Info</h3>
				<fieldset class="col-1"></fieldset>
				<fieldset style=" border:1px solid #008000; border-left: 20px solid #008000; border-radius:40px;  padding: 10px; margin-left:80px; background-color:white" class="col-10">
					
					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4"><input type="text" name="fullname" placeholder="Full Name"></div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4"><input type="text" name="fname" placeholder="Father's Name"></div>
					</div>					 
					
					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4"><input type="text" name="dob" placeholder="Date of Birth"></div>
						<div class="col-2"></div>
						<div class="col-4"><input type="text" name="gender" placeholder="Gender"></div>
					</div>
					 
					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4"><input type="text" name="uname" placeholder="User name"></div>
						<div class="col-2"></div>
						<div class="col-4"><input type="password" name="pass" placeholder="Password"></div>
					</div>
					
			
				</fieldset>
				
				<br> <br>
				<h3 style="margin-left: 80px;">Contact Info</h3>
				<fieldset class="col-1"></fieldset>
				<fieldset style=" border:1px solid #008000; border-right: 20px solid #008000; border-radius:40px;  padding: 10px; margin-left:80px; background-color:white" class="col-10">

					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4"><input type="text" name="state" placeholder="State"></div>
						<div class="col-2"></div>
						<div class="col-4"><input type="text" name="consti" placeholder="Constituency"></div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4"><input type="text" name="mob" placeholder="Mobile Number"></div>
						<div class="col-2"></div>
						<div class="col-4"><input type="text" name="email" placeholder="Email"></div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4"><input type="number" name="pin" placeholder="Pin Code"></div>
						<div class="col-2"></div>
						<div class="col-4"><textarea rows="4" cols="22" name="addr" placeholder="Full Address"></textarea></div>
					</div>
					 
				</fieldset>
				
				<br> <br>
				<h3 style="margin-left: 80px;">Uploads</h3>
				<fieldset class="col-1"></fieldset>
				<fieldset style=" border:1px solid #008000; border-left: 20px solid #008000;  border-radius:40px;  padding: 10px; margin-left:80px; background-color:white" class="col-10">

					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4">Passport size photograph</div>
						<div class="col-1"></div>
						<div class="col-4"><input type="file" name="img_pic"></div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4">Age Proof</div>
						<div class="col-1"></div>
						<div class="col-4"><input type="file" name="img_age"></div>
					</div>

					<div class="row" style="margin-top:5px;">
						<div class="col-1"></div>
						<div class="col-4">Address Proof</div>
						<div class="col-1"></div>
						<div class="col-4"><input type="file" name="img_addr"></div>
					</div>

				</fieldset>
				
				<br> <br>
				<input type="submit" class="btn btn-primary " style=" border-radius:20px; margin-left:43%; width:150px; height:40px;">  <br>
				<br>

			</form>

		</div>
	</div>
<br> <br> <br>
<hr style="color:white;">
	<!-- /Main Course -->
</body>
</html>