package ChatClasses;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class ChatGroup {
	
	private String name;
	private Map<String,Integer> userGroup =  new HashMap<>();
	private ArrayList<Msg> msg = new ArrayList<Msg>();
	
	public ChatGroup(String name , Map<String,Integer> userGroup){
		this.name = name;
		this.userGroup = userGroup;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Map<String, Integer> getUserGroup() {
		return userGroup;
	}

	public void setUserGroup(Map<String, Integer> userGroup) {
		this.userGroup = userGroup;
	}

	public ArrayList<Msg> getMsg() {
		return msg;
	}

	public void setMsg(ArrayList<Msg> msg) {
		this.msg = msg;
	}
	
	
	

}
