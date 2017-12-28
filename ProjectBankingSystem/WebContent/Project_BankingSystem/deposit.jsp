<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	 try{
		  Class.forName("com.mysql.jdbc.Driver");
		  Connection cc = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem","root","mysql");
		  PreparedStatement pp = cc.prepareStatement("select * from member_ where id = ?");
		  pp.setString(1,id);
		  ResultSet rr = pp.executeQuery();
		  rr.next();
		  String name = rr.getString("name");
		  String send = rr.getString("account");
%>
<style>
	#IDPW { color:#0080FF; font-size:14pt;}
	#PRINT { color:#0080FF; font-size:12pt;}
	table { border: 1px solid #bcbcbc; width: 280px; height: 200px;
   			margin-left: auto;
   			margin-right: auto;
			}
</style>

<body>
<form method="post" action="deposit_save.jsp">
	<table border = "1">
		<tr>
			<th>
			<p><span id = "IDPW"><%=name%></span> 님, 입금거래 창입니다.
			</th>
		</tr>
		<tr>
			<th>
			<p>ID : <span id = "PRINT"><%=id%><br></span>
			<p>계좌번호 : <span id = "PRINT"><%=rr.getString("account")%><br></span>
			</th>
		</tr>
		<tr>
			<td>
			<p>
			<strong>&emsp;금액 &emsp;<input type = "text" name = "sendmoney"/>원&emsp;&emsp;</strong><p>
			&emsp;&emsp; &emsp; &emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "submit" value = "입금하기"/>&emsp;<p>
			</td>
		</tr>
	</table>
	<input type = "hidden" name = "name" value="<%=name%>"/>
	<input type = "hidden" name = "send" value="<%=send%>"/>
</form>
</body>
<%}
 catch(SQLException ex){
  out.print("오류발생. <p> 오류메시지: " + ex.getMessage());
 }%>
<!-- 구분 : 입금/출금(x)   입금자 : id  send : 보내는이    receive : 은행   money : 입금액-->