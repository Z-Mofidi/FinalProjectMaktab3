<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
      <%@ page import="java.util.*" %>
	<%@ page import="ChatClasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>
<%
HttpSession sesssion = request.getSession();
//ArrayList<HttpSession> sesssion = new ArrayList<HttpSession>(); 
    ArrayList<String> freeUsers = new ArrayList<String>();
    ArrayList<ChatGroup> chatGroupArraye = new ArrayList<ChatGroup>();
    freeUsers.add(0, "zeinab");
    freeUsers.add(1, "zahra");
    freeUsers.add(2, "narges");
    freeUsers.add(3, "ali");
    freeUsers.add(4, "goli");
    Map<String,Boolean> usersGroupMap =  new HashMap<String,Boolean>();
	//Map<String,Integer> usersGroup =  new HashMap<>();
	usersGroupMap.put("goli", false);
	usersGroupMap.put("zeinab", false);
	
    ChatGroup newChatGroup = new ChatGroup("aa",usersGroupMap);
    chatGroupArraye.add(0,newChatGroup);
    
    session.setAttribute("id", freeUsers.get(0));
   session.setAttribute("freeUsersSesssion", freeUsers);
   session.setAttribute("chatGroupSession", chatGroupArraye);
   if(chatGroupArraye.get(0).getUserGroup().containsKey(session.getAttribute("id"))){
    %>
    <%=chatGroupArraye.get(0).getName() %>
 <%}else{ %>
 <p>df</p>
 <%} %>
<form action='ListUserChatReq.jsp' method='post'>
<input name='username'>
<input name='pass' type='password'>
<input type='submit'>
</form>
<p>kkdsfdfkdjkfjskjfkdjfkjskkjdskfjkdjfkdjkfjskjfkjfkjfkdsjf</p>
</body>
</html>


