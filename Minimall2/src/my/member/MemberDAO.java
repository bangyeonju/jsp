package my.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class MemberDAO {
	
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl"  ;
	String username="jspid" ; 
	String password="jsppw" ;
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	private static MemberDAO dao;
	
	public static MemberDAO getInstance() {
		if(dao == null) {
			dao = new MemberDAO();
		}
		return dao;
	}
	
	private MemberDAO() {
		try {
			Class.forName(driver);
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	public void getConnection(){
		
		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}   
	} // getConnection
	
	public boolean searchID(String userid){
		
		getConnection();
		String sql = "select id from members where id=?";
		boolean flag = false;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1,userid);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				flag = true; // 
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		
		return flag;
		
	}// searchID
	
	public int insertData(MemberDTO dto){
		getConnection();
		
		String sql = 
				"insert into members(no, name, id, password, rrn1, rrn2, email, hp1, hp2, hp3, joindate) ";
		sql += "values(memseq.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) " ;
		int cnt = -1;
		try {
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, dto.getName()) ;
			pstmt.setString(2, dto.getId()) ;
			pstmt.setString(3, dto.getPassword()) ;
			pstmt.setString(4, dto.getRrn1()) ; 
			pstmt.setString(5, dto.getRrn2()) ; 
			pstmt.setString(6, dto.getEmail()) ; 
			pstmt.setString(7, dto.getHp1()) ;
			pstmt.setString(8, dto.getHp2()) ;
			pstmt.setString(9, dto.getHp3()) ;
			pstmt.setString(10, dto.getJoindate()) ; 
			
			cnt = pstmt.executeUpdate() ;
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		return cnt;
	}//
	
	public MemberDTO getMemberByrrn(String name,String rrn1,String rrn2){
		getConnection();
		 
		String sql = "select * from members where name=? and rrn1=? and rrn2=?";
		MemberDTO mdto = null;
		
		try {
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, name) ;
			pstmt.setString(2, rrn1) ;
			pstmt.setString(3, rrn2) ;
			
			rs = pstmt.executeQuery() ; 
			
			if(rs.next()) {
				
				mdto = getMemberBean(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		return mdto;
		
		
	} //
	
	public MemberDTO getMemberByIdAndName(String id, String name,String rrn1,String rrn2){
		
		getConnection();
		 
		String sql = "select * from members where id=? and name=? and rrn1=? and rrn2=?";
		MemberDTO mdto = null;
		
		try {
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id) ;
			pstmt.setString(2, name) ;
			pstmt.setString(3, rrn1) ;
			pstmt.setString(4, rrn2) ;
			
			rs = pstmt.executeQuery() ; 
			
			if(rs.next()) {
				
				mdto = getMemberBean(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		return mdto;
		
	} // getMemberByIdAndName
	
	private MemberDTO getMemberBean(ResultSet rs) { // id찾기, pw찾기, 로그인
		
		MemberDTO mdto = new MemberDTO();
		try {
			mdto.setNo(rs.getInt("no"));
			mdto.setName(rs.getString("name")) ;
			mdto.setId(rs.getString("id"));
			mdto.setPassword(rs.getString("password"));
			mdto.setRrn1(rs.getString("rrn1")) ;
			mdto.setRrn2(rs.getString("rrn2")) ;
			mdto.setEmail(rs.getString("email")) ;
			mdto.setHp1(rs.getString("hp1")) ;
			mdto.setHp2(rs.getString("hp2"));
			mdto.setHp3(rs.getString("hp3"));
			mdto.setJoindate(rs.getString("joindate")) ;
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mdto;
	} //
	
	public MemberDTO getMemberInfo(String id, String password){
		getConnection();
		
		String sql = "select * from members where id=? and password=? ";
		MemberDTO mdto = null;
		
		try {
			pstmt = conn.prepareStatement(sql) ;
			pstmt.setString(1, id) ;
			pstmt.setString(2, password) ;
			
			rs = pstmt.executeQuery() ; 
			
			if(rs.next()) {
				
				mdto = getMemberBean(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		
		return mdto;
		
	}
	
	
}












