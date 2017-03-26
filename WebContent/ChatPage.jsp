<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ page import="java.util.*" %>
	<%@ page import="ChatClasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>
<div class="row">
		<div class="col-md-12"> <br>
								<br>
								<br>
								</div>
		</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">

			<form class="form-horizontal" action="ChatClasses/Login.java"
				method="POST">
				<div class="form-group">
					<label for="MsgContainer" class="col-sm-2 control-label">Chat
						Massages:</label>
					<div class="col-sm-4">
						<textarea class="noresize" name="MsgContainer" rows="20" cols="55" readonly="readonly" >
						</textarea>
						
					</div>
				</div>

				<div class="form-group">
					<label for="inputMassage" class="col-sm-2 control-label">Your Massage:</label>
					<div class="col-sm-4">
						<textarea class="noresize" name="inputMassage" rows="5" cols="55"></textarea>
					</div>
				</div>

				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<button type="submit" class="btn btn-default">SEND</button>
					</div>
				</div>
				
			</form>
			
		
					<div class="col-sm-offset-2 col-sm-10">
						<button  class="btn btn-default"> EXIT </button>
					</div>
				
			
		</div>
		<div class="col-md-3"></div>
	</div>
<%
ArrayList<String> freeUsers = (ArrayList<String>)session.getAttribute("freeUsersSesssion");
ArrayList<ChatGroup> chatGroupArraye = (ArrayList<ChatGroup>)session.getAttribute("chatGroupList");

for(int index=0; index < freeUsers.size(); index++){
	if(freeUsers.get(index).equals(session.getAttribute("id")) == true){
		freeUsers.remove(index);
		break;
		}
	}

if(request.getParameter("formCheck").equals("newChatForm")){
	
	Map<String,Integer> usersGroup =  new HashMap<>();
	String[] usersGroupArraye = request.getParameterValues("freeUsersCheckbox"); 
	for(int index=0; index < usersGroupArraye.length; index++ ){
		usersGroup.put(usersGroupArraye[index], 0);
	}
	
	ChatGroup newChatGroup = new ChatGroup(request.getParameter("chatGroupName"),usersGroup);
	
	chatGroupArraye.add(newChatGroup);
}
else if(request.getParameter("formCheck").equals("acceptChatGroupForm")){
	for(int index=0; index < chatGroupArraye.size(); index++){
		
		if(chatGroupArraye.get(index).getName().equals(request.getParameter("chatGroupRequest"))==true){
			
		}
	}
	
	
}
%>

</body>
</html>