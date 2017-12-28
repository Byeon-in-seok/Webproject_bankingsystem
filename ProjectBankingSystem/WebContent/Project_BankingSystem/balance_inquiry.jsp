<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<style>
	table {
   		margin-left: auto;
   		margin-right: auto;
	}
	#a1 {
		padding-right:56em;
	}
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
<table border="1">
<tr><th>구분</th><th>사용자 ID</th><th>출금계좌</th><th>입금계좌</th><th>금액</th><th>거래일시</th></tr>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String account = (String)session.getAttribute("account");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cc = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem","root","mysql");
		PreparedStatement pp = cc.prepareStatement("select * from transaction_ where send = ? or receive = ? order by ilsi");
		pp.setString(1,account);
		pp.setString(2,account);
		ResultSet rr = pp.executeQuery();
		while(rr.next()){%>
			<tr>
			<th><%=rr.getString("division")%></th>
			<td><%=rr.getString("id")%></td>
			<td><%=rr.getLong("send")%></td>
			<td><%=rr.getLong("receive")%></td>
			<td><%=rr.getLong("money")%></td>
			<td><%=rr.getString("ilsi")%></td>
			</tr>
		<%}
 	}
	catch(SQLException ex){
  		out.print("오류발생. <p> 오류메시지: " + ex.getMessage());
 	}%>
 </table>
  <p><span id = "a1"></span><a href="menu.jsp">메뉴로 돌아가기</a>
 <!-- 거래내역 조회 -->