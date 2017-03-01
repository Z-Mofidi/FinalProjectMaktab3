<%@ page language="java" contentType="text/html; charset=windows-1256"
	pageEncoding="windows-1256"%>
<%@ page import="java.util.*"%>
<%@ page import="ChatClasses.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>
	<%
		EntityManager entityManager = new EntityManager();
		if (request.getParameter("formCheck").equals("exitChatPage") == true) {
			entityManager.upadateUserGroupStatus(String.valueOf(session.getAttribute("id")),
					String.valueOf(session.getAttribute("chatGroupNameSession")), 0);
	%>
	<jsp:forward page="ListUserChatReq.jsp" />
	<%
		} else if (request.getParameter("formCheck").equals("logout") == true) {
			entityManager.updateFreeUser(String.valueOf(session.getAttribute("id")), 0);
	%>
	<jsp:forward page="loginToChat.html" />
	<%
		}
	%>
</body>
</html>