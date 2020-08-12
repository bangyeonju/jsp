package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

//singleton 패턴 객체
public class MemberDAO {
	//
	private static MemberDAO dao;
	
	public static MemberDAO getInstance() {
		if(dao==null) {
			dao=new MemberDAO();
		}
		return dao;
	
	}
	
	String driver= "oracle.jdbc.driver.OracleDriver";
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection conn=null;
	PreparedStatement ps = null;
	ResultSet rs= null;
	private MemberDAO() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드실패");
			e.printStackTrace();
		}
	}
	private void getConnection() {
		try {
			conn=DriverManager.getConnection(url,username,userpw);
			System.out.println("객체생성성공");
		} catch (SQLException e) {
			System.out.println("객체생성실패");
			e.printStackTrace();
		}
	}
	public boolean searchId(String userid) {
		getConnection();
		String sql = "select id from members where id=?";
		boolean flag=false;
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs= ps.executeQuery();
			
			if(rs.next()) { //아이디가 있다면 
				System.out.println(1);
				flag= true;
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
			}catch (SQLException e){
				e.printStackTrace();
			}
				
			
		}
		
		return flag; //아이디가 있다면 flag = true 아이디가 없다면  flag = false 보낸다
		
	}
}
