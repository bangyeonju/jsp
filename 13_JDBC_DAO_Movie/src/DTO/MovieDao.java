package DTO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;


public class MovieDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String user = "jspid";
	String pw = "jsppw";

	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public MovieDao() {
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
			conn = DriverManager.getConnection(url, user, pw);
			System.out.println("객체생성 성공:)");
		} catch (SQLException e) {
			System.out.println("객체생성 실패:(");
			e.printStackTrace();
		}
	}

	public ArrayList<MovieBean> selectAll() {
		getConnection();
		ArrayList<MovieBean> lists = new ArrayList<MovieBean>();
		String sql = "select * from movie order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String genre = rs.getString("genre");
				String time = rs.getString("time");
				int partner = rs.getInt("partner");
				String memo = rs.getString("memo");
				MovieBean mb = new MovieBean(num, id, name, age, genre, time, partner, memo);
				lists.add(mb);

			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
			}
		}
		return lists;

	}

	public int insertData(MovieBean bean) {
		getConnection();
		System.out.println("insert");
		int cnt = -1;
		String sql = "insert into movie values(mv_seq.nextval,?,?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getName());
			ps.setInt(3, bean.getAge());
			ps.setString(4, bean.getGenre());
			ps.setString(5, bean.getTime());
			ps.setInt(6, bean.getPartner());
			ps.setString(7, bean.getMemo());

			System.out.println("insert실행");
			cnt =ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(conn != null) {
					conn.close();
				}
				if(ps != null) {
					ps.close();
				}
				
			} catch (Exception e2) {
			}
		}
		
		return cnt;
	}

	
	  public int deleteData(int num) {
		  getConnection(); int cnt = -1;
		  String sql ="delete from movie where num=? ";
		  try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  finally {
				try {
					if(conn != null) {
						conn.close();
					}
					if(ps != null) {
						ps.close();
					}
					
				} catch (Exception e2) {
				}
			}
		  return cnt;
	  
	  }
	  public int deleteAll(String[] str) {
		  getConnection();
		  int cnt =-1;
		  String sql="delete from movie where num=? ";
		  for(int i=0;i<str.length-1;i++) {
		  sql += " or num=?";
		  }
		  try {
			ps= conn.prepareStatement(sql);
			for(int i = 1;i<=str.length;i++) {
				ps.setInt(i, Integer.parseInt(str[i-1]));
			}
			ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		  
		  
		  
		  
		  return cnt;
	  }
	  
	  public MovieBean getMovieByNum(int num) {
		  getConnection();
		  String sql ="select * from movie where num=?";
		  MovieBean mb=null;
		  try {
			ps= conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs= ps.executeQuery();
			
			while(rs.next()) {
				String id=rs.getString("id");
				String name= rs.getString("name");
				int age = rs.getInt("age");
				String genre = rs.getString("genre");
				String time =rs.getString("time");
				int partner =rs.getInt("partner");
				String memo = rs.getString("memo");
				
				mb = new MovieBean(0,id,name,age,genre,time,partner,memo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (Exception e2) {
			}
		}
		  return mb;
	  }
	 
	
}
