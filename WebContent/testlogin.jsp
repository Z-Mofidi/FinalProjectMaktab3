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
		
Map<String,String> userpassMap =  new HashMap<String,String>();
		
		userpassMap.put("zeinab", "zeinab");
		userpassMap.put("zahra", "zahra");
		userpassMap.put("narges", "narges");
		userpassMap.put("ali", "ali");
		userpassMap.put("goli", "goli");
		
		ArrayList<String> freeUsers = new ArrayList<String>();
		ArrayList<ChatGroup> chatGroupArraye = new ArrayList<ChatGroup>();

		String username = request.getParameter("inputusername");
		String password = request.getParameter("inputPassword3");
		String messag = "";

		if(userpassMap.containsKey(username)==true){
			if(password.equals(userpassMap.get(username))==true){
				HttpSession sesssion = request.getSession();
				sesssion.setAttribute("id", username);
				messag = "loggin successful";
				
				freeUsers.add(username);
				session.setAttribute("id", freeUsers.get(0));
			    session.setAttribute("freeUsersSesssion", freeUsers);
		     	 session.setAttribute("chatGroupSession", chatGroupArraye);
				%>
				<jsp:forward page = "ListUserChatReq.jsp" />
				<% 
				//break;
				//request.getSession().setAttribute("isLoggedIn",true);
			}else{
				messag = "password is not correct";
			}
		}else{
			messag = "username not found";
		}

		response.getWriter().append(messag);
	%>
	

</body>
</html>