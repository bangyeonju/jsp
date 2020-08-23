package myPkg;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

public class MovieDao {
	String driver = "oracle.jdbc.driver.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:orcl";
	String dbid="jspid";
	String dbpw="jsppw";
	Connection conn = null;

	public MovieDao() {

		try{
			Class.forName(driver);
			conn = DriverManager.getConnection(url,dbid,dbpw);
			
		}catch(SQLException e){
			e.printStackTrace();

		}catch(ClassNotFoundException e){
			e.printStackTrace();

		}catch(Exception e){
			e.printStackTrace();
		}
	}


	public Vector<MovieBean> getAllMovies(){
		String sql = "select * from movie order by num";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		Vector<MovieBean> lists = new Vector<MovieBean>();
		try{
			pstmt=conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while(rs.next()){
				int num = rs.getInt("num");
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String genre = rs.getString("genre");
				String time = rs.getString("time");
				int partner = rs.getInt("partner");
				String memo = rs.getString("memo"); 
				MovieBean movie = new MovieBean(num,id,name,age,genre,time,partner,memo);
				lists.add(movie);
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
	}

	public int insertData(MovieBean bean) {
		PreparedStatement pstmt = null;
		String sql = "insert into movie(num,id,name,age,genre,time,partner,memo) "
				+ "values(mv_seq.nextval,?,?,?,?,?,?,?)";
		int cnt=-1;
		try{
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getName());
			pstmt.setInt(3, bean.getAge());
			pstmt.setString(4, bean.getGenre());
			pstmt.setString(5, bean.getTime());
			pstmt.setInt(6,bean.getPartner());
			pstmt.setString(7, bean.getMemo());

			cnt=pstmt.executeUpdate();
			
		}catch(Exception e){
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
	}

	public MovieBean getMovieByNum(int num){ 

		String sql = "select * from movie where num=?";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		MovieBean member=null;
		try{
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,num);
			rs = pstmt.executeQuery();

			if(rs.next()){ 
				String id = rs.getString("id");
				String name = rs.getString("name");
				int age = rs.getInt("age");
				String genre = rs.getString("genre");
				String time = rs.getString("time");
				int partner = rs.getInt("partner");
				String memo = rs.getString("memo");
				member = new MovieBean(0,id,name,age,genre,time,partner,memo); 
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
		return member;		
	}
	
	public int updateData(MovieBean bean){
		PreparedStatement pstmt=null;

		String sql = "update movie set  name=?, age=?, genre=?, time=?, partner=?, memo=? where num=?";
		int cnt = -1;

		try{
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, bean.getName());
			pstmt.setInt(2, bean.getAge());
			pstmt.setString(3, bean.getGenre());
			pstmt.setString(4, bean.getTime());
			pstmt.setInt(5,bean.getPartner());
			pstmt.setString(6, bean.getMemo());
			pstmt.setInt(7, bean.getNum());
			
			cnt = pstmt.executeUpdate();
			
		}catch(Exception e){
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
	}

	public int deleteData(int num){
		PreparedStatement pstmt = null;
		String sql = "delete from movie where num=?";
		int cnt=-1;
		try{
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
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
	
	public int deleteCheckData(String[] check){ 
		PreparedStatement pstmt = null;
		System.out.println("체크된 개수:"+check.length);
		
		for(int i=0;i<check.length;i++){
			System.out.println(check[i]);
		}
		String sql = "delete from movie where num=?";
		for(int i=0;i<check.length-1;i++){
			sql += " or num=?";
		}
		int cnt=-1;
		try{
			pstmt = conn.prepareStatement(sql);
			for(int i=1;i<=check.length;i++){
				pstmt.setInt(i,Integer.parseInt(check[i-1]));
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
	
	
	public boolean searchId(String id){ // kim
		
		String sql = "select id from movie where id=?";
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		boolean flag = false;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			while(rs.next()) {
				flag = true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally{
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
		
		return flag; // true, false
		
	}//searchId
	

}








