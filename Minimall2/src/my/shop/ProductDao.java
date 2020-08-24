package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import com.oreilly.servlet.MultipartRequest;

public class ProductDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url="jdbc:oracle:thin:@localhost:1521:orcl"  ;
	String username="jspid" ; 
	String password="jsppw" ;

	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	private static ProductDao dao;

	public static ProductDao getInstance() {
		if(dao == null) {
			dao = new ProductDao();
		}
		return dao;
	}

	private ProductDao() {
		try {
			Class.forName(driver);

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}//ProductDao()

	public void getConnection(){

		try {
			conn = DriverManager.getConnection(url, username, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}   
	} // getConnection()

	public int insertProduct(MultipartRequest mr){
		getConnection();
		int cnt = -1;

		String pname = mr.getParameter("pname");

		String pcategory_fk = mr.getParameter("pcategory_fk");
		pcategory_fk += mr.getParameter("pcode");
		System.out.println("pcategory_fk:"+pcategory_fk);
		//pcategory_fk = pcategory_fk + pcode

		String pcompany=mr.getParameter("pcompany");
		String pimage=mr.getFilesystemName("pimage");

		String pqty=mr.getParameter("pqty");
		String price=mr.getParameter("price");
		String pspec=mr.getParameter("pspec");
		String pcontents=mr.getParameter("pcontents");
		String point=mr.getParameter("point");

		String sql = "insert into product values(catprod.nextval,?,?,?,?,?,?,?,?,?,?)";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, pname);
			pstmt.setString(2,pcategory_fk);
			pstmt.setString(3,pcompany);
			pstmt.setString(4,pimage);
			pstmt.setString(5,pqty);
			pstmt.setString(6,price);
			pstmt.setString(7,pspec);
			pstmt.setString(8,pcontents);
			pstmt.setString(9,point);

			Date d = new Date(); // 2020 08 14 11:31:26
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(d);
			pstmt.setString(10,today);

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}
		}

		return cnt;



	}//insertProduct


	public ArrayList<ProductBean> getProductAll(){
		getConnection();
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		String sql = "select * from product order by pnum";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			lists = makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();

				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}
		}
		return lists;


	}// getProductAll

	public ArrayList<ProductBean> makeArrayList(ResultSet rs){

		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();

		try {
			while(rs.next()) {
				int pnum=rs.getInt("pnum");
				String pname=rs.getString("pname");
				String pcategory_fk=rs.getString("pcategory_fk");
				String pcompany=rs.getString(4);
				String pimage=rs.getString(5);
				int pqty=rs.getInt(6);
				int price=rs.getInt(7);
				String pspec=rs.getString(8);
				String pcontents=rs.getString(9); 
				int point=rs.getInt(10);
				String pinputdate = rs.getString(11);

				ProductBean dto = new ProductBean(pnum,pname,pcategory_fk,
						pcompany,pimage,pqty,price,pspec,
						pcontents,point,pinputdate,0,0,0);

				lists.add(dto);			
			} // while

		} catch (SQLException e) {
			e.printStackTrace();
		}//try
		finally {
			try {
				if(rs!=null)
					rs.close();

				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}
		}

		return lists;

	}// makeArrayList

	// 상세보기, 수정form, 상품상세보기, 장바구니 담기,mall_cartEdit.jsp
	public ArrayList<ProductBean> getOneSelectByPnum(int pnum){

		getConnection();

		ArrayList<ProductBean> lists = null;
		String sql = "select * from product where pnum=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			rs=pstmt.executeQuery();

			lists = makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();

				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}
		}
		return lists; 

	}//getOneSelectByPnum

	public int deleteProduct(int pnum){
		getConnection();
		String sql = "delete from product where pnum=?";
		int cnt = -1 ;
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);
			cnt = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}
		}

		return cnt;
	}//deleteProduct

	public int updateProduct(MultipartRequest mr){
		getConnection();
		int cnt = -1;
		String sql ="update product set pname=?, pcategory_fk=?, " +
				"pcompany=?, pimage=?, pqty=?, price=?, pspec=?,pcontents=?,"+
				"point=? where pnum=?"; 

		try {
			pstmt = conn.prepareStatement(sql);
			String pname = mr.getParameter("pname");
			String pcategory_fk = mr.getParameter("pcategory_fk");
			String pcompany = mr.getParameter("pcompany");
			String pimage = mr.getFilesystemName("pimage");
			String old_pimage = mr.getParameter("old_pimage"); // 이전이미지.jpg
			System.out.println("dao pimage:"+pimage);
			System.out.println("dao old_pimage:"+old_pimage);
			if(pimage == null) {
				pimage = old_pimage;
			}
			String pqty=mr.getParameter("pqty");
			String price=mr.getParameter("price");
			String pspec=mr.getParameter("pspec");
			String pcontents=mr.getParameter("pcontents");
			String point=mr.getParameter("point");
			String pnum=mr.getParameter("pnum");

			pstmt.setString(1,pname);
			pstmt.setString(2,pcategory_fk);
			pstmt.setString(3,pcompany);
			pstmt.setString(4,pimage);
			pstmt.setInt(5, Integer.parseInt(pqty));
			pstmt.setInt(6, Integer.parseInt(price));
			pstmt.setString(7,pspec);
			pstmt.setString(8,pcontents);
			pstmt.setInt(9, Integer.parseInt(point));
			pstmt.setInt(10, Integer.parseInt(pnum));

			cnt = pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}
		}

		return cnt;


	}//updateProduct

	public void updatePimage(int pnum) {
		getConnection();
		PreparedStatement pstmt = null ;		

		String sql = "update product set pimage=null where pnum=?";

		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, pnum);

			pstmt.executeUpdate();

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}
		}


	}//

	//"HIT","NEW","BEST","NORMAL"
	public ArrayList<ProductBean> getSelectBySpec(String spec){

		getConnection();
		ArrayList<ProductBean> lists = null;

		String sql = "select * from product where pspec=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, spec);			
			rs=pstmt.executeQuery();
			lists = makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();

				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}

			return lists;
		}
	}//getSelectBySpec

	public ArrayList<ProductBean>  getSelectByCategory(String code){
		getConnection();
		ArrayList<ProductBean> lists = null;

		String sql = "select * from product where pcategory_fk like ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, code+"%"); // man%			
			rs=pstmt.executeQuery();
			lists = makeArrayList(rs);

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();

				if(pstmt!=null)
					pstmt.close();

				if(conn!=null)
					conn.close();
			}catch(SQLException e) {

			}

			return lists;
		}
	}
}












