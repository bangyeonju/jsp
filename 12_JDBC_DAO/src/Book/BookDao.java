package Book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDao {
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	//**jar파일 가지고 오기!!!!!!**
	public BookDao(){
		try {
			Class.forName(driver);
			System.out.println("드라이버 로드 성공");
			
		} catch (ClassNotFoundException e) {
			System.out.println("드라이버 로드 실패");
			e.printStackTrace();
		}
		
	}
	private void getConnection() {
		try {
			conn= DriverManager.getConnection(url,username,userpw);
			System.out.println("객체생성성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("객체생성실패");
		}
		
	}
	public ArrayList<BookBean> getAllBooks(){
		System.out.println('1');
		ArrayList<BookBean> lists = new ArrayList<BookBean>();
		getConnection();
		System.out.println('2');
		String sql="select * from book order by num";
		try {
			ps= conn.prepareStatement(sql);
			rs =ps.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("num");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int price = rs.getInt("price");
				String buy = String.valueOf(rs.getString("buy"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int count = rs.getInt("count");
				
				BookBean bb = new BookBean(num,title,author,publisher,price,buy,kind,bookstore,count);
				lists.add(bb);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(rs!=null) {
					rs.close();
				}
			} catch (Exception e) {
			}
			
		}//finally
		
		return lists;
		
	}

}
