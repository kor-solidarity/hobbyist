package com.dh.hobbyist.api;

import java.util.HashMap;
import java.util.Random;

import org.json.simple.JSONObject;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

public class Coolsms {
	public Coolsms() {}
		
		public String sms(String phone){
	    String api_key = "";
	    String api_secret = "";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    int random = new Random().nextInt(8998)+1001;
	
	    String randomVal = Integer.toString(random);
	    
	    HashMap<String, String> params = new HashMap<String, String>();
	    params.put("to", phone); // 수신번호
	    params.put("from", "01090692522"); // 발신번호
	    params.put("type", "SMS"); // Message type ( SMS, LMS, MMS, ATA )
	    params.put("text", "[hobbyist] 인증번호 [" + randomVal + "] 를 입력해주세요."); // 문자내용    
	    params.put("app_version", "JAVA SDK v1.2"); // application name and version
	
	    
	    try {
	      JSONObject obj = (JSONObject) coolsms.send(params);
	      System.out.println(obj.toString());
	    } catch (CoolsmsException e) {
	      System.out.println(e.getMessage());
	      System.out.println(e.getCode());
	    }
	    
	    
	    return randomVal;
	  }
}
