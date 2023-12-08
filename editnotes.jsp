<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.dao.AddNoteDAO" %>
<%@page import="com.user.AddNotes" %>    

<%@page import="com.db.DBConnect" %>    
    
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
<title>edit note page</title>
</head>
<body>

<%

Integer noteid=Integer.parseInt(request.getParameter("note_id"));
 AddNoteDAO dao=new AddNoteDAO(DBConnect.getConn());
 AddNotes note=dao.getDataById(noteid);

%>

	

<%@include file="all_component/navbar.jsp"%>

	<div class="container-fluid">
		<h1 class="text-center">Edit Your Notes</h1>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<form action="EditNoteServlet" method="post">
					
					<input type="hidden" value="<%=noteid%>">
					
						<div class="form-group">
							<label>Enter Title</label> <input type="text"
								class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="title" value="<%=note.getTitle()%>">

						</div>
						<div class="form-group">
							<label>Content</label>
							<textarea rows="8" cols="" class="form-control" name="content"
								required="required"><%=note.getContent() %></textarea>
						</div>

						<div class="text-center">
							<button type="submit" class="btn btn-primary">Edit Notes</button>
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