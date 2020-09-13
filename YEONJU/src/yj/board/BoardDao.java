package yj.board;

import java.io.Writer;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class BoardDao {
	
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url ="jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jspid";
	String password= "jsppw";
	
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	
	private static BoardDao bdao;
	public static BoardDao getInstance() {
		if(bdao == null) {
			bdao = new BoardDao();
		}
			return bdao;
	
	}
	private BoardDao() {
		System.out.println("BoardDao()");

		try {
			Class.forName(driver);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	} 

	public void getConnection(){  
		try {
			conn = DriverManager.getConnection(url, user, password);
		} catch (SQLException e) {
			e.printStackTrace();
		}   
	}//getConnection
	
	
	public int insertBoard(BoardBean bb) {
		getConnection();
		int cnt =-1;
		String sql = "insert into y_board(num,writer,subject,passwd,reg_date,ref,re_step,re_level,content) " + 
				"values(board_seq.nextval,?,?,?,?,board_seq.currval,?,?,?)";
		try {
			ps = conn.prepareStatement(sql);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getPasswd());
			ps.setTimestamp(4, bb.getReg_date());
			ps.setInt(5, 0); // re_step
			ps.setInt(6, 0); // re_level
			ps.setString(7, bb.getContent());
			cnt = ps.executeUpdate();
			
			
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
		return cnt   ;
		
	}
	public ArrayList<BoardBean> getAllList(){
		getConnection();
		ArrayList<BoardBean> lists = new ArrayList<BoardBean>();
		String sql ="select * from y_board order by num";
		try {
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				lists.add(bb);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		return lists;
		
		
	}
	public int getListCount() {
		getConnection();
		String sql = "select count(*) as cnt from y_board";
		int x =0;
		try {
			ps= conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				x = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		
		return x;
	}
	
	public ArrayList<BoardBean> getArticles(int start,int end){
		getConnection();
		ArrayList<BoardBean> lists =new ArrayList<BoardBean>();
		String sql = "select num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content " ;		        
		sql += "from (select rownum as rank, num, writer, subject, passwd, reg_date, readcount, ref, re_step, re_level, content ";
		sql += "from (select num, writer,  subject, passwd, reg_date, readcount, ref, re_step, re_level, content ";
		sql += "from y_board  ";
		sql += "order by ref desc, re_step asc )) ";
		sql += "where rank between ? and ? ";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				BoardBean bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				
				lists.add(bb);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		return lists;
	}
	
	public BoardBean getContent(int num) {
		getConnection();
		String sql_update = "update y_board set readcount = readcount + 1 where num= ?";
		String sql = "select * from y_board where num=?";
		BoardBean bb = null;
		try {
			ps = conn.prepareStatement(sql_update);
			ps.setInt(1, num);
			ps.executeQuery();
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			
			if(rs.next()) {
				bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		
		return bb;
	}
	
	public int deletedate(int num, String passwd) {
		getConnection();
		int cnt = -1;
		String sql ="select passwd from y_board where num=?";
		String sql_delete ="delete from y_board where num=?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				String dbpasswd =rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					ps= conn.prepareStatement(sql_delete);
					ps.setInt(1, num);
					cnt = ps.executeUpdate();
				}
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		return cnt;
	}
	public BoardBean selectList(int num) {
		getConnection();
		BoardBean bb =null;
		String sql = "select * from y_board where num=?";
		try {
			ps = conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs = ps.executeQuery();
			if(rs.next()) {
				bb = new BoardBean();
				bb.setNum(rs.getInt("num"));
				bb.setWriter(rs.getString("writer"));
				bb.setSubject(rs.getString("subject"));
				bb.setPasswd(rs.getString("passwd"));
				bb.setReg_date(rs.getTimestamp("reg_date"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setRef(rs.getInt("ref"));
				bb.setRe_step(rs.getInt("re_step"));
				bb.setRe_level(rs.getInt("re_level"));
				bb.setContent(rs.getString("content"));
				
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		
		return bb;
	}
	
	public int updateList(BoardBean bb) {
		getConnection();
		int cnt =-1;
		String sql_update="update y_board set writer=?,subject=?,content=? where num=? and passwd=?";
		try {
			ps = conn.prepareStatement(sql_update);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getContent());
			ps.setInt(4, bb.getNum());
			ps.setString(5, bb.getPasswd());
			cnt = ps.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null)
					rs.close();
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		return cnt;
	}
	public int replyboard(BoardBean bb) {
		getConnection();
		int cnt = -1;
		String sql_update="update y_board set re_step=re_step+1 where ref =? and re_step > ?";
		String sql_insert="insert into y_board(num,writer,subject,passwd,reg_date,ref,re_step,re_level,content) "+
							" values(board_seq.nextval,?,?,?,?,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql_update);
			ps.setInt(1, bb.getRef());
			ps.setInt(2, bb.getRe_step());
			ps.executeUpdate();
			
			int ref= bb.getRef();
			int re_step = bb.getRe_step() +1;
			int re_level = bb.getRe_level() +1;
			
			ps = conn.prepareStatement(sql_insert);
			ps.setString(1, bb.getWriter());
			ps.setString(2, bb.getSubject());
			ps.setString(3, bb.getPasswd());
			ps.setTimestamp(4, bb.getReg_date());
			ps.setInt(5, ref);
			ps.setInt(6,re_step);
			ps.setInt(7, re_level);
			ps.setString(8, bb.getContent());
			 cnt = ps.executeUpdate();
			
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				
				if(ps!=null)
					ps.close();
				if(conn!=null)
					conn.close();
			}catch(Exception e) {

			}
		}
		return cnt;
	}
}
