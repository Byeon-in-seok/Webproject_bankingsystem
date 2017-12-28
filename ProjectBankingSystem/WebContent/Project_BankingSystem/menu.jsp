<%@ page contentType = "text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("현재시간:HH시mm분ss초");
	String today = formatter.format(new java.util.Date());
%>
<style>
body {
	text-align: center;
}
table {
   width: 850px;
   height: 200px;
   margin-left: auto;
   margin-right: auto;
}
  
table.type11 {
    border-collapse: separate;
    border-spacing: 10px;
    text-align: center;
    line-height: 7;
}
table.type11 th {
    width: 155px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #ce4869 ;
}
table.type11 td {
    width: 155px;
    padding: 10px;
    vertical-align: top;
    border-bottom: 1px solid #ccc;
    background: #eee;
}

#q:link    {color:blue;}
#q:visited {color:blue;}
#p:link    {color:red;}
#p:visited {color:red;}
</style>
<body>
<div>
<img src = "donga.jpg" width = "100px" height = "100px" alt = "은행로고"/> <span style = "font-size:30pt">동아대은행</span> <p>
<%if(id == null) {%>
	<strong><a href = "login.jsp" id = "q">로그인</a></strong>을 하시면 서비스를 이용하실 수 있습니다. <p>
	<strong><a href = "member.html" id = "p">회원가입</a></strong>
<%}else {%>
<strong style = "color:blue"><%=id%></strong>님 반갑습니다<p>
<table class = "type11">
<tr>
<td><a href = "changemember.jsp">회원정보변경</a> <p></td>
<td><a href = "money_details.jsp">잔액조회</a><p></td>
<td><a href = "deposit.jsp">입금</a><p></td>
<td><a href = "withdrawal.jsp">출금</a><p></td>
</tr>
<tr>
<td><a href = "accounttransfer.jsp">계좌이체</a><p></td>
<td><a href = "balance_inquiry.jsp">거래내역조회</a> <p></td>
<td><a href = "logout.jsp">로그아웃</a><p></td>
<%if(id.equals("manager")) {%>
<td><a href = "admin_view_data.jsp">관리자용전체데이터조회</a> <p></td>
<%}else {%>
<td><%=today %></td>
<%}} %>
</tr>
</table>
</div>
</body>
