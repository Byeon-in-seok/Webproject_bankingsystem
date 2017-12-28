<%@ page contentType = "text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	if(id == null) {
%>
	<script>
		alert("잘못된 접근을 하셨습니다. 다시 로그인 해주세요");
		location.href = "menu.jsp";
	</script>
<%	}
    Class.forName("com.mysql.jdbc.Driver");
	Connection cc = DriverManager.getConnection
	("jdbc:mysql://localhost:3306/bankingsystem", "root", "mysql");
	PreparedStatement pp = cc.prepareStatement("select wallet from member_ where id = ?");
	pp.setString(1, id);
	ResultSet rr = pp.executeQuery();
%>
	<body>
		<strong>실시간 계좌이체</strong><br>
		실시간 송금 서비스를 이용하실 수 있습니다.<p>
		<form method = "post" action = "accounttransfercheck.jsp">
		<fieldset>
			송금할 계좌: <input type = "text" name = "account"/>  -없이 숫자만 적어주세요<p>
			보내실 금액: <input type = "text" name = "sendmoney"/> <p>
			현재잔액: 
			<%if(rr.next()) {
				out.print(rr.getInt("wallet"));
			} %>&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;<input type = "submit" value = "보내기"/>
		</fieldset>
		</form>
	</body>
	