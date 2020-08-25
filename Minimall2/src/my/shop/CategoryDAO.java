package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class CategoryDAO {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe"  ;
	String username="jspid" ; 
	String password="jsppw" ;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private static CategoryDAO dao;

	public static CategoryDAO getInstance() {
		if(dao == null) {
			dao = new CategoryDAO();
		}
		return dao;
	}
	
	private CategoryDAO() {
		try {
			Class.forName(driver);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}//

	public void getConnection(){

		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}   
	} // getConnection

	public int insertCategory(CategoryBean cbean){
		getConnection();
		int cnt = -1;
		String sql="insert into category values(catseq.nextval,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, cbean.getCode());
			pstmt.setString(2, cbean.getCname());
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		
		return cnt;
		
	}//insertCategory
	
	public ArrayList<CategoryBean> getAllCategory(){
		getConnection();
		ArrayList<CategoryBean> lists = new ArrayList<CategoryBean>();
		String sql = "select * from category order by cnum asc";
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
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
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		return lists;
		
	}//getAllCategory()
	
	public int categoryDelete(int cnum){
		getConnection();
		int cnt = -1 ;
		String sql = "delete from category where cnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, cnum);
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			}catch(Exception e) {
				
			}
		}
		return cnt;
	}
}







