package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import oracle.net.aso.a;
import oracle.net.aso.p;

public class CategoryDAO {
	public static CategoryDAO cdao;
	public static CategoryDAO getInstance() {
		if(cdao==null) {
			cdao = new CategoryDAO();
		} 
		return cdao;
	}
	
	String driver= "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection conn=null;
	PreparedStatement ps = null;
	ResultSet rs= null;
	
	public CategoryDAO() {
		try {
			Class.forName(driver);
			System.out.println("카테고리 드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("카테고리 드라이버 실패");
		}
	}
	private void getConnection() {
		try {
			conn=DriverManager.getConnection(url,username,userpw);
			System.out.println("객체생성성공!");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("객체생성실패!");
		}
	}
	public int categoryInsert(String code, String cname) {
		getConnection();
		int cnt =-1;
		String sql= "insert into category values(catseq.nextval,?,?)";
		try {
			ps= conn.prepareStatement(sql);
			ps.setString(1, code);
			ps.setString(2, cname);
			
			cnt =ps.executeUpdate();
			
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
	public ArrayList<CategoryBean> categoryList(){
		getConnection();
		ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
		String sql= "select * from category order by cnum";
		try {
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				CategoryBean cbean = new CategoryBean();
				cbean.setCnum(rs.getInt("cnum"));
				cbean.setCode(rs.getString("code"));
				cbean.setCname(rs.getString("cname"));
				lists.add(cbean);
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
		return lists;
	}
	
	public int deleteCategory(int cnum) {
		getConnection();
		int cnt = -1;
		String sql = "delete from category where cnum=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, cnum);
			cnt = ps.executeUpdate();
			
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
	
}
