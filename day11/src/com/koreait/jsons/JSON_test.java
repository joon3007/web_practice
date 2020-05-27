package com.koreait.jsons;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

public class JSON_test {
	public String json;
	
	public void jsonAdd() {
		JSONObject jObj_in = new JSONObject();
		JSONObject jObj_out = new JSONObject();
		
		jObj_in.put("name", "김휘준");
		jObj_in.put("gender", "남자");
		jObj_in.put("nation", "Republic of Korea");
		
		jObj_out.put("in", jObj_in);
		
		json = jObj_out.toJSONString();
		System.out.println(json);
	}
	public static void main(String[] args) {
		JSON_test j_test = new JSON_test();
		JSONParser p = new JSONParser();
		j_test.jsonAdd();
		
		JSONObject json_obj = null;
		JSONObject result_obj = null;
		String name = null;
		String gender = null;
		String nation = null;
		
		try {
			json_obj = (JSONObject)p.parse(j_test.json);
			result_obj = (JSONObject)json_obj.get("in");
			name = (String)result_obj.get("name");
			gender = (String)result_obj.get("gender");
			nation = (String)result_obj.get("nation");
			System.out.println("이름 : "+ name);
			System.out.println("성별 : "+ gender);
			System.out.println("나라 : "+ nation);
			
		} catch (ParseException e) {
			e.printStackTrace();
			System.out.println("파싱 오류");
		}
	}
}
