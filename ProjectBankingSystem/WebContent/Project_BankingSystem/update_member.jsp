<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
 request.setCharacterEncoding("UTF-8");
 String id = (String)session.getAttribute("id");
 String pw = request.getParameter("pw");
 String name = request.getParameter("name");
 int age = Integer.parseInt(request.getParameter("age"));
 long account = Long.parseLong(request.getParameter("account"));

 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection cc = DriverManager.getConnection
			   ("jdbc:mysql://localhost:3306/bankingsystem","root","mysql");
	 PreparedStatement pp = cc.prepareStatement
		     ("update member_ set pw = ?,name = ?,age=?,account=? where id = ? ");
	 pp.setString(5,id);
	 pp.setString(1,pw);
	 pp.setString(2,name);
	 pp.setInt(3,age);
	 pp.setLong(4,account);
	 pp.executeUpdate();
   %>
   <script>
    alert("회원 정보가 변경되었습니다.");
    location.href="menu.jsp";
   </script>
   <%
 }catch(SQLException ex){
  	 out.print("회원 정보 변경중 문제 발생 " + ex.getMessage());
  	 
   }
   %>