<%@ page contentType = "text/html;charset=UTF-8" %>
<%@ page import = "java.sql.*" %>
<%
request.setCharacterEncoding("UTF-8");
   String id = request.getParameter("id");
   String pw = request.getParameter("pw");
   String name = request.getParameter("name");
   int age = Integer.parseInt(request.getParameter("age"));
   long account = Long.parseLong(request.getParameter("account"));
   try{
	   Class.forName("com.mysql.jdbc.Driver");
	   Connection cc = DriverManager.getConnection
			   ("jdbc:mysql://localhost:3306/bankingsystem","root","mysql");
	   PreparedStatement pp1 = cc.prepareStatement("select * from member_ where id = ?");
	   pp1.setString(1,id);
	   ResultSet rr = pp1.executeQuery();
	   if(rr.next()) {
%>
		<script>
			alert("아이디가 존재합니다. 다른 아이디를 사용해주세요");
			location.href = "member2.jsp";
		</script>
<% 
	   }
	   else {
		   PreparedStatement pp = cc.prepareStatement("insert into member_ values(?,?,?,?,?,0)");
		   pp.setString(1,id);
		   pp.setString(2,pw);
		   pp.setString(3,name);
		   pp.setInt(4,age);
		   pp.setLong(5,account);
		   pp.executeUpdate();
	   }
   
   %>
   <script>
   alert("가입되었습니다 축하드립니다.");
   location.href="login.jsp";
   </script>
   
   <%
   }catch (SQLException ex){
      out.println("회원님,죄송하지만 오류가 발생했습니다. : " +ex.getMessage());
      }
      %>