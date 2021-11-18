package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.User.Post;




public class PostDAO {
	private Connection conn;

	public PostDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean AddNotes(String ti,String co,int ui) {
		boolean f=false;
		try {
			
			String q="insert into post(title, content, uid) values (?,?,?)";
			PreparedStatement ps=conn.prepareStatement(q);
			ps.setString(1,ti);
			ps.setString(2,co);
			ps.setInt(3,ui);
			
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	public List<Post> getData(int id){
		List<Post> list=new ArrayList<Post>();
		Post p=null;
		
		try {
			
			String q="select * from post where uid=? order by id DESC";
			PreparedStatement ps=conn.prepareStatement(q);
			ps.setInt(1, id);
			ResultSet rs= ps.executeQuery();
			while(rs.next()) {
				p=new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				p.setDate(rs.getTimestamp(4));
			list.add(p);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	public Post getDataById(int noteId) {
		Post p=null;
		
		try {
			
			String qu="select * from post where id=?";
			PreparedStatement ps=conn.prepareStatement(qu);
            ps.setInt(1, noteId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				p=new Post();
				p.setId(rs.getInt(1));
				p.setTitle(rs.getString(2));
				p.setContent(rs.getString(3));
				
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return p;
	}
	public boolean PostUpdate(int nid,String ti, String co) {
		boolean f=false;
		
		try {
			
			String q="update post set title=?, content=? where id=?";
			PreparedStatement ps=conn.prepareStatement(q);
			ps.setString(1, ti);
			ps.setString(2, co);
			ps.setInt(3, nid);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	public boolean DeleteNotes(int nid) {
		boolean f=false;
		
		
		try {
			
			String q="delete from post where id=?";
			PreparedStatement ps=conn.prepareStatement(q);	
			ps.setInt(1,nid);
			int i=ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

}
