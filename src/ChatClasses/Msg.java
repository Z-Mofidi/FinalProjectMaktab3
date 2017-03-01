package ChatClasses;

public class Msg {

	private int idMsg;
	private String user;
	private String chatGroupName;
	private String msg;

	public Msg(String user, String chatGroupName, String msg) {

		this.chatGroupName = chatGroupName;
		this.user = user;
		this.msg = msg;
	}

	public int getIdMsg() {
		return idMsg;
	}

	public void setIdMsg(int idMsg) {
		this.idMsg = idMsg;
	}

	public String getUser() {
		return user;
	}

	public void setUser(String user) {
		this.user = user;
	}

	public String getChatGroupName() {
		return chatGroupName;
	}

	public void setChatGroupName(String chatGroupName) {
		this.chatGroupName = chatGroupName;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

}
