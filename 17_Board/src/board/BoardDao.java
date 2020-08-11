package board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;

public class BoardDao {
	String driver ="oracle.jdbc.driver.OracleDriver";
	String url= "jdbc:oracle:thin:@localhost:1521:orcl";
	String userid="jspid";
	String userpw="jsppw";
	Connection conn=null;
	PreparedStatement ps =null;
	ResultSet rs= null;
	
	private static BoardDao dao;
	
	
	public static BoardDao getInstance() { //객채생성 
		if(dao==null) {
			dao=new BoardDao();
		}
		return dao;
	}
	private BoardDao() {
		System.out.println("BoardDao()");
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
			conn= DriverManager.getConnection(url,userid,userpw);
			System.out.println("객체생성성공");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("객체생성실패");
		}
	}
	
	public int getArticleCount() {
		getConnection();
		int x=0;
		String sql= "select count(*) as cnt from board";
		try {
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				x =rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) {
					rs.close();
				}
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}
			}catch (Exception e) {
			}


		}
		return x;
		
	}
	
	public ArrayList<BoardBean> getArticles(int start,int end){
		getConnection();
		ArrayList<BoardBean> lists =new ArrayList<BoardBean>();
		String sql ="select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content,ip "
	            +"from(select rownum as rank, num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content,ip "
	            +"from(select num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content,ip from board order by ref desc, re_step asc))"
	            +"where rank between ? and ?";
		
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			while(rs.next()) {
				int num =rs.getInt("num");
				String writer= rs.getString("writer");
				String email = rs.getString("email");
				String subject = rs.getString("subject");
				String passwd=rs.getString("passwd");
				Timestamp reg_date = rs.getTimestamp("reg_date");
				int readcount = rs.getInt("readcount");
				int ref = rs.getInt("ref");
				int re_step = rs.getInt("re_step");
				int re_level= rs.getInt("re_level");
				String content = rs.getString("content");
				String ip= rs.getString("ip");
				
				BoardBean bean =new BoardBean(num, writer, email, subject, passwd, reg_date, readcount, ref, re_step, re_level, content, ip);
				lists.add(bean);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return lists;
	}//getArticles
	
	public int insertArticle(BoardBean article) {
		getConnection();
		int cnt=-1;
		String sql="insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) values(board_seq.nextval,?,?,?,?,?,board_seq.currval,?,?,?,?)";
		try {
			ps=conn.prepareStatement(sql);
			ps.setString(1, article.getWriter());
			ps.setString(2, article.getEmail());
			ps.setString(3, article.getSubject());
			ps.setString(4, article.getPasswd());
			ps.setTimestamp(5,article.getReg_date());
			ps.setInt(6,0);
			ps.setInt(7, 0);
			ps.setString(8, article.getContent());
			ps.setString(9, article.getIp());
			cnt = ps.executeUpdate();
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
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return cnt;
		
	}
	
	public BoardBean getArticle(int num) {
		getConnection();
		String sql_update = "update board set readcount = readcount+1 where num=?";
		String sql= "select * from board where num=?";
		BoardBean article=null;
		try {
			ps=conn.prepareStatement(sql_update);
			ps.setInt(1, num);
			ps.executeUpdate();
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			
			rs=ps.executeQuery();
			
            while(rs.next()) {
            	
                article = new BoardBean();
                article.setNum(rs.getInt("num"));
                article.setWriter(rs.getString("writer"));
                article.setEmail(rs.getString("email"));
                article.setSubject(rs.getString("subject"));
                article.setPasswd(rs.getString("passwd"));
                article.setReg_date(rs.getTimestamp("reg_date"));
                article.setReadcount(rs.getInt("readcount"));
                article.setRef(rs.getInt("ref"));
                article.setRe_step(rs.getInt("re_step"));
                article.setRe_level(rs.getInt("re_level"));
                article.setContent(rs.getString("content"));
                article.setIp(rs.getString("ip"));
                
               
             }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		finally {
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
		return article;
		
		
	}
	
	public int deleteArticle(int num,String passwd) {
		getConnection();
		int cnt = -1;
		String sql= "select passwd from board where num = ?";
		String sql_delete=  "delete from board where num=?";
		try {
			ps=conn.prepareStatement(sql);
			ps.setInt(1, num);
			rs =ps.executeQuery();
			if(rs.next()) {
				String dbpasswd=rs.getString("passwd");
				if(dbpasswd.equals(passwd)) {
					ps = conn.prepareStatement(sql_delete);
					ps.setInt(1, num);
					cnt = ps.executeUpdate();
					
				}else
					cnt=0;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if (conn != null) {
					conn.close();
				}
				if (ps != null) {
					ps.close();
				}
				
			} catch (Exception e2) {
			}
		}
	
				
		
		return cnt;
	}
public int replyArticle(BoardBean article) {
//	ref,re_step,re_level :부모것
//	subject,writer,passwd..:내것
		getConnection();     
		int cnt =-1;
		String sql_update="update board set re_step = re_step+1 where ref=? and re_step > ? ";
		String sql_insert="insert into board(num,writer,email,subject,passwd,reg_date,ref,re_step,re_level,content,ip) values(board_seq.nextval,?,?,?,?,?,?,?,?,?,?)";
		try {
			ps = conn.prepareStatement(sql_update);
			ps.setInt(1, article.getRef());
			ps.setInt(2, article.getRe_step());
			ps.executeUpdate();
			int ref= article.getRef();
			int re_step= article.getRe_step()+1;
			int re_level = article.getRe_level()+1;
			
			ps=conn.prepareStatement(sql_insert);
			ps.setString(1, article.getWriter());
			ps.setString(2, article.getEmail());
			ps.setString(3, article.getSubject());
			ps.setString(4, article.getPasswd());
			ps.setTimestamp(5,article.getReg_date());
			ps.setInt(6, ref);
			ps.setInt(7,re_step);
			ps.setInt(8, re_level);
			ps.setString(9, article.getContent());
			ps.setString(10, article.getIp());
			cnt = ps.executeUpdate();
			
			
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	finally {
			try {
				if(conn!=null) {
					conn.close();
				}
				if(ps!=null) {
					ps.close();
				}
			}catch (Exception e) {
				// TODO: handle exception
			}
		}
		return cnt;
		
	}
	
	
	
	
}
