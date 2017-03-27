<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
    <%@ page import="java.util.*" %>
	<%@ page import="ChatClasses.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.0/jquery.min.js"></script> <script> $(document).ready(function() { var reloadData = 0; // store timer // load data on page load, which sets timeout to reload again loadData(); }); function loadData() { $('#load_me').load('samp.jsp', function() { if (reloadData != 0) window.clearTimeout(reloadData); reloadData = window.setTimeout(loadData, 10000) }).fadeIn("slow"); } </script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">

<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Insert title here</title>
</head>
<body>

<%

ArrayList<String> freeUsers = (ArrayList<String>)session.getAttribute("freeUsersSesssion");
ArrayList<ChatGroup> chatGroupArraye = (ArrayList<ChatGroup>)session.getAttribute("chatGroupSession");
if(request.getParameter("formCheck").equals("sendMsg")==true){
	for(int index=0; index < chatGroupArraye.size(); index++){
						if(chatGroupArraye.get(index).getName().equals(session.getAttribute("chatGroupNameSession"))==true){
						Msg msg = new Msg(String.valueOf(session.getAttribute("id")),request.getParameter("inputMassage"));
						chatGroupArraye.get(index).getMsg().add(msg);
							break;			
						}	}				
					 }
else if(request.getParameter("formCheck").equals("newChatForm")==true){
	for(int index=0; index < freeUsers.size(); index++){
		if(freeUsers.get(index).equals(session.getAttribute("id")) == true){
			freeUsers.remove(index);
			break;
			}
		}

	
	 Map<String,Boolean> usersGroupMap =  new HashMap<String,Boolean>();
	 usersGroupMap.put(String.valueOf(session.getAttribute("id")), true);
	 
		 String[] usersGroupArraye = request.getParameterValues("freeUsersCheckbox");
		 if(usersGroupArraye[0].equals("checkboxExitFalse") == false){
	for(int index=0; index < usersGroupArraye.length; index++ ){
		usersGroupMap.put(usersGroupArraye[index], false);
	}
		 }
	session.setAttribute("chatGroupNameSession", request.getParameter("chatGroupName"));
	ChatGroup newChatGroup = new ChatGroup(request.getParameter("chatGroupName"),usersGroupMap);
	
	chatGroupArraye.add(newChatGroup);
}
else if(request.getParameter("formCheck").equals("acceptChatGroupForm")){
	for(int index=0; index < freeUsers.size(); index++){
		if(freeUsers.get(index).equals(session.getAttribute("id")) == true){
			freeUsers.remove(index);
			break;
			}
		}

	
	for(int index=0; index < chatGroupArraye.size(); index++){
		
		if(chatGroupArraye.get(index).getName().equals(request.getParameter("chatGroupRequest"))==true){
			session.setAttribute("chatGroupNameSession", request.getParameter("chatGroupRequest"));
			 Map<String,Boolean> usersGroupMapEdit =  new HashMap<String,Boolean>();
			 %>
			 <%//=chatGroupArraye.get(index).getUserGroup().get(session.getAttribute("id")) %>
			 <%
			chatGroupArraye.get(index).getUserGroup().replace(String.valueOf(session.getAttribute("id")), true);
			%>
			<%//=chatGroupArraye.get(index).getUserGroup().get(session.getAttribute("id")) %>
			<%
			break;
		}
	}	
}

%>


<div class="row">
		<div class="col-md-12"> <br>
								<br>
								<br>
								</div>
		</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-6">

			<form class="form-horizontal" action="ChatPage.jsp" method="post" >
				<div class="form-group">
					<label for="MsgContainer" class="col-sm-2 control-label">Chat
						Massages:</label>
						<div id="load_me" class="col-sm-4">
						<textarea class="noresize" name="inputMassage1" rows="10" cols="55">
						
						<%	for(int index=0; index < chatGroupArraye.size(); index++){
							if(chatGroupArraye.get(index).getName().equals(session.getAttribute("chatGroupNameSession"))==true){
								for(int index2=(chatGroupArraye.get(index).getMsg().size()-1); index2 >= 0; index2--){%>
									<%=chatGroupArraye.get(index).getMsg().get(index2).getUser() %>:
									<%=chatGroupArraye.get(index).getMsg().get(index2).getMsg() %>									
									<%}
								break;			
							}				
						} %>
						
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
					<input type='hidden' name='formCheck' value='sendMsg'>
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
	
</body>
</html>