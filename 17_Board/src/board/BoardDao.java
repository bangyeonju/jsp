package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BoardDao {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url= "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid="jspid";
	String userpw="jsppw";
	Connection conn=null;
	PreparedStatement ps =null;
	ResultSet rs= null;
	
	private static BoardDao dao;
	
	
	public static BoardDao getInstance() {
		if(dao==null) {
			dao=new BoardDao();
		}
		return dao;
	}
	private BoardDao() {
		System.out.println("BoardDao()");
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}
		
	}
	private void getConnection() {
		try {
			conn= DriverManager.getConnection(url,userid,userpw);
			System.out.println("객체생성ㅅ어공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("객체생성실패");
		}
	}
	
	public int getArticleCount() {
		getConnection();
		int x=0;
		String sql= "select count(*) as cnt from board";
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				x =rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}
			}catch (Exception e) {
			}


		}
		return x;
		
	}
	
	public ArrayList<BoardBean> getArticles(int start,int end){
		getConnection();
		ArrayList<BoardBean> lists =new ArrayList<BoardBean>();
		String sql ="select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content,ip "
	            +"from(select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content,ip "
	            +"from(select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content,ip from board order by ref desc, re_step asc))"
	            +"where rank between ? and ?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {
				int num =rs.getInt("num");
				String writer= rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd=rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level= rs.getInt("re_level");
				String content = rs.getString("content");
				String ip= rs.getString("ip");
				
				BoardBean bean =new BoardBean(num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip);
				lists.add(bean);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return lists;
	}//getArticles
	
	
	
	
	
	
	
	
	
	
}
