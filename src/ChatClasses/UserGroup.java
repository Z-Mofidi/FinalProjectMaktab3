package ChatClasses;

public class UserGroup {
	
	private int idUserGroup;
	private String userName;
	private String chatGroupName;
	private int reqStatus;
	
	public UserGroup(String userName, String chatGroupName, int reqStatus){
		
		
		this.userName = userName;
		this.chatGroupName = chatGroupName;
		this.reqStatus = reqStatus;
	}

	
	public int getIdUserGroup() {
		return idUserGroup;
	}


	public void setIdUserGroup(int idUserGroup) {
		this.idUserGroup = idUserGroup;
	}


	
	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public String getChatGroupName() {
		return chatGroupName;
	}


	public void setChatGroupName(String chatGroupName) {
		this.chatGroupName = chatGroupName;
	}


	public int getReqStatus() {
		return reqStatus;
	}

	public void setReqStatus(int reqStatus) {
		this.reqStatus = reqStatus;
	}
	
	
}
