<%@ page contentType = "text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	long account = 0L;
	int sendmoney = 0;
	try{
		if(request.getParameter("account") != null && request.getParameter("account") != "") {
			account = Long.parseLong(request.getParameter("account"));
		}
		if(request.getParameter("sendmoney") != null && request.getParameter("sendmoney") != "") {
			sendmoney = Integer.parseInt(request.getParameter("sendmoney"));
		}
	}catch(Exception e) {
%>
	<script>
		alert("잘못 입력 하셨습니다.");
		location.href = "accounttransfer.jsp"
	</script>	
<%
	}
	if(account <= 0 || sendmoney <= 0) {
%>
	<script>
		alert("잘못 입력 하셨습니다.");
		location.href = "accounttransfer.jsp"
	</script>	
<% }
	if(id == null) {
%>
	<script>
		alert("잘못된 접근을 하셨습니다. 다시 로그인 해주세요");
		location.href = "menu.jsp";
	</script>
<%}	else {
	  try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cc = DriverManager.getConnection
		("jdbc:mysql://localhost:3306/bankingsystem", "root", "mysql");
		PreparedStatement pp = cc.prepareStatement("select account, wallet from member_ where id = ?");
		pp.setString(1, id);
		ResultSet rr = pp.executeQuery();	
		if(rr.next()) {
			if(rr.getInt("wallet") - sendmoney > 0) {
				PreparedStatement qq = cc.prepareStatement("Update member_ set wallet = ? where account = ?");
				PreparedStatement pp2 = cc.prepareStatement("select wallet from member_ where account = ?");
				pp2.setLong(1, account);
				ResultSet rr2 = pp2.executeQuery();
				if(!rr2.next() || account == rr.getLong("account")) {
%>
					<script>
					alert("계좌번호를 확인해주세요.");
					location.href = "accounttransfer.jsp"
					</script>	
<%
				}
				else {
				qq.setInt(1,(rr2.getInt("wallet") + sendmoney));  // 받는사람 돈 올라감
				qq.setLong(2, account);
				qq.executeUpdate();
				
				qq.setInt(1,(rr.getInt("wallet") - sendmoney));  // 보낸사람 돈 까짐
				qq.setLong(2, rr.getLong("account"));
				qq.executeUpdate();
				
				PreparedStatement gg = cc.prepareStatement("insert into transaction_ values('계좌이체',?,?,?,?, sysdate())");
				gg.setString(1, id);
				gg.setLong(2, rr.getLong("account"));
				gg.setLong(3, account);
				gg.setInt(4, sendmoney);
				gg.executeUpdate();
				out.print("정상처리 되었습니다. 이용해주셔서 감사합니다." + "<p>");
%>
				<a href = "menu.jsp">메뉴로 돌아가기</a> <br>
				<a href = "accounttransfer.jsp">계좌이체로 돌아가기</a> <br>
<% 				} 
			}
			else {
%>			<script>
				alert("통장에 잔액이 부족합니다. 잔액을 확인해주세요.");
				location.href = "accounttransfer.jsp";
			</script>
		<% }
		}
	}catch(SQLException ex) {
		out.print("서버 송신중 문제가 발생했습니다. 계속 이런 문제가 발생하시면 은행 본사에 연락을 주세요." + ex.getMessage());
	}
}
%>