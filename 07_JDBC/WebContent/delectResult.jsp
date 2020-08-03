<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String id = request.getParameter("id");
	String passwd = request.getParameter("passwd");
	String name = request.getParameter("name");
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;
	try {
		String driver = "oracle.jdbc.driver.OracleDriver";
		String url = "jdbc:oracle:thin:@localhost:1521:orcl";
		String id2 = "jspid";
		String pw = "jsppw";

		Class.forName(driver);

		conn = DriverManager.getConnection(url, id2, pw);

		String sql = "select id, passwd from member where id=?";
		//분석
		ps = conn.prepareStatement(sql);
		ps.setString(1, id);
		
		//실행
		rs = ps.executeQuery();
		if (rs.next()) { // 여기로 들어왔다는것은 아이디가 일치하는게 있다.
			String dbid = rs.getString("id");//아이디칼럼가꼬와서
			String dbpw = rs.getString("passwd");
			if (id.equals(dbid) && passwd.equals(dbpw)) {//삭제폼에서가꼬온아이디랑 db에서 가꼬온아이디가 같다면..
				sql = "delete from member where id=? and passwd=?";
				ps = conn.prepareStatement(sql);
				ps.setString(1, id);
				ps.setString(2, passwd);

				ps.executeUpdate();

				out.print("삭제성공!");
			} else {
				%>
				<!-- 자바스크립스 시작  -->
				<script type="text/javascript">
				alert("패스워드가 다릅니다.");
				</script>
				<%
			}
		} else {
			out.print("아이디가 없습니다.");
		}
		//분석

	} catch (Exception e) {

	} finally {
		if (ps != null) {
			try {
				ps.close();
			} catch (SQLException e) {

			}
		}

		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException e) {

			}
		}
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException e) {

			}
		}
	}
%>