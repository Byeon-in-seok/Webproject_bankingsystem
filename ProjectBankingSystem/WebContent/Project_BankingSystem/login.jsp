<%@ page contentType = "text/html;charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String notlogin = (String)session.getAttribute("notlogin");
	Integer notlogincount = (Integer)session.getAttribute("notlogincount");
%>

<style>
	#IDPW { color:#0080FF; font-size:14pt;}
	table { border: 1px solid #bcbcbc;
  		 	margin-left: auto;
   			margin-right: auto;
			width: 280px;
			height: 200px;
		}
	button {color:black;}
</style>

<body>
	<%if(notlogincount != null) {
		if(notlogincount > 10) {
			session.setMaxInactiveInterval(60*10); %>
			<script>
			alert("로그인이 10분간 금지됩니다.");
			location("menu.jsp");
		</script>
		<% }%>
	<%} %>
	<%if(id != null) {%>
		<table border = "1">
		<tr>
			<th>
			<p><span id = "IDPW">ID/비밀번호</span> 로그인 <p>
			</th>
		</tr>
		<tr>
			<td>
			<p>
			<strong><%=id%></strong>님이 로그인되어 있습니다. <p>
			&emsp;<a href = "menu.jsp">메인메뉴</a>&emsp;&emsp;&emsp;<a href = "logout.jsp">로그아웃</a> <p>
			</td>
		</tr>
		</table>
	<%} %>
	<%if(id == null){ %>
	<form method = "post" action = "loginidcheck.jsp">
		<table border = "1">
		<tr>
			<th>
			<p><span id = "IDPW">ID/비밀번호</span> 로그인 <p>
			</th>
		</tr>
		<tr>
			<td>
			<p>
			<strong>&emsp;ID &emsp;&emsp;&emsp;<input type = "text" name = "id"/>&emsp;&emsp;</strong><p>
			<strong>&emsp;비밀번호 <input type = "password" name = "pw"/>&emsp;&emsp;</strong><p>
			&emsp;<a href="member2.jsp">회원가입</a>&emsp; &emsp; &emsp; &emsp; &emsp;<input type = "submit" value = "로그인"/>&emsp;<p>
			<%if(notlogin != null){ %>
				<font color = "red">아이디 또는 비밀번호를 다시 확인하세요.<br>등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.</font><p>
			<%	
				if(notlogincount != null) { %>
					<%=notlogincount%>/10회 남았습니다. 로그인이 금지됩니다.
			<% }
			} %>
			</td>
		</tr>
		</table>
	</form>
	<%} %>
</body>