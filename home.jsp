<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	UserDetails user2 = (UserDetails) session.getAttribute("userD");
	if (user2 == null) {

		response.sendRedirect("login.jsp");
		session.setAttribute("without-login", "Please Login........");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="all_component/allcss.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
</head>
<body>

	<div class="container-fluid p-0">
		<%@include file="all_component/navbar.jsp"%>
		<div class="card py-5">
			<div class="card-body text-center">
				<img alt="" src="img/pen.jpg" class="img-fluid mx-auto"
					style="max-widith: 300px;">
				<h1>START TAKING YOUR NOTES</h1>
				<a href="addnotes.jsp" class="btn btn-outline-primary">Start
					Here</a>
			</div>
		</div>

	</div>
	<div style="margin-top: 125px;">
		<%@include file="all_component/footer.jsp"%>
	</div>
</body>
</html>