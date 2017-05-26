package yelpAPI;

import java.util.HashMap;

public class YelpParameter {
	HashMap<String, String> mParameter;
	
	public YelpParameter() {
		mParameter = new HashMap<>();
	}
	
	public YelpParameter(HashMap<String, String> h) {
		mParameter = h;
	}
	
	public void setParam(String key, String value) {
		mParameter.put(key, value);
	}
	
	public String getParam() {
		String s = "";
		for (String key: mParameter.keySet())
			s += key + "=" + mParameter.get(key) + "&";
		
		return s;
	}
}
