package yj.kind;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class KindDao {
	private static KindDao kdao;
	
	public static KindDao getInstance() {
		if(kdao==null) {
			kdao=new KindDao();
		}
		return kdao;
	}

	String driver ="oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String password= "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	
	public KindDao() {
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
	
	
	public int insertKind(String fcode,String fname) {
		getConnect();
		int cnt = -1;
		String sql= "insert into f_kind values(f_kindseq.nextval,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, fcode);
			ps.setString(2, fname);
			cnt = ps.executeUpdate();
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
			}catch (Exception e) {
			}
		}
		
		return cnt ;
	}
	
	public ArrayList<KindBean> selectKind(){
		ArrayList<KindBean> list = new ArrayList<KindBean>();
		getConnect();
		String sql= "select * from f_kind order by fnum";
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				KindBean kb = new KindBean();
				kb.setFnum(rs.getInt("fnum"));
				kb.setFcode(rs.getString("fcode"));
				kb.setFname(rs.getString("fname"));
				list.add(kb);
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
		return list;
	
				
	}
	
	
	public int deleteKind(int fnum) {
		getConnect();
		int cnt = -1;
		String sql = "delete from f_kind where fnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, fnum);
			cnt =ps.executeUpdate();
			
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
			}catch (Exception e) {
			}
		}
		return cnt ;
	}

	public ArrayList<KindBean>selectFcode(){
		ArrayList<KindBean> list = new ArrayList<KindBean>();
		getConnect();
		String sql = "select * from f_kind where fcode =? ";
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				KindBean kb = new KindBean();
				kb.setFnum(rs.getInt("fnum"));
				kb.setFcode(rs.getString("fcode"));
				kb.setFname(rs.getString("fname"));
				list.add(kb);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}

}
