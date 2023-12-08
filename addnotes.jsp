<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.user.AddNotes"%>
<%
	UserDetails user1 = (UserDetails) session.getAttribute("userD");
	if (user1 == null) {

		response.sendRedirect("login.jsp");
		session.setAttribute("without-login", "Please Login........");
	}
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@include file="all_component/allcss.jsp"%>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Add notes</title>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<h1 class="text-center">Add Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="AddNotesServlet" method="post">
						<div class="form-group">
							<%
								UserDetails us = (UserDetails) session.getAttribute("userD");

								if (us != null) {
							%>
							<input type="hidden" value="<%=us.getId()%>" name="uid">

							<%
								}
							%>
							<label>Enter Title</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title">

						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="8" cols="" class="form-control" name="content"
								required="required"></textarea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Add Notes</button>
						</div>
					</form>

				</div>
			</div>
		</div>

		<div style="margin-top: 145px; width: 100%;">
			<%@include file="all_component/footer.jsp"%>
		</div>
	</div>

</body>
</html>