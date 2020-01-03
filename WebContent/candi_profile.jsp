<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
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
<link rel="stylesheet" href="StyleSheet.css">
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

	<h1 style="font-family: cursive; color: blue; margin-left: 170px;">Hello
		Candidate!!</h1>
	<br>
	<%@ page import="java.sql.*"%>
	<!-- retriving and displaying data of candidate -->
	<%
		ResultSet candi = (ResultSet) session.getAttribute("fetched_req_candi_data");
		
		if(candi == null){
			response.sendRedirect("candi_login.jsp");
		}
		String fullname = candi.getString("fullname");
		String fname = candi.getString("fname");
		String uname = candi.getString("uname");
		String dob = candi.getString("dob");
		String gender = candi.getString("gender");
		String mob = candi.getString("mob");
		String email = candi.getString("email");
		String party = candi.getString("party");
		String moto = candi.getString("moto");
		String consti = candi.getString("constituency");
		String state = candi.getString("state");
		int pin = candi.getInt("pin");
		String addr = candi.getString("addr");
	%>

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
						<div class="col-2"><%=fullname%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Father's Name:</div>
						<div class="col-2"><%=fname%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Date of Birth:</div>
						<div class="col-2"><%=dob%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Gender:</div>
						<div class="col-2"><%=gender%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Username:</div>
						<div class="col-2"><%=uname%></div>

					</div>
					<br> <br>
					
					<h3>Contact Informations</h3>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">State:</div>
						<div class="col-2"><%=state%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Constituency:</div>
						<div class="col-2"><%=consti%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Email:</div>
						<div class="col-2"><%=email%></div>

						<div class="col-1"></div>

						<div class="col-2" style="font-weight: bold;">Mobile Number:</div>
						<div class="col-2"><%=mob%></div>

						<div class="col-2"></div>
					</div>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-2" style="font-weight: bold;">PIN Code:</div>
						<div class="col-2"><%=pin%></div>
						<div class="col-1"></div>
						<div class="col-2" style="font-weight: bold;">Postal
							Address:</div>
						<div class="col-2"><%=addr%></div>
						<div class="col-1"></div>
					</div>
					<br> <br>

					<h3>Electoral Informations</h3>
					<div class="row">
						<div class="col-1"></div>
						<div class="col-2" style="font-weight: bold;">Party:</div>
						<div class="col-2"><%=party%></div>
						<div class="col-1"></div>
						<div class="col-2" style="font-weight: bold;">Manifesto:</div>
						<div class="col-2"><%=moto%></div>
						<div class="col-1"></div>
					</div>
					<br> <br>
				
				</div>
			</div>
		</div>
	</div>
<br>
<br>
<br>
<br>
<br>
<hr style="color:white;">

	<!-- /main course -->




</body>
</html>