<%@ page contentType = "text/html;charset=UTF-8"%>
<%@ page import = "java.sql.*"%>
<%
	request.setCharacterEncoding("UTF-8");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	Integer notlogincount = (Integer)session.getAttribute("notlogincount");
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		Connection cc = DriverManager.getConnection
				("jdbc:mysql://localhost:3306/bankingsystem", "root", "mysql");
		PreparedStatement pp = cc.prepareStatement("select * from member_ where id = ? and pw = ?");
		pp.setString(1, id);
		pp.setString(2, pw);
		ResultSet rr = pp.executeQuery();
		if(rr.next()) {
			session.removeAttribute("notlogin");
			session.setAttribute("notlogincount", 0);
			session.setAttribute("id", id);
			session.setAttribute("account", rr.getString("account"));
			session.setMaxInactiveInterval(60*10);
			response.sendRedirect("menu.jsp");
		}
		else {
			if(notlogincount == null) {
				notlogincount = 1;
			}
			else {
				notlogincount += 1;
			}
		session.setAttribute("notlogincount", notlogincount);
		session.setAttribute("notlogin", "notlogin");
		response.sendRedirect("login.jsp");
		}
	}
	catch(SQLException ex) {
		out.print(ex.getMessage());
	}
%>