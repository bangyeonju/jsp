package yj.member;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


public class MemberDao {
	
	private static MemberDao mdao;
	
	public static MemberDao getInstance() {
		if(mdao==null) {
			mdao = new MemberDao();
		}
		return mdao;
	}
	
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jspid";
	String password= "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public MemberDao() {
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}
	}
	
	private void getConnect() {
		try {
			conn = DriverManager.getConnection(url, user, password);
			System.out.println("객체생성성공");
		} catch (SQLException e) {
			System.out.println("객체생성실패");
			e.printStackTrace();
		}
		
	}//getConnect()
	public int insertData(MemberBean mb) {
		getConnect();
		int cnt = -1;
		String sql="insert into y_members values(y_memseq.nextval,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			
			ps.setString(1, mb.getName());
			ps.setString(2, mb.getId());
			ps.setString(3, mb.getPassword());
			ps.setString(4, mb.getEmail());
			ps.setString(5, mb.getPhone());
			
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
			}catch (Exception e) {
			}
		}
		
		return cnt;
	}//insertData()
	
	public boolean searchId(String userid) {
		getConnect();
		String sql="select id from y_members where id=?";
		boolean flag = false;
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if(rs.next()) {
				flag =true;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
				if(rs!=null) {
					rs.close();
				}
				
			}catch (Exception e) {
			}
		}
		
		return flag;
		
	}//searchId()
	
	public MemberBean getMemberInfo(String id,String password) {
		getConnect();
		MemberBean mb =null;
		String sql = "select * from y_members where id=? and password=?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()) {
				mb = new MemberBean();
				mb.setId(rs.getString("id"));
				mb.setPassword(rs.getString("password"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
				if(conn!=null) {
					conn.close();
				}
				if(rs!=null) {
					rs.close();
				}
				
			}catch (Exception e) {
			}
		}
		
		return mb;
	}//getMemberInfo
	
}
