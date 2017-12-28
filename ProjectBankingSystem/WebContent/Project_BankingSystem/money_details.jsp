<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<style>
#asd { text-align: center;
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
<table border = "1">
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");

	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cc = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem","root","mysql");
		PreparedStatement pp = cc.prepareStatement("select * from member_ where id = ?");
		pp.setString(1,id);
		ResultSet rr = pp.executeQuery();
		rr.next();%>
			<tr><th><%=rr.getString("name")%> 님의 잔액은</th></tr>
			<tr><th><%=rr.getLong("wallet")%> 입니다.</th></tr>
		<%
 	}
	catch(SQLException ex){
  		out.print("오류발생. <p> 오류메시지: " + ex.getMessage());
 	}%>
 </table>
 <p><span id = "a1"></span><a href="menu.jsp">메뉴로 돌아가기</a>
<!-- 잔액조회 -->