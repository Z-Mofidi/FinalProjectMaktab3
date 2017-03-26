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
/*HttpSession sesssion = request.getSession();
 
    ArrayList<String> freeUsers = new ArrayList<String>();
  
    freeUsers.add(0, "zeinab");
    freeUsers.add(1, "zahra");
    freeUsers.add(2, "narges");
    freeUsers.add(3, "ali");
    freeUsers.add(4, "goli");*/
    ArrayList<String> freeUsers = (ArrayList<String>)session.getAttribute("freeUsersSesssion");
    ArrayList<ChatGroup> chatGroupArraye = (ArrayList<ChatGroup>)session.getAttribute("chatGroupList");
   //session.setAttribute("freeUsersSesssion", freeUsers);
 //  freeUsers = (ArrayList<String>)session.getAttribute("freeUsersSesssion");
    %>
<table><tr >
<td border="1" height="30">

<%
if (freeUsers.size() == 0) { %>
<p>freeUsers is empty</p>
<% } else {%>
	
	<form action="ChatPage.jsp" method="get">
	<% for(int index = 0; index < freeUsers.size(); index++ ){%>
	<input type="checkbox" name="freeUsersCheckbox" value="<%=freeUsers.get(index) %>"> <%=freeUsers.get(index) %>
	<br>
	
	<%	} %>
	
	<input type='text' name='chatGroupName' min='1' max='10'>
	<input type='hidden' name='formCheck' value='newChatForm'>
	<br>
	<input type="submit">
	</form> 
<%} %>
<br>
</td>
<td>
<%
if (chatGroupArraye.size() == 0) {  %>
<p>chatGroupArraye is empty</p>
<%} else {%>
	

<form action="ChatPage.jsp" method="get">
<% for(int index = 0; index < chatGroupArraye.size(); index++ ){
if(chatGroupArraye.get(index).getUserGroup().containsKey(session.getAttribute("id"))){
	if(chatGroupArraye.get(index).getUserGroup().get(session.getAttribute("id"))==0){%>
		<input type="radio" name="chatGroupRequest" value="<%=chatGroupArraye.get(index).getName() %>" > <%=chatGroupArraye.get(index).getName() %><br>	
	<% }
}
  
  } %>
 <br>
  <input type='hidden' name='formCheck' value='acceptChatGroupForm'>
  <input type="submit">
</form> 
<%	} %>
</td>
</tr></table>
</body>
</html>