package DTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BookDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn = null;
	
	public BookDao() { // 
		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
			System.out.println("目池记 积己凳");

		}catch(SQLException e){
			e.printStackTrace();

		}catch(ClassNotFoundException e){
			e.printStackTrace();

		}catch(Exception e){
			e.printStackTrace();
		}
	}//BookDao()
	
	public ArrayList<BookBean> getAllBooks(){
		String sql = "select * from book"; 
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		ArrayList<BookBean> lists = new ArrayList<BookBean>();

		try{
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				int no = rs.getInt("no");
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int price = rs.getInt("price");
				String buy = String.valueOf(rs.getDate("buy"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int count = rs.getInt("count");

				BookBean bean = new BookBean(no, title, author, publisher, price, buy, kind, bookstore, count);
				lists.add(bean);
			}
			

		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
		return lists;

	}//
	
	//default(X)
	public int insertData(BookBean bean){
		System.out.println("bean.getKind():"+bean.getKind());
		PreparedStatement pstmt = null;
		int cnt = -1;
		try {
			String sql = "insert into book values(bseq.nextval,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			System.out.println("盒籍 己傍");
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getAuthor());
			pstmt.setString(3, bean.getPublisher());
			pstmt.setInt(4, bean.getPrice());
			pstmt.setString(5, bean.getBuy());
			pstmt.setString(6, bean.getKind());
			pstmt.setString(7, bean.getBookstore());
			pstmt.setInt(8, bean.getCount());

			cnt = pstmt.executeUpdate();
			System.out.println("角青 己傍");

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	
	public int deleteData(int no){
		
		PreparedStatement pstmt = null;
		int cnt = -1;
		try {
			String sql = "delete from book where no=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	}// deleteData
	
	public int deleteCheckData(String[] str){
		
		PreparedStatement pstmt=null;
		int cnt=-1;
		
		String sql = "delete from book where no=?";
		for(int i=0;i<str.length-1;i++){
			sql += " or no=?";
		}
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			for(int i=1;i<=str.length;i++){
				pstmt.setInt(i,Integer.parseInt(str[i-1]));
			}
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
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
	
	public BookBean getBookByNo(int no){

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		BookBean bean = null;

		try {
			String sql = "select * from book where no=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, no);

			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				String title = rs.getString("title");
				String author = rs.getString("author");
				String publisher = rs.getString("publisher");
				int price = rs.getInt("price");
				String buy = String.valueOf(rs.getDate("buy"));
				String kind = rs.getString("kind");
				String bookstore = rs.getString("bookstore");
				int count = rs.getInt("count");

				bean = new BookBean(no, title, author, publisher, price, buy, kind, bookstore, count);

			}
		}catch(Exception e) {

		}finally {
			try{
				if(rs!=null)
					rs.close();
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}

		return bean;
	}//getBookByNo
	
	public int updataData(BookBean bean){
		
		PreparedStatement pstmt = null;
		int cnt = -1;
		try {
			String sql = "update book set title=?, author=?, publisher=?, price=?, buy=?, kind=?, "
						+ "bookstore=?,count=? where no=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getTitle());
			pstmt.setString(2, bean.getAuthor());
			pstmt.setString(3, bean.getPublisher());
			pstmt.setInt(4, bean.getPrice());
			pstmt.setString(5, bean.getBuy());
			pstmt.setString(6, bean.getKind());
			pstmt.setString(7, bean.getBookstore());
			pstmt.setInt(8, bean.getCount());
			pstmt.setInt(9, bean.getNo());

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	}
}








