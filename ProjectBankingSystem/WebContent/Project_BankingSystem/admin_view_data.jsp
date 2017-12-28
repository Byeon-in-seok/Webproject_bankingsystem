<%@ page contentType="text/html; charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<style>
body{font-family:HY신명조}
table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
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
			     ("select * from member_ order by id");
	 PreparedStatement pp2 = cc.prepareStatement
		     ("select * from transaction_ order by id and ilsi");
     ResultSet rr = pp.executeQuery();
     ResultSet rr2 = pp2.executeQuery();
   %>
   <h3>관리자용 데이터 조회</h3>
1.회원정보<br>
<table border="1">
 <tr>
  <th>ID</th> <th>PW</th> <th>이름</th> <th>나이</th> <th>계좌번호</th> <th>잔액</th>
 </tr>
<% while(rr.next()){ %>
 <tr>
  <td><%=rr.getString("id")%></td>
  <td><%=rr.getString("pw")%></td>
  <td><%=rr.getString("name")%></td>
  <td><%=rr.getInt("age")%></td>
  <td><%=rr.getLong("account")%></td>
  <td><%=rr.getLong("wallet")%></td>
 </tr>
 <%} %>
</table>
2.거래내역
 
 <table border="1">
 <tr>
  <th>구분</th> <th>ID</th> <th>보낸 계좌</th> <th>받은 계좌</th> <th>금액</th> <th>시간</th>
 </tr>
<% while(rr2.next()){ %>
 <tr>
  <td><%=rr2.getString("division")%></td>
  <td><%=rr2.getString("id")%></td>
  <td><%=rr2.getLong("send")%></td>
  <td><%=rr2.getLong("receive")%></td>
  <td><%=rr2.getLong("money")%></td>
  <td><%=rr2.getString("ilsi")%></td>
 </tr>
 <%} %>
</table>
<a href="menu.jsp">메뉴로 돌아가기</a>
<% 
     }catch(SQLException ex){
    	 out.print("죄송합니다. 회원님 정보 확인중 문제 발생 " + ex.getMessage());
    	 
     }
     %> 