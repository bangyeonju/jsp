<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
//HttpServlet request = new HttpServletRequest();
request.setCharacterEncoding("UTF-8");%>
Ex01_uploadForm.jsp -> Ex01_uploadProc.jsp

<%
String name = request.getParameter("name"); //null
String filename= request.getParameter("filename");//null
System.out.println("name="+name);
System.out.println("filename="+filename);

int maxSize=1024*1024*5;
String saveFolder= "img";
String encType="UTF-8";




//ServletConfig config = new ServletConfig();
//경로를 알려주는 메소드!
ServletContext sc = config.getServletContext();
String configFolder = sc.getRealPath("img"); //img폴더 접근
System.out.println("configFolder="+ configFolder);

String requestFolder = request.getContextPath() +"/"+saveFolder; //내가 작업중인 정보
System.out.println("requestFolder="+ requestFolder);

MultipartRequest multi= null;
//form에서 넘겨옴 정보					//순서!
multi=new MultipartRequest(request,configFolder,maxSize,encType,
							new DefaultFileRenamePolicy()//똑같은 사진 추가시 뒤에 숫자가 붙는다.
							);

Enumeration<String> files= multi.getFileNames();
String file= (String)files.nextElement();
String fn = multi.getFilesystemName(file);
multi.getFilesystemName(file);
System.out.print("file:"+file);
System.out.print("fn:"+fn);

//String org = multi.getOriginalFileName("filname");
String org = multi.getOriginalFileName(file);
System.out.print("org:"+org);
String fullpath = requestFolder +"/" +fn;
					
%>
이름:<%=multi.getParameter("name")%>
<br>
<img src="<%=fullpath %>" width="300" height="220"/>

  
















<!-- 
C:\jsp\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\18_UPload
 -->