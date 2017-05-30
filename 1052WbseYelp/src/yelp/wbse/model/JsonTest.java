package yelp.wbse.model;

import java.util.List;

import com.google.gson.Gson;

public class JsonTest {
	// 新增紀錄:細項
	class Keep {
		List<String> keep;

		Keep(List<String> keep) {
			this.keep = keep;
		}
	}
	
	public static void main(String[] args) {
		String temp2 = "{\"keep\":[\"老地方\", \"金圓\"]}";
		Gson gson = new Gson();
		Keep temp3 = gson.fromJson(temp2, Keep.class);
		System.out.println(temp3.keep.size());
		System.out.println(temp3.keep.get(0));
	}
}
