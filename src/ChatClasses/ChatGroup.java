package ChatClasses;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ChatGroup {
	
	private String name;
	private Map<String,Boolean> userGroup =  new HashMap<>();
	private ArrayList<Msg> msg = new ArrayList<Msg>();
	
	public ChatGroup(String name , Map<String,Boolean> userGroup){
		this.name = name;
		this.userGroup = userGroup;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Map<String, Boolean> getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(Map<String, Boolean> userGroup) {
		this.userGroup = userGroup;
	}

	public ArrayList<Msg> getMsg() {
		return msg;
	}

	public void setMsg(ArrayList<Msg> msg) {
		this.msg = msg;
	}
	
	
	

}
