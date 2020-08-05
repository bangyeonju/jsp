package emart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class emartDao {

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	
	Connection conn= null;
	ResultSet rs = null;
	PreparedStatement ps = null;
	
	public emartDao() {
		
	try {
		Class.forName(driver);
		System.out.println("드라이버 생성 성공");
	} catch (ClassNotFoundException e) {
		e.printStackTrace();
		System.out.println("드라이버 생성 실패");
	}   
	
	
	}
	private void getConnection() {
		try {
			conn =DriverManager.getConnection(url,username,userpw);
			System.out.println("객체성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("객체실풰");
		}
		
		
	}
	
	public ArrayList<EmartBean> getAllEmart() {
		System.out.println("getConnection()");
		getConnection();
		
		ArrayList<EmartBean> lists = new ArrayList<EmartBean>();
		String sql = "select * from emart order by id";
		
		try {
			ps =conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			while( rs.next() ) {
				System.out.println("1");
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String product = rs.getString("product");
				String time = rs.getString("time");
				String approve = rs.getString("approve");
				String agree = rs.getString("agree");
				EmartBean eb =new EmartBean(no, id, pw, product, time, approve, agree);
				lists.add(eb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) {
					rs.close();
				}

				if(ps != null) {
					ps.close();
				}

				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {

			}
		}
	
		
		return lists;
	}
	
	
}
