package yj.food;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.oreilly.servlet.MultipartRequest;


public class FoodDao {

	private static FoodDao fdao;
	public static FoodDao getInstance() {
		if(fdao==null) {
			fdao= new FoodDao();
		}
		return fdao;
	}
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jspid";
	String password= "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	public FoodDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	
	private void getConnect() {
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}//getConnect()
	public int insertFood(MultipartRequest mr) {
		getConnect();
		int cnt = -1;
		String pname= mr.getParameter("pname");
		String pkind_fk = mr.getParameter("pkind_fk");
		pkind_fk += mr.getParameter("pcode");
		System.out.println("pkind_fk="+pkind_fk);
		int pqty =Integer.parseInt(mr.getParameter("pqty"));
		String pimage = mr.getFilesystemName("pimage");
		int price = Integer.parseInt(mr.getParameter("price"));
		String pcontent = mr.getParameter("pcontent");
		String pspec = mr.getParameter("pspec");
		int point = Integer.parseInt(mr.getParameter("point"));
		
		String sql = "insert into food(pnum,pname,pkind_fk,pqty,pimage,price,pcontent,pspec,point) "
				+ " values(foodseq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1,pname);
			ps.setString(2, pkind_fk);
			ps.setInt(3, pqty);
			ps.setString(4, pimage);
			ps.setInt(5, price);
			ps.setString(6, pcontent);
			ps.setString(7, pspec);
			ps.setInt(8, point);
			cnt = ps.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
	
	public ArrayList<FoodBean> foodList() {
		ArrayList<FoodBean> lists = new ArrayList<FoodBean>();
		getConnect();
		String sql = "select * from food order by pnum";
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next()) {
				FoodBean fb = new FoodBean();
				fb.setPnum(rs.getInt("pnum"));
				fb.setPname(rs.getString("pname"));
				fb.setPkind_fk(rs.getString("pkind_fk"));
				fb.setPqty(rs.getInt("pqty"));
				fb.setPimage(rs.getString("pimage"));
				fb.setPrice(rs.getInt("price"));
				fb.setPcontent(rs.getString("pcontent"));
				fb.setPspec(rs.getString("pspec"));
				fb.setPoint(rs.getInt("point"));
				lists.add(fb);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
			}catch (SQLException e){
				e.printStackTrace();
			}
				
			
		}
		
		
		return lists;
		
	}
	
	public int deleteFood(int pnum) {
		getConnect();
		int cnt =-1;
		String sql="delete from food where pnum=?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, pnum);
			cnt =ps.executeUpdate();
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
			}catch (SQLException e){
				e.printStackTrace();
			}
				
			
		}
		
		return cnt;
	}
	
	public ArrayList<FoodBean> selectFood(int pnum) {
		getConnect();
		ArrayList<FoodBean> lists = new ArrayList<FoodBean>();
		String sql = "select * from food where pnum =?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1,pnum);
			rs = ps.executeQuery();
			if(rs.next()) {
				FoodBean fb = new FoodBean();
				fb.setPnum(rs.getInt("pnum"));
				fb.setPname(rs.getString("pname"));
				fb.setPkind_fk(rs.getString("pkind_fk"));
				fb.setPqty(rs.getInt("pqty"));
				fb.setPimage(rs.getString("pimage"));
				fb.setPrice(rs.getInt("price"));
				fb.setPcontent(rs.getString("pcontent"));
				fb.setPspec(rs.getString("pspec"));
				fb.setPoint(rs.getInt("point"));
				lists.add(fb);
				
			}
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
				if(rs!=null) {
					rs.close();
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
				
		}
		return lists;
		
	}
	public void updatePimage(int pnum) {
		getConnect();
		int cnt = -1;
		String sql="update food set pimage=null where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
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
		
	}
	
	public int foodUpdate(MultipartRequest mr) {
		getConnect();
		int cnt = -1;
		String sql = "update food set pname=?,pkind_fk=?,pqty=?, pimage=? ,price=?, pcontent=?,"
				+ " pspec=?, point= ? where pnum =?"; 
		try {
			ps= conn.prepareStatement(sql);
			String pname = mr.getParameter("pname");
			String pkind_fk = mr.getParameter("pkind_fk");
			String pqty = mr.getParameter("pqty");
			String pimage = mr.getFilesystemName("pimage");
			String old_pimage=mr.getFilesystemName("old_pimage");
			if(pimage == null) {
				pimage = old_pimage;
			}
			String price = mr.getParameter("price");
			String pcontent =mr.getParameter("pcontent");
			String pspec =mr.getParameter("pspec");
			String point = mr.getParameter("point");
			String pnum = mr.getParameter("pnum");
			System.out.println("pnum="+pnum);
			
			ps.setString(1, pname);
			ps.setString(2,pkind_fk);
			ps.setString(3, pqty);
			ps.setString(4, pimage);
			ps.setString(5, price);
			ps.setString(6, pcontent);
			ps.setString(7, pspec);
			ps.setString(8, point);
			ps.setString(9, pnum);
			
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
	public ArrayList<FoodBean> getOneSelectByPnum(int pnum){
		getConnect();
		ArrayList<FoodBean> lists = new ArrayList<FoodBean>();
		String sql= "select * from food where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
			rs = ps.executeQuery();
			if(rs.next()) {
				FoodBean fb = new FoodBean();
				fb.setPnum(rs.getInt("pnum"));
				fb.setPname(rs.getString("pname"));
				fb.setPkind_fk(rs.getString("pkind_fk"));
				fb.setPqty(rs.getInt("pqty"));
				fb.setPimage(rs.getString("pimage"));
				fb.setPrice(rs.getInt("price"));
				fb.setPcontent(rs.getString("pcontent"));
				fb.setPspec(rs.getString("pspec"));
				fb.setPoint(rs.getInt("point"));
				lists.add(fb);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
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
			}catch (SQLException e){
				e.printStackTrace();
			}
				
		}
		
		return lists;
	}
	public ArrayList<FoodBean> getSelectByKind(String kcode){
		getConnect();
		ArrayList<FoodBean> lists= new ArrayList<FoodBean>();
		String sql = "select * from food where pkind_fk like ?";
		
			try {
				ps= conn.prepareStatement(sql);
				ps.setString(1, kcode+"%");
				rs= ps.executeQuery();
				
				while(rs.next()) {
					FoodBean fb = new FoodBean();
					fb.setPnum(rs.getInt("pnum"));
					fb.setPname(rs.getString("pname"));
					fb.setPkind_fk(rs.getString("pkind_fk"));
					fb.setPqty(rs.getInt("pqty"));
					fb.setPimage(rs.getString("pimage"));
					fb.setPrice(rs.getInt("price"));
					fb.setPcontent(rs.getString("pcontent"));
					fb.setPspec(rs.getString("pspec"));
					fb.setPoint(rs.getInt("point"));
					lists.add(fb);
					
				}
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
					if(rs!=null) {
						rs.close();
					}
				}catch (SQLException e){
					e.printStackTrace();
				}
					
			}
			
			return lists;
	}
public ArrayList<FoodBean> getselectBySpec(String spec){
		getConnect();
		ArrayList<FoodBean> lists = new ArrayList<FoodBean>();
		String sql = "select * from food where pspec =? ";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, spec);
			rs=ps.executeQuery();
			
			while(rs.next()) {
				FoodBean fb = new FoodBean();
				fb.setPnum(rs.getInt("pnum"));
				fb.setPname(rs.getString("pname"));
				fb.setPkind_fk(rs.getString("pkind_fk"));
				fb.setPqty(rs.getInt("pqty"));
				fb.setPimage(rs.getString("pimage"));
				fb.setPrice(rs.getInt("price"));
				fb.setPcontent(rs.getString("pcontent"));
				fb.setPspec(rs.getString("pspec"));
				fb.setPoint(rs.getInt("point"));
				lists.add(fb);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return lists;
	}
}
