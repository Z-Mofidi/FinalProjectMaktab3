<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" %>
	<%@ page import="java.util.*" %>
	<%@ page import="ChatClasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		ArrayList<User> users = new ArrayList<User>();
		users.add(new User("zeinab", "zeinab"));
		users.add(new User("zahra", "zahra"));
		users.add(new User("narges", "narges"));
		users.add(new User("ali", "ali"));
		users.add(new User("goli", "goli"));

		String username = request.getParameter("inputusername");
		String password = request.getParameter("inputpassword");
		String messag = "";

		for (User u : users) {
			if(u.username.matches(username)){
				if(u.password.matches(password)){
					HttpSession sesssion = request.getSession();
					sesssion.setAttribute("id", username);
					messag = "loggin successful";
					break;
				}else{
					messag = "password is not correct";
					break;
				}
			}
		}
				messag = "username not found";
			response.getWriter().append(messag);
	%>

</body>
</html>