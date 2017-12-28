<%@ page contentType = "text/html;charset=UTF-8" %>
<meta charset="UTF-8">
<html>
<style>
body{font-family:HY신명조}
table {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
  margin : 20px 10px;
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
#afar {
	padding-right:0.5em;
}
#bfar {
	padding-right:29em;
}
</style>
<body>
<form method="post" action= "member.jsp" >
<table border=1>
 <tr>
  <th>ID</th> <td> <input type="text" name="id"/></td>
 </tr>
 <tr>
  <th>PW</th> <td><input type="password" name="pw"/></td>
 </tr>
 <tr> 
  <th>이름 </th> <td><input type="text" name="name"/></td>
 </tr>
 <tr>
  <th>나이</th> <td><input type="text" name="age"/></td>
 </tr>
 <tr>
  <th>계좌번호</th> <td><input type="text" name="account"/></td>
 <tr>
</table> <span id = "afar"></span>
<input type="submit" value="회원가입"/><span id = "bfar"></span><a href="menu.jsp">변경</a>
</form>
</body>
</html>