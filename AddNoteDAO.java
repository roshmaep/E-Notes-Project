package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.user.AddNotes;

public class AddNoteDAO {

	private Connection conn;

	public AddNoteDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addNotes(String ti, String co, int ui) {
		boolean f = false;

		try {

			String query = "insert into addnotes(title,content,uid) values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, ti);
			pst.setString(2, co);
			pst.setInt(3, ui);
			int i = pst.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;

	}

	public List<AddNotes> getNotes(int id) {

		List<AddNotes> list = new ArrayList<AddNotes>();

		AddNotes addNotes = null;
		try {
			String query = "select * from addnotes where uid=? order by id DESC";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1, id);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				addNotes = new AddNotes();
				addNotes.setId(rs.getInt(1));
				addNotes.setTitle(rs.getString(2));
				addNotes.setContent(rs.getString(3));
				addNotes.setDate(rs.getTimestamp(4));
				list.add(addNotes);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public AddNotes getDataById(int noteid) {

		AddNotes note = null;
		try {

			String query = "select * from addnotes where id=?";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setInt(1,noteid);
			ResultSet rs = pst.executeQuery();

			if (rs.next()) {
				note=new AddNotes();
				note.setId(rs.getInt(1));
				note.setTitle(rs.getString(2));
				note.setContent(rs.getString(3));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;

	}
}
