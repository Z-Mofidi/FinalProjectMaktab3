<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ page import="java.util.*" %>
	<%@ page import="ChatClasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script> <script> $(document).ready(function() { var reloadData = 0; // store timer // load data on page load, which sets timeout to reload again loadData(); }); function loadData() { $('#load_me').load('samp.jsp', function() { if (reloadData != 0) window.clearTimeout(reloadData); reloadData = window.setTimeout(loadData, 10000) }).fadeIn("slow"); } </script>
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
    ArrayList<ChatGroup> chatGroupArraye = (ArrayList<ChatGroup>)session.getAttribute("chatGroupSession");
   //session.setAttribute("freeUsersSesssion", freeUsers);
 //  freeUsers = (ArrayList<String>)session.getAttribute("freeUsersSesssion");
    %>
    <div id="load_me">
<table><tr >
<td border="1" height="30">

<%
if (freeUsers.size() == 0) { %>
<p>freeUsers is empty</p>

<% } else {
	boolean checkboxExit = false;
%>
	
	<p>you are <%=session.getAttribute("id")%></p>
	<form action="ChatPage.jsp" method="get">
	<% for(int index = 0; index < freeUsers.size(); index++ ){
	if(freeUsers.get(index).equals(session.getAttribute("id"))==false){
		checkboxExit = true; %>
	
	<input type="checkbox" name="freeUsersCheckbox" value="<%=freeUsers.get(index) %>"> <%=freeUsers.get(index) %>
	<br>
	
	<%	} } 
	if(checkboxExit == false){%>
		<input type="hidden" name="freeUsersCheckbox" value="checkboxExitFalse">
	<%}%>
	
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
<p>ChatGroup request for you no exit </p>
<%} else {%>
	

<form action="ChatPage.jsp" method="get">
<% 
boolean groupExit = false;
for(int index = 0; index < chatGroupArraye.size(); index++ ){
if(chatGroupArraye.get(index).getUserGroup().containsKey(session.getAttribute("id"))){
	if(chatGroupArraye.get(index).getUserGroup().get(session.getAttribute("id")) == false){
		groupExit = true;
	%>
		
		<input type="radio" name="chatGroupRequest" value="<%=chatGroupArraye.get(index).getName() %>" > <%=chatGroupArraye.get(index).getName() %><br>	
	<% }
}
}
if(groupExit==false){
	%>
	<p>ChatGroup request for you no exit </p>
	<%
}
%>
 <br>
  <input type='hidden' name='formCheck' value='acceptChatGroupForm'>
  <input type="submit">
</form> 
<%	} %>
</td>
</tr></table></div>

</body>
</html>						