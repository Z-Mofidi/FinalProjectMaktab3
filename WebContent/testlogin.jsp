<%@page import="jdk.nashorn.internal.ir.RuntimeNode.Request"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*"%>
<%@ page import="ChatClasses.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		EntityManager entityManager = new EntityManager();
		ArrayList<User> users = new ArrayList<User>();
		users = entityManager.listUsers();

		ArrayList<String> freeUsers = new ArrayList<String>();
		ArrayList<ChatGroup> chatGroupArraye = new ArrayList<ChatGroup>();

		String username = request.getParameter("inputusername");
		String password = request.getParameter("inputPassword3");
		String messag = "";
		boolean usernameExist = false;

		for (User u : users) {
			if (u.getUsername().equals(username) == true) {
				usernameExist = true;
				if (u.getPassword().equals(password) == true) {
					HttpSession sesssion = request.getSession();
					sesssion.setAttribute("id", u.getUsername());
					entityManager.updateFreeUser(u.getUsername(), 1);

					messag = "loggin successful";
	%>
	<jsp:forward page="ListUserChatReq.jsp" />
	<%
		break;

				} else {
					messag = "password is not correct";
					break;
				}
			}
		}

		if (usernameExist == false) {
			messag = "username not found";
		}
		response.getWriter().append(messag);
	%>


</body>
</html>