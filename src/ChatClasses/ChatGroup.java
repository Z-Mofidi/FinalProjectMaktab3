package ChatClasses;

import java.util.ArrayList;

public class ChatGroup {

	private String name;
	private ArrayList<UserGroup> userGroup = new ArrayList<UserGroup>();
	private ArrayList<Msg> msg = new ArrayList<Msg>();

	public ChatGroup(String name, ArrayList<UserGroup> userGroup) {
		this.name = name;
		this.userGroup = userGroup;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public ArrayList<UserGroup> getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(ArrayList<UserGroup> userGroup) {
		this.userGroup = userGroup;
	}

	public ArrayList<Msg> getMsg() {
		return msg;
	}

	public void setMsg(ArrayList<Msg> msg) {
		this.msg = msg;
	}

}
