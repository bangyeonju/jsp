package Book;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDao {
	
	String driver="oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:xe";
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
	
	public int insertData(BookBean bean) {
		getConnection();
		int cnt =-1;
		String sql = "insert into book values(b_seq.nextval,?,?,?,?,?,?,?,?)";
		try {
			System.out.println("insert1");
			ps = conn.prepareStatement(sql);
			
			ps.setString(1, bean.getTitle());
			ps.setString(2, bean.getAuthor());
			ps.setString(3, bean.getPublisher());
			ps.setInt(4, bean.getPrice());
			ps.setString(5, bean.getBuy());
			ps.setString(6, bean.getKind());
			ps.setString(7,bean.getBookstore());
			ps.setInt(8, bean.getCount());
			
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
				
				
			} catch (Exception e) {
			}
			
		}//finally
		
 		
		
		return cnt;
		
	}

	public int deleteData(int num) {
		getConnection();
		int cnt = -1;
		String sql = "delete from book where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			cnt = ps.executeUpdate();
					
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}
				
				
			} catch (Exception e) {
			}
			
		}//finally
		
 		
		
		return cnt;
	}
}
