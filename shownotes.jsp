<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.AddNoteDAO" %>
<%@page import="com.db.DBConnect" %>
<%@page import="java.util.List" %>
<%@page import="com.user.AddNotes" %>

<%
	UserDetails user3 = (UserDetails) session.getAttribute("userD");
	if (user3 == null) {

		response.sendRedirect("login.jsp");
		session.setAttribute("without-login", "Please Login........");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>show notes</title>
<%@include file="all_component/allcss.jsp"%>
</head>
<body>
	<%@include file="all_component/navbar.jsp"%>
		<div class="container">
			<h1 class="text-center">All Notes</h1>
				<div class="row">
					<div class="col-md-12">

<%
if(user3!=null){
	
	AddNoteDAO dao=new AddNoteDAO(DBConnect.getConn());
	List<AddNotes> addnotes=dao.getNotes(user3.getId());
	for(AddNotes a:addnotes){
		
%>	
<div class="card mt-3">
	<img alt="" src="img/pen.jpg" class="card-img-top mt-2 mx-auto" style="width:100px;">
		<div class="card-body p-4">
			<h5 class="card-title"><%=a.getTitle() %></h5>
				<p><%=a.getContent() %></p>
				<!--  <p><b class="text-success">published by:<%=user3.getName()%></b><br><b class="text-primary"></b></p>-->
				<p><b class="text-success">Date:<%=a.getDate() %></b><br><b class="text-primary"></b></p>
					<div class="container text-center mt-2">
					
						<a href="deletenotes.jsp" class="btn btn-danger">Delete</a>
						<a href="editnotes.jsp?note_id=<%=a.getId() %>"class="btn btn-primary">Edit</a>
					</div>
		</div>
</div>
		
<% }
	
}

%>
				</div>
			</div>
		</div>
	</body>
</html>