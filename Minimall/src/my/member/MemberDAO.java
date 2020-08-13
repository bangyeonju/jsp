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
	
	public int insertData(MemberDTO mdto) {
		getConnection();
		int cnt = -1;
		String sql="insert into members values(memseq.nextval,?,?,?,?,?,?,?,?,?,?) ";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, mdto.getName());
			ps.setString(2, mdto.getId());
			ps.setString(3, mdto.getPassword());
			ps.setString(4, mdto.getRrn1());
			ps.setString(5, mdto.getRrn2());
			ps.setString(6, mdto.getEmail());
			ps.setString(7, mdto.getHp1());
			ps.setString(8, mdto.getHp2());
			ps.setString(9, mdto.getHp3());
			ps.setString(10, mdto.getJoindate());
			cnt=ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				
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
		
		return cnt;
	}
	
	public MemberDTO getMemberByrrn(String name, String rrn1, String rrn2) {
		getConnection();
		MemberDTO mdto= null;//select 문 돌려서 못 찾으면 null
		
		String sql= "select * from members where name=? and rrn1=? and rrn2=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, rrn1);
			ps.setString(3, rrn2);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				mdto =getMemberBean(rs);//select 한 결과를 getMemberBean에 보낸다.
			
			}
		} catch (SQLException e) {
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
		return mdto;
	}
	
	private MemberDTO getMemberBean(ResultSet rs) {
		MemberDTO mdto= new MemberDTO();
		try {
			mdto.setNo(rs.getInt("no"));
			mdto.setId(rs.getString("id"));
			mdto.setPassword(rs.getString("password"));
			mdto.setRrn1(rs.getString("rrn1"));
			mdto.setRrn2(rs.getString("rrn2"));
			mdto.setEmail(rs.getString("email"));
			mdto.setHp1(rs.getString("hp1"));
			mdto.setHp2(rs.getString("hp2"));
			mdto.setHp3(rs.getString("hp3"));
			mdto.setJoindate(rs.getString("joindate"));
			/* 방법 2
	        int no = rs.getInt("no");
	        String name =rs.getString("name");
	        String id =rs.getString("id");
	        String password =rs.getString("password");
	        String rrn1 =rs.getString("rrn1");
	        String rrn2 =rs.getString("rrn2");
	        String email =rs.getString("email");
	        String hp1 =rs.getString("hp1");
	        String hp2 =rs.getString("hp2");
	        String hp3 =rs.getString("hp3");
	        String joindate =rs.getString("joindate");   
	        mdto = new memberDTO(no, name, id, password, rrn1, rrn2, email, hp1, hp2, hp3, joindate);
			 */
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return mdto;
	}
	
	public MemberDTO getMemberByPwd(String id,String name,String rrn1,String rrn2) {
		getConnection();
		MemberDTO mdto = null;
		String sql= "select * from members where id=? and name=? and rrn1 =? and rrn2=?";
		try {
			System.out.println(id);
			System.out.println(name);
			System.out.println(rrn1);
			ps= conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, name);
			ps.setString(3, rrn1);
			ps.setString(4, rrn2);
			
			rs=ps.executeQuery();
			
			if(rs.next()) {
				mdto=getMemberBean(rs);
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
		System.out.println(mdto);
	return mdto;	
	}

	public MemberDTO getMemberInfo(String id,String password) {
		getConnection();
		MemberDTO mdto=null;
		String sql= "select * from members where id =? and password=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2,password);
			rs= ps.executeQuery();
			if(rs.next()) {
				mdto=getMemberBean(rs);
			}
		} catch (SQLException e) {
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
		return mdto;
	}
}
