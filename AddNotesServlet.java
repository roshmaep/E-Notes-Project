package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.dao.AddNoteDAO;
import com.db.DBConnect;
import com.user.AddNotes;

@WebServlet("/AddNotesServlet")
public class AddNotesServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int uid = Integer.parseInt(request.getParameter("uid"));
		String title = request.getParameter("title");
		String content = request.getParameter("content");

		AddNoteDAO dao = new AddNoteDAO(DBConnect.getConn());
		boolean f = dao.addNotes(title, content, uid);

		if(f){
			System.out.println("notes inserted successfully....");
			response.sendRedirect("shownotes.jsp");
			
		}
		else{
			System.out.println("data not inserted");
		}
	}

}
