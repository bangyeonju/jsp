package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDao {

	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public MemberDao() {
		//1
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");

		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}
	}

	private void getConnection() {
		//2
		try {
			conn = DriverManager.getConnection(url, username, userpw);
			System.out.println("커넥션 객체 생성 성공");

		} catch (SQLException e) {
			System.out.println("커넥션 객체 생성 오류");
			e.printStackTrace();
		}
	}// getConnection

	public ArrayList<MemberBean> getAllMembers() {

		System.out.println("getAllMembers()");

		getConnection();

		ArrayList<MemberBean> lists = new ArrayList<MemberBean>();
		String sql = "select * from member order by num";

		try {
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();
			while(rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				String register = String.valueOf(rs.getDate("register"));
				/*
				MemberBean mb = new MemberBean();
				mb.setNum(num);
				mb.setId(id);
				mb.setPasswd(passwd);
				mb.setName(name);
				mb.setRegister(register);
				 */
				MemberBean mb = new MemberBean(num,id,passwd,name,register);
				lists.add(mb);
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

		System.out.println("getAllMembers lists.size()" + lists.size());
		return lists;
	}

	public int insertData(MemberBean mb){

		getConnection();

		String sql = "insert into member values(m_seq.nextval,?,?,?,sysdate)";
		int cnt = -1;
		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1,mb.getId());
			pstmt.setString(2,mb.getPasswd());
			pstmt.setString(3,mb.getName());

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
		int cnt=-1;
		String sql = "delete from member where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
		
	} // deleteData
	
	
	public MemberBean getMemberByNum(int num){
		
		getConnection();
		MemberBean mb = null;
		String sql = "select * from member where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				int num2 = rs.getInt("num");
				String id = rs.getString("id");
				String passwd = rs.getString("passwd");
				String name = rs.getString("name");
				String register = String.valueOf(rs.getDate("register"));
				
				mb = new MemberBean(num2,id,passwd,name,register);
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
		return mb;
		
	}//
	
	public int updateData(MemberBean mb){
		System.out.println("dao updateData()");
		System.out.println(mb.getNum());
		System.out.println(mb.getId());
		System.out.println(mb.getName());
		
		int cnt = -1;
		getConnection();
		
		String sql = "update member set passwd=?, name=? where num=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mb.getPasswd());
			pstmt.setString(2, mb.getName());
			pstmt.setInt(3, mb.getNum());
			
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
		
	}
}













