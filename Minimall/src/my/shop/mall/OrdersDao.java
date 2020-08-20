package my.shop.mall;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import my.shop.ProductBean;

public class OrdersDao {
	// dbcp

	private DataSource ds;
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public OrdersDao() {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	public int insertOrder(int no ,Vector<ProductBean> cv) {
		String sql="insert into orders(orderId,memno,pnum,qty,amount) values(orderseq.nextval,?,?,?,?)";
		int cnt = -1;
		try {
			for(int i=0;i<cv.size();i++) {
				ps=conn.prepareStatement(sql);
				ps.setInt(1, no);
				ps.setInt(2, cv.get(i).getPnum());
				ps.setInt(3, cv.get(i).getPqty());
				ps.setInt(4, cv.get(i).getTotalPrice());
				cnt =+ ps.executeUpdate();
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null) {
					ps.close();
				}
			/*	if(conn!=null) {
					conn.close();
				}*/
			}
			catch (Exception e) {
			}
		}
		return cnt;
	}// insertOrder
	
	public Vector<OrdersBean> getOrderList(String memid){
		Vector<OrdersBean> lists = new Vector<OrdersBean>();
		 String sql="select m.name mname ,m.id mid, p.pname ppname,o.qty oqty, o.amount oamount "+ 
				 "from (members m join orders o on m.no=o.memno) join product p on o.pnum= p.pnum "+
				 "where m.id=?";

		 try {
			ps=conn.prepareStatement(sql);
			ps.setString(1,memid);
			rs=ps.executeQuery();
			while(rs.next()) {
				String mname= rs.getString("mname");
				String mid= rs.getString("mid");
				String ppname= rs.getString("ppname");
				int oqty= rs.getInt("oqty");
				int oamount= rs.getInt("oamount");
				
				OrdersBean ob = new OrdersBean();
				ob.setMname(mname);
				ob.setMid(mid);
				ob.setPname(ppname);
				ob.setQty(oqty);
				ob.setAmount(oamount);
				lists.add(ob);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(ps !=null) {
					ps.close();
				}
				if(rs !=null) {
					rs.close();
				}
			} catch (Exception e) {
			}
		}
		 
		return lists;
		
	}
}
