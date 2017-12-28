<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<style>
body{font-family:HY신명조;
	 text-align:center;
	}
table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
    margin : 20px 10px;
    margin-left: auto;
    margin-right: auto;
}
}
 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #153d73;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;

}
td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
</style>
<%
 request.setCharacterEncoding("UTF-8");
 String id = (String)session.getAttribute("id");
 try{
	 Class.forName("com.mysql.jdbc.Driver");
	 Connection cc = DriverManager.getConnection
			   ("jdbc:mysql://localhost:3306/bankingsystem","root","mysql");
	 PreparedStatement pp = cc.prepareStatement
			     ("select * from member_ where id = ?");
     pp.setString(1,id);
     ResultSet rr = pp.executeQuery();
     if(rr.next()){
   %>
   <h3><%=id %>님의 회원정보</h3>
   <form method="post" action="update_member.jsp"><p>
   <table>
   <tr>
    <th>PW</th> <td><input type="password" name="pw" value="<%=rr.getString("pw")%>"></td>
   </tr>
   <tr>
      <th>이름</th> <td><input type="text" name="name" value="<%=rr.getString("name") %>"></td>
    </tr>
   <tr> 
     <th>나이</th> <td><input type="text" name="age" value="<%=rr.getString("age") %>"></td>
   </tr>
   <tr>
     <th>계좌번호</th> <td><input type="text" name="account" value="<%=rr.getString("account") %>"></td>
     </tr>
   </table>
   <input type="submit" value="회원 정보 변경">
   <a href="menu.jsp">메뉴로 가기</a>
   </form>
   
 <% } else{session.invalidate();%>
 <script>
   alert("회원 정보 읽을 수 없음. 다시 시도(로그인화면으로 이동)");
   location.href="login.jsp";
 </script>
<% }
     }catch(SQLException ex){
    	 out.print("죄송합니다. 회원님 정보 확인중 문제 발생 " + ex.getMessage());
    	 
     }
     %> 