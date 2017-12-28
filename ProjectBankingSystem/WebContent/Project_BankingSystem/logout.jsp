<%@ page contentType = "text/html;charset=UTF-8"%>
<% session.invalidate(); %>
<script>
	alert("로그아웃 되었습니다. 메인화면으로 돌아갑니다");
	location.href = "menu.jsp";
</script>