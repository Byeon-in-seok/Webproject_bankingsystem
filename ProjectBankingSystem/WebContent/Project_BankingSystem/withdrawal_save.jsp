<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
	request.setCharacterEncoding("UTF-8");
	String id = (String)session.getAttribute("id");
	String name = request.getParameter("name");
	long money = Long.parseLong(request.getParameter("receivemoney"));
	long wallet = Long.parseLong(request.getParameter("wallet"));
	long send = Long.parseLong(request.getParameter("send"));
	long membercount = 1111222233334444L;
if(money < 0){%>
	<script>
	alert("1원 이상의 금액을 다시 입력해주세요.");
	location.href = "withdrawal.jsp";
	</script>
	<%}
else if(wallet < money){%>
	<script>
	alert("잔액보다 큰 금액은 출금할 수 없습니다.");
	location.href = "withdrawal.jsp";
	</script><%
}
else{
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cc = DriverManager.getConnection("jdbc:mysql://localhost:3306/bankingsystem","root","mysql");
		PreparedStatement pp = cc.prepareStatement("update member_ set wallet = wallet - ? where id = ?");
		pp.setLong(1,money);
		pp.setString(2,id);
		pp.executeUpdate();
		
		PreparedStatement gg = cc.prepareStatement("insert into transaction_ values('출금',?,?,?,?, sysdate())");
		gg.setString(1,id);
		gg.setLong(2,membercount);
		gg.setLong(3,send);
		gg.setLong(4,money);
		gg.executeUpdate();
		%><script>
		alert("출금완료. 거래 감사합니다.");
		location.href = "menu.jsp";
		</script><%
 }
	catch(SQLException ex){
  		out.print("오류발생. <p> 오류메시지: " + ex.getMessage());
 	}
}%>
 <!-- 
 1.멤버 wallet = wallet - ?
 2. 트랜잭션 기록 업데이트
 3. 스크립트 팝업 알림창
 구분 : 입금   입금자 : id  send : 보내는이    receive : 은행   money : 입금액-->