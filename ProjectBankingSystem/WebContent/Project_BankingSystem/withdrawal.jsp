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
<form method="post" action="withdrawal_save.jsp">
	<table border = "1">
		<tr>
			<th>
			<p><span id = "IDPW"><%=rr.getString("name")%></span> 님, 출금거래 창입니다.
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
			<strong>&emsp;금액 &emsp;<input type = "text" name = "receivemoney"/>원&emsp;&emsp;</strong><p>
			&emsp;&emsp; &emsp; &emsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "submit" value = "출금하기"/>&emsp;<p>
			</td>
		</tr>
	</table>
	<input type = "hidden" name = "name" value="<%=rr.getString("name")%>"/>
	<input type = "hidden" name = "send" value="<%=rr.getString("account")%>"/>
	<input type = "hidden" name = "wallet" value="<%=rr.getString("wallet")%>"/>
</form>
</body>
<%}
 catch(SQLException ex){
  out.print("오류발생. <p> 오류메시지: " + ex.getMessage());
 }%>
 
<!-- 구분 : 출금   출금자 : id  send : 보내는이(은행계좌)    receive : 내계좌   money : 출금액-->