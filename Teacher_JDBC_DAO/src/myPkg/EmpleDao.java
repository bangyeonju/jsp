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
			System.out.println("目池记 积己凳");
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

	public int deleteData(int mid){
		getConnection();
		String sql = "delete from empl where mid=?";
		int cnt=-1;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mid);
			cnt = pstmt.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
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

	public EmpleBean getEmpleByMid(int mid){

		getConnection();

		String sql = "select name, salary, did from empl where mid=?";

		EmpleBean bean=null;

		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,mid);
			rs = pstmt.executeQuery();

			if(rs.next()){
				String name = rs.getString("name");
				int salary = rs.getInt("salary");
				int did = rs.getInt("did");

				bean = new EmpleBean(mid,name,did,salary);
			}
		} catch (Exception e){
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
		return bean;
	}//

	public int updateData(EmpleBean eb){

		getConnection();

		String sql = "update empl set name=?, did=?, salary=? where mid=?";
		int cnt = -1;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, eb.getName());
			pstmt.setInt(2, eb.getDid());
			pstmt.setInt(3,eb.getSalary());
			pstmt.setInt(4,eb.getMid());
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
			try{
				if(pstmt!=null)
					pstmt.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e2){
				e2.printStackTrace();
			}
		}
		System.out.println("updateData() cnt:" + cnt);
		return cnt;
	}//updateData
	
	
	public int deleteCheckData(String [] rowcheck) {
		for(int i=0;i<rowcheck.length;i++){
			System.out.println(rowcheck[i]+" ");
				}
	
		
		getConnection();
		String sql = "delete from empl where mid=?";
		for(int i=0;i<rowcheck.length-1;i++) {
			sql+="or mid=?";
		}
	
		int cnt=-1;
		try{
			pstmt = conn.prepareStatement(sql);
			for(int i=1;i<=rowcheck.length;i++) {
				pstmt.setInt(i, Integer.parseInt(rowcheck[i-1]));
				
			}
			cnt = pstmt.executeUpdate();

		}catch(SQLException e){
			e.printStackTrace();
		}finally{
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






