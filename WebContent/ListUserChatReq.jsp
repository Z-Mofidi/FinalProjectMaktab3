<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ page import="java.util.*" %>
	<%@ page import="ChatClasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
	
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script>
<script> $(document).ready(function() { var reloadData = 0 ; 
											loadData(); });
function loadData() {
	$('#load_me').load('samp.jsp', function() { 
								if (reloadData != 0) window.clearTimeout(reloadData);
								reloadData = window.setTimeout(loadData, 10000) }).fadeIn("slow"); } 
		
</script>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>

<div id="load_me">

	<div class="row">
		<div class="col-md-12"> <br>
								<br>
								<br>
								</div>
		</div>
	<div class="row">
		<div class="col-md-4"></div>
		
		<div class="col-md-4">
		<table class="table table-bordered"><tr>
				<td>
					<label  class="control-label">Online Free Users:</label>
				</td>
				<td>
					<label  class="control-label">Chat Rooms You Invited In:</label>
				</td>
				</tr>
				<tr>
				<td>
					<%
					ArrayList<String> freeUsers = (ArrayList<String>)session.getAttribute("freeUsersSesssion");
					if (freeUsers.size() == 0) {
					%>

					<p>freeUsers is empty</p>

					<% } else {
						boolean checkboxExit = false;
					%>
	
					<p>you are <%=session.getAttribute("id")%></p>
					<form action="ChatPage.jsp" method="get">
					
					<% for(int index = 0; index < freeUsers.size(); index++ ){
					if(freeUsers.get(index).equals(session.getAttribute("id"))==false){
					checkboxExit = true; 
					%>
					<div class="checkbox">
   					 <label>
      				<input type="checkbox" name="freeUsersCheckbox" value="<%=freeUsers.get(index) %>">
      				<%=freeUsers.get(index) %>
    				</label>
 					 </div>
					<br>
					<%	} } 
					if(checkboxExit == false){%>
						<input type="hidden" name="freeUsersCheckbox" value="checkboxExitFalse">
					<%}%>
					
					<input type="text" class="form-control" id="inputChatName"
								placeholder="text" name="inputChatName">
								<br>
					<input type='hidden' name='formCheck' value='newChatForm'>
					<button type="submit" class="btn btn-default btn-block">Create New Chat</button>
					</form> 
					<%} %>
				<br>
			</td>
			<td>
				<%
				ArrayList<ChatGroup> chatGroupArraye = (ArrayList<ChatGroup>)session.getAttribute("chatGroupSession");
				if (chatGroupArraye.size() == 0) { 
				 %>
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
				
				<div class="radio">
				  <label>
				    <input type="radio" name="chatGroupRequest"  checkedvalue="<%=chatGroupArraye.get(index).getName() %>" >
				<%=chatGroupArraye.get(index).getName() %>
				  </label>
				</div>
				
				<br>	
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
			  <button type="submit" class="btn btn-default btn-block" ali > Join In Chat </button>
			</form> 
			<%} %>
			</td>
		</tr>
		</table>
		</div>
		
		<div class="col-md-4"></div>
		</div>
		
		<div class="row">
		<div class="col-md-5"></div>
		<div class="col-md-2">
		<br>
		<form action="testlogout.jsp" method="get">
						<input type='hidden' name='formCheck' value='logout'>
						<button type="submit" class="btn btn-default btn-block" > Logout </button>
			</form>
		</div>
		<div class="col-md-5"></div>
		</div>
		</div>
		
</body>
</html>						