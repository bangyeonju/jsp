package emart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmartDao {
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	public EmartDao() { 
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}
	}//EmartDao
	
	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, userpw);
			System.out.println("커넥션 객체 생성 성공");

		} catch (SQLException e) {
			System.out.println("커넥션 객체 생성 오류");
			e.printStackTrace();
		}
	}//getConnection
	
	public ArrayList<EmartBean> getAllEmart(){
		
		getConnection();

		ArrayList<EmartBean> lists = new ArrayList<EmartBean>();
		String sql = "select * from emart order by num";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String product = rs.getString("product");
				String time = rs.getString("time");
				String approve = rs.getString("approve");
				String agree = rs.getString("agree");

				EmartBean eb = new EmartBean(num,id,pw,product,time,approve,agree);
				lists.add(eb);
			}

		} catch (SQLException e) {
			e.printStackTrace();

		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}

				if(pstmt != null) {
					pstmt.close();
				}

				if(conn != null) { 
					conn.close();
				}
			}catch(SQLException e) {

			}
		}

		System.out.println("getAllMembers lists.size() : " + lists.size());
		return lists;
	}//
	
	public int insertData(EmartBean eb) {
		
		getConnection();

		String sql = "insert into emart values(e_seq.nextval,?,?,?,?,?,?)";
		int cnt = -1;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, eb.getId());
			pstmt.setString(2, eb.getPw());
			pstmt.setString(3, eb.getProduct());
			pstmt.setString(4, eb.getTime());
			pstmt.setString(5, eb.getApprove());
			pstmt.setString(6, eb.getAgree());

			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}

				if(conn != null) { 
					conn.close();
				}
			}catch(SQLException e) {

			}
		}
		
		return cnt;
		
	}//insertData
	
	public int deleteData(int num){
		
		getConnection();
		
		String sql = "delete from emart where num=?";
		int cnt=-1;
		try{
			pstmt = conn.prepareStatement(sql);
			System.out.println("분석 성공");
			pstmt.setInt(1, num);
			
			cnt = pstmt.executeUpdate();
			System.out.println("실행 성공");
			
		}catch(SQLException e){
			e.printStackTrace();
			
		}finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return cnt;
	}//
	
	public int deleteCheckData(String[] str){
		
		for(int i=0;i<str.length;i++){
			System.out.println(str[i] +" "); // 2 4 7 
		}
		
		getConnection();
		int cnt = -1;
		
		//delete from emart where num=? or num=? or num=?;
		String sql = "delete from emart where num=?";
		
		for(int i=0;i<str.length-1;i++) {
			sql +=" or num=?";
		}
		try {
			pstmt = conn.prepareStatement(sql);
			for(int i=1;i<=str.length;i++) {
				pstmt.setInt(i, Integer.parseInt(str[i-1])); // 1:0  2:1  3:2
			}
			cnt = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		return cnt;		
		
	}//deleteCheckData
	
	
	public EmartBean getEmartByNum(int num){
		
		getConnection();
		
		String sql = "select * from emart where num=?";
		EmartBean eb = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num2 = rs.getInt("num");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String product = rs.getString("product");
				String time = rs.getString("time");
				String approve = rs.getString("approve");
				String agree = rs.getString("agree");

				eb = new EmartBean(num2,id,pw,product,time,approve,agree);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}

				if(pstmt != null) {
					pstmt.close();
				}

				if(conn != null) { 
					conn.close();
				}
			}catch(SQLException e) {

			}
		}
		return eb;
		
	}//getEmartByNum
	
	public int updateData(EmartBean eb){
		getConnection();
		
		String sql = "update emart set id=?, pw=?, product=?,time=?,approve=?,agree=? where num=?";
		int cnt = -1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, eb.getId());
			pstmt.setString(2, eb.getPw());
			pstmt.setString(3, eb.getProduct());
			pstmt.setString(4, eb.getTime());
			pstmt.setString(5, eb.getApprove());
			pstmt.setString(6, eb.getAgree());
			pstmt.setInt(7, eb.getNum());
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}

				if(conn != null) { 
					conn.close();
				}
			}catch(SQLException e) {

			}
		}
		
		return cnt;
		
	}//updateData
}


















