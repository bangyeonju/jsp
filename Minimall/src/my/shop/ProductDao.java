package my.shop;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;



public class ProductDao {
	
	public static ProductDao pdao;
	public static ProductDao getInstance() {
		if(pdao==null) {
			pdao= new ProductDao();
		}
		return pdao;
	}
	String driver= "oracle.jdbc.driver.OracleDriver";
	
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String username="jspid";
	String userpw="jsppw";
	Connection conn=null;
	PreparedStatement ps = null;
	ResultSet rs= null;
	private ProductDao() {
		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}
	private void getConnection() {
		try {
			conn=DriverManager.getConnection(url,username,userpw);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public int insertProduct(MultipartRequest mr) {
		getConnection();
		int cnt =-1;
		String pname=mr.getParameter("pname");
		
		String pcategory_fk =mr.getParameter("pcategory_fk");
		pcategory_fk += mr.getParameter("pcode");
		System.out.println("pcategory_fk="+pcategory_fk);
		String pcompany =mr.getParameter("pcompany");
		String pimage = mr.getFilesystemName("pimage");
		int pqty =Integer.parseInt(mr.getParameter("pqty"));
		int price = Integer.parseInt( mr.getParameter("price"));
		String pspec =mr.getParameter("pspec");
		String pcontents =mr.getParameter("pcontents");
		int point =Integer.parseInt(mr.getParameter("point"));
		String pinputdate = mr.getParameter("pinputdate");
		
		String sql= "insert into product values(catprod.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, pname);
			ps.setString(2, pcategory_fk);
			ps.setString(3, pcompany);
			ps.setString(4, pimage);
			ps.setInt(5, pqty);
			ps.setInt(6, price);
			ps.setString(7, pspec);
			ps.setString(8, pcontents);
			System.out.println(pcontents);
			ps.setInt(9, point);
			
			Date d= new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String today = sdf.format(d);
			System.out.println("pspec"+pspec);
			ps.setString(10, today);
			
			cnt =ps.executeUpdate();
			
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
			}catch (SQLException e){
				e.printStackTrace();
			}
				
			
		}
		
		return cnt;
	}
	public ArrayList<ProductBean> productList(){
		getConnection();
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		String sql="select * from product order by pnum";
		try {
			
			ps = conn.prepareStatement(sql);
			rs= ps.executeQuery();
			
			lists = makeArrayList(rs);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}	finally {
			try {
				
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}
				if(rs!=null) {
					ps.close();
				}
			}catch (SQLException e){
				e.printStackTrace();
			}
				
			
		}
		return lists;
	}
	
	//상세보기,수정form,상품상세보기
	public ArrayList<ProductBean> productSelect(int pnum) {
		getConnection();
		ArrayList<ProductBean> lists= null;
				
		String sql ="select * from product where pnum=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, pnum);
			rs=ps.executeQuery();
			lists = makeArrayList(rs);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}if(rs!=null) {
					ps.close();
				}
				
			}catch (SQLException e){
				e.printStackTrace();
			}
				
			
		}
		return lists;
	}
	
	public ArrayList<ProductBean> makeArrayList(ResultSet rs){
		ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		try {
			while(rs.next()) {
				ProductBean pb = new ProductBean();
				
				pb.setPnum(rs.getInt("pnum"));
				pb.setPname(rs.getString("pname"));
				pb.setPcategory_fk(rs.getString("pcategory_fk"));
				pb.setPrice(rs.getInt("price"));
				pb.setPcompany(rs.getString("pcompany"));
				pb.setPimage(rs.getString("pimage"));
				pb.setPqty(rs.getInt("pqty"));
				pb.setPspec(rs.getString("pspec"));
				pb.setPcontents(rs.getString("pcontents"));
				pb.setPoint(rs.getInt("point"));
				pb.setPinputdate(rs.getString("pinputdate"));
				System.out.println(pb.getPcontents());
				/*
				 * pb.setTotalPrice(rs.getInt("totalPrice"));
				 * pb.setSalePrice(rs.getInt("salePrice"));
				 * pb.setTotalPoint(rs.getInt("totalPoint"));
				 */
				
				lists.add(pb);
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return lists;
	}
	
	
	public int deleteProduct(int pnum) {
		getConnection();
		int cnt = -1;
		String sql= "delete from product where pnum=?";
		try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, pnum);
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
	
	  public int updateProduct(MultipartRequest mr) {
	      getConnection();
	      int cnt =-1;
	      String pcompany = mr.getParameter("pcompany");
	      String pimage = mr.getFilesystemName("pimage");
	      String old_pimage =mr.getParameter("old_pimage");
	      if(pimage==null) {
	    	  pimage =old_pimage;
	      }
	      int pqty = Integer.parseInt(mr.getParameter("pqty"));;
	      int price = Integer.parseInt(mr.getParameter("price"));
	      String pspec = mr.getParameter("pspec");
	      String pcontents = mr.getParameter("pcontents");
	      int point = Integer.parseInt(mr.getParameter("point"));
	     int pnum= Integer.parseInt(mr.getParameter("pnum"));
	      System.out.println(pnum);
	      
	      String spl= "update product set pcompany=? ,pimage=? ,pqty=? ,price=? "
	            + ",pspec=? ,pcontents=? ,point=? where pnum=? ";

	      try {
	         ps=conn.prepareStatement(spl);
	         ps.setString(1, pcompany);
	         ps.setString(2, pimage);
	         ps.setInt(3, pqty);
	         ps.setInt(4, price);
	         ps.setString(5, pspec);
	         ps.setString(6, pcontents);
	         ps.setInt(7, point);
	         ps.setInt(8, pnum);
	         cnt = ps.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }finally {
	         try {
	            if(ps!=null)
	            	ps.close();
	            if(rs!=null)
	               rs.close();
	            if(conn!=null)
	               conn.close();
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }
	      }
	      
	      
	      return cnt;
	   }
	  
	  public int updatePimage(int pnum) {
		  getConnection();
		  int cnt = -1;
		  String sql = "update product set pimage=null where pnum=?";
		  try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, pnum);
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

	  public ArrayList<ProductBean> getSelectBySpec(String spec) {
		  getConnection();
		  ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		  String sql = "select * from product where pspec=?";
		 
		  try {
			  	ps=conn.prepareStatement(sql);
				  ps.setString(1, spec);
				  rs=ps.executeQuery();
				  lists = makeArrayList(rs);
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		  finally {
		         try {
		            if(ps!=null)
		            	ps.close();
		            if(rs!=null)
		               rs.close();
		            if(conn!=null)
		               conn.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		  return lists;
		  
	  }
	  public ArrayList<ProductBean> selectListByCode(String code) {
		  getConnection();
		  ArrayList<ProductBean> lists = new ArrayList<ProductBean>();
		  String sql = "select * from product where pcategory_fk like ?";
		  try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, code+"%");
			rs =ps.executeQuery();
			lists = makeArrayList(rs);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
	         try {
		            if(ps!=null)
		            	ps.close();
		            if(rs!=null)
		               rs.close();
		            if(conn!=null)
		               conn.close();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         }
		      }
		      
		return lists;
				  
		  
	  }
	  
}
