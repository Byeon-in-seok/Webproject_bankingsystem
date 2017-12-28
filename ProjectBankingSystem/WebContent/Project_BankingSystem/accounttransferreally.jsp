<%@ page contentType = "text/html;charset=UTF-8"%>
<script>
	var answer = confirm("정말로 보내시겠습니까?");
	if(answer) {
		location.href = "accounttransfercheck.jsp";
	}
	else {
		location.href = "accounttransfer.jsp";
	}
</script>