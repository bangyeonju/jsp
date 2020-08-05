package myPkg;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EmpleDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn = null;
	PreparedStatement pstmt=null;
	ResultSet rs = null;
	
	public EmpleDao() {

		try{
			Class.forName(driver);
		}catch(ClassNotFoundException e){
			e.printStackTrace(); 
		} 
	}

	public void getConnection() {
		try {
			conn = DriverManager.getConnection(url,dbid,dbpw);
			System.out.println("커넥션 생성됨");
		} catch (SQLException e) {
			e.printStackTrace();
		}

	} // getConnection
	
	public ArrayList<EmpleBean> getAllEmpls(){
		
		getConnection();
		
		String sql = "select * from empl order by mid asc";
		ArrayList<EmpleBean> lists = new ArrayList<EmpleBean>();
		try {
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				int mid = rs.getInt("mid");
				String name = rs.getString("name");
				int did = rs.getInt("did");
				int salary = rs.getInt("salary");

				EmpleBean empl = new EmpleBean(mid,name,did,salary);
				lists.add(empl);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
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
	}// getAllEmpls
	
	
	public int insertData(EmpleBean bean) {
		getConnection();
		
		String sql = "insert into empl(mid,name,did,salary) values(e_seq.nextval,?,?,?)";
		
		int cnt=-1;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getDid());
			pstmt.setInt(3,bean.getSalary());
			
			cnt=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		return cnt;
	} //
	


public int deleteData(int mid) {
		getConnection();
		int cnt =-1;
		String sql= "delete from empl where id=?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			cnt =pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}

				if(conn != null) {
					conn.close();
				}
			}catch(SQLException e) {

			}
		}
		
		return cnt;
		
	}
public void getEmpleByMid(int mid) {
	EmpleBean bean;
	getConnection();
	String sql="select name,salary,did form emple where mid=?";
		try {
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				int mid2=rs.getInt("mid");
				String name= rs.getString("name");
				int did =rs.getInt("did");
				int salary = rs.getInt("salary");
				bean= new EmpleBean(mid2,name,did,salary);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
}
	
	public int updateData(int mid) {
		getConnection();
		int cnt =-1;
		EmpleBean eb = new EmpleBean();
		String sql ="update empl set name=? did=? salary=? where mid=?";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,eb.getName());
			pstmt.setInt(2,eb.getDid());
			pstmt.setInt(3, eb.getSalary());
			pstmt.setInt(4, eb.getSalary());
			pstmt.executeQuery();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return cnt;
	}
}






