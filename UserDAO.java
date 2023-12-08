package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.user.UserDetails;

public class UserDAO {

	private Connection conn;

	public UserDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addUser(UserDetails us) {
		boolean f = false;
		try {

			String query = "insert into user(name,email,password) values(?,?,?)";
			PreparedStatement pst = conn.prepareStatement(query);
			pst.setString(1, us.getName());
			pst.setString(2, us.getEmail());
			pst.setString(3, us.getPassword());

			int i = pst.executeUpdate();
			if (i == 1) {
				f = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public UserDetails loginUser(UserDetails us){
		
		UserDetails user=null;
		try{
			String query="select * from user where email=? and password=?";
			PreparedStatement pst=conn.prepareStatement(query);
			pst.setString(1, us.getEmail());
			pst.setString(2, us.getPassword());
			ResultSet rs=pst.executeQuery();
			if(rs.next()){
				user=new UserDetails();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
			}

			
		}catch(Exception e){
			e.printStackTrace();
		}
		return user;
	}
}
