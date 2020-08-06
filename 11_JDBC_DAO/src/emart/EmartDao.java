package emart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmartDao {

	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String username = "jspid";
	String userpw = "jsppw";
	Connection conn = null;
	ResultSet rs = null;
	PreparedStatement ps = null;

	public EmartDao() {

		try {
			Class.forName(driver);
			System.out.println("드라이버로드성공");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이버로드실패");
		}

	}

	private void getConnection() {
		try {
			conn = DriverManager.getConnection(url, username, userpw);
			System.out.println("객체생성성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("객체성성실패");
		}

	}

	public ArrayList<EmartBean> getAllEmart() {
		System.out.println("getConnection()");
		getConnection();

		ArrayList<EmartBean> lists = new ArrayList<EmartBean>();
		String sql = "select * from emart order by no";

		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();

			while (rs.next()) {
				System.out.println("1");
				int no = rs.getInt("no");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String product = rs.getString("product");
				String time = rs.getString("time");
				String approve = rs.getString("approve");
				String agree = rs.getString("agree");
				EmartBean eb = new EmartBean(no, id, pw, product, time, approve, agree);
				lists.add(eb);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (ps != null) {
					ps.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {

			}
		}

		return lists;
	}

	public int insertData(EmartBean bean) {
		getConnection();
		int cnt = -1;
		String sql = "insert into emart values(emart_seq.nextval,?,?,?,?,?,?)";
		try {
			System.out.println('1');
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPw());
			ps.setString(3, bean.getProduct());
			ps.setString(4, bean.getTime());
			ps.setString(5, bean.getApprove());
			ps.setString(6, bean.getAgree());
			System.out.println(bean.getId());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return cnt;

	}

	public int deleteData(int no) {
		System.out.println("6");
		getConnection();
		int cnt = -1;
		String sql = "delete from emart where no=?";
		try {
			System.out.println("2");
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			cnt = ps.executeUpdate();
			System.out.println("3");
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}

		return cnt;
	}

	public int deleteCheckData(String[] str) {
		for(int i =0;i<str.length;i++) {
			System.out.println(str[i]+ " ");
		}
		int cnt= -1;
		getConnection();
		String sql = "delete from emart where no=?";
		for(int i=0;i<str.length-1;i++) {
			sql +=" or no=?";
		}
		try {
			ps=conn.prepareStatement(sql);
			for(int i=1;i<str.length+1;i++) {
				ps.setInt(i, Integer.parseInt(str[i-1]));
			}
		System.out.println("ㅜㄴ석시퓨ㅐ");
		System.out.println(str[1]);
		cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return cnt;
	}
	
	public EmartBean getEmartByNum(int no) {
		getConnection();
		String sql = "select * from emart where no = ?";
		EmartBean eb =null;

		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, no);
			rs = ps.executeQuery();
			while (rs.next()) {
				int no2 = rs.getInt("no");
				String id = rs.getString("id");
				String pw = rs.getString("pw");
				String product = rs.getString("product");
				String time = rs.getString("time");
				String approve = rs.getString("approve");
				String agree = rs.getString("agree");
				eb = new EmartBean(no2, id, pw, product, time, approve, agree);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}

				if (ps != null) {
					ps.close();
				}

				if (conn != null) {
					conn.close();
				}
			} catch (SQLException e) {

			}
		}
		return eb;
	}//getEmartByNum
	
	public int updateData(EmartBean bean) {
		getConnection();
		String sql = "update emart set id=?,pw=?,product=?,time=?,approve=?,agree=? where no = ?";
		int cnt =-1;
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bean.getId());
			ps.setString(2, bean.getPw());
			ps.setString(3, bean.getProduct());
			ps.setString(4, bean.getTime());
			ps.setString(5, bean.getApprove());
			ps.setString(6, bean.getAgree());
			ps.setInt(7, bean.getNo());
			cnt = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		
		return cnt;
	}
}