package com.AourZ.PayStory.service.ai;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Base64;
import java.util.Date;

import javax.crypto.Mac;
import javax.crypto.spec.SecretKeySpec;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

@Service
public class ChatbotService {
	public String main(String voiceMessage) {
//	public static String main(String voiceMessage) {
		String apiURL = "https://73f2a8dd12624fc3bec9e584ef0ae474.apigw.ntruss.com/custom/v1/6524/6c8615bf2d2088e3142130a9a240769fd44c94f5eb02e71ce851280379afb73d";
		
		String secretKey = "WVVuS2lSdmdHU1VJSk1VR0JCb0ZSQUlDUWx2YWFiaGU=";
		
        String chatbotMessage = "";	// 응답 메세지
        
        try {
            //String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

            URL url = new URL(apiURL);

            String message = getReqMessage(voiceMessage);
            System.out.println("##" + message);

            String encodeBase64String = makeSignature(message, secretKey);
            
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("POST");
            con.setRequestProperty("Content-Type", "application/json;UTF-8");
            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

            // post request
            con.setDoOutput(true);
            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
            wr.write(message.getBytes("UTF-8"));
            wr.flush();
            wr.close();
            int responseCode = con.getResponseCode();

            BufferedReader br;

            if(responseCode==200) { // Normal call
                System.out.println(con.getResponseMessage());

                BufferedReader in = new BufferedReader(
                        new InputStreamReader(
                                con.getInputStream()));
                String decodedString;
                while ((decodedString = in.readLine()) != null) {
                    chatbotMessage = decodedString;
                }
                //chatbotMessage = decodedString;
                in.close();
                
                // 응답 메시지 출력
                System.out.println(chatbotMessage);
                
                chatbotMessage = jsonToString(chatbotMessage);
                
            } else {  // Error occurred
                chatbotMessage = con.getResponseMessage();
            }
        } catch (Exception e) {
            System.out.println(e);
        }

        return chatbotMessage;
    }
	
	public String imgLinkMainService(String voiceMessage) {
//		public static String main(String voiceMessage) {
			String apiURL = "https://73f2a8dd12624fc3bec9e584ef0ae474.apigw.ntruss.com/custom/v1/6524/6c8615bf2d2088e3142130a9a240769fd44c94f5eb02e71ce851280379afb73d";
			
			String secretKey = "WVVuS2lSdmdHU1VJSk1VR0JCb0ZSQUlDUWx2YWFiaGU=";
			
	        String chatbotMessage = "";	// 응답 메세지

	        try {
	            //String apiURL = "https://ex9av8bv0e.apigw.ntruss.com/custom_chatbot/prod/";

	            URL url = new URL(apiURL);

	            String message = getReqMessage(voiceMessage);
	            System.out.println("##" + message);

	            String encodeBase64String = makeSignature(message, secretKey);

	            HttpURLConnection con = (HttpURLConnection)url.openConnection();
	            con.setRequestMethod("POST");
	            con.setRequestProperty("Content-Type", "application/json;UTF-8");
	            con.setRequestProperty("X-NCP-CHATBOT_SIGNATURE", encodeBase64String);

	            // post request
	            con.setDoOutput(true);
	            DataOutputStream wr = new DataOutputStream(con.getOutputStream());
	            wr.write(message.getBytes("UTF-8"));
	            wr.flush();
	            wr.close();
	            int responseCode = con.getResponseCode();

	            BufferedReader br;

	            if(responseCode==200) { // Normal call
	                System.out.println(con.getResponseMessage());

	                BufferedReader in = new BufferedReader(
	                        new InputStreamReader(
	                                con.getInputStream()));
	                String decodedString;
	                while ((decodedString = in.readLine()) != null) {
	                    chatbotMessage = decodedString;
	                }
	                //chatbotMessage = decodedString;
	                in.close();
	                
	                // 응답 메시지 출력
	                System.out.println(chatbotMessage);
	                
//	                chatbotMessage = jsonToString(chatbotMessage);
	                
	            } else {  // Error occurred
	                chatbotMessage = con.getResponseMessage();
	            }
	        } catch (Exception e) {
	            System.out.println(e);
	        }

	        return chatbotMessage;
	    }

    public static String makeSignature(String message, String secretKey) {

        String encodeBase64String = "";

        try {
            byte[] secrete_key_bytes = secretKey.getBytes("UTF-8");

            SecretKeySpec signingKey = new SecretKeySpec(secrete_key_bytes, "HmacSHA256");
            Mac mac = Mac.getInstance("HmacSHA256");
            mac.init(signingKey);

            byte[] rawHmac = mac.doFinal(message.getBytes("UTF-8"));
//            encodeBase64String = Base64.encodeToString(rawHmac, Base64.NO_WRAP);
            encodeBase64String = Base64.getEncoder().encodeToString(rawHmac);
            return encodeBase64String;

        } catch (Exception e){
            System.out.println(e);
        }

        return encodeBase64String;

    }

    public static String getReqMessage(String voiceMessage) {

        String requestBody = "";

        try {

            JSONObject obj = new JSONObject();

            long timestamp = new Date().getTime();

            System.out.println("##"+timestamp);

            obj.put("version", "v2");
            obj.put("userId", "U47b00b58c90f8e47428af8b7bddc1231heo2");
//=> userId is a unique code for each chat user, not a fixed value, recommend use UUID. use different id for each user could help you to split chat history for users.

            obj.put("timestamp", timestamp);

            JSONObject bubbles_obj = new JSONObject();

            bubbles_obj.put("type", "text");

            JSONObject data_obj = new JSONObject();
            data_obj.put("description", voiceMessage);

            bubbles_obj.put("type", "text");
            bubbles_obj.put("data", data_obj);

            JSONArray bubbles_array = new JSONArray();
            bubbles_array.put(bubbles_obj);

            obj.put("bubbles", bubbles_array);
            obj.put("event", "send");
            
            // 웰컴 메시지 출력
            if(voiceMessage == "") {
            	obj.put("event", "open");	//웰컴 메세지
            } else {
            	obj.put("evetn", "send");
            }
            
            requestBody = obj.toString();
            
            
            
        } catch (Exception e){
            System.out.println("## Exception : " + e);
        }

        return requestBody;	// 응답 반환

    }
    
    // 서버로부터 받은 결과 JSON 데이터 추출해서 반환
    public String jsonToString(String jsonResultStr) {
    	String result = "";
    	
		JSONObject jsonObj = new JSONObject(jsonResultStr);
		JSONArray bubblesArray = (JSONArray) jsonObj.get("bubbles");
	
		JSONObject Obj0 = (JSONObject) bubblesArray.get(0);
		JSONObject dataObj = (JSONObject)Obj0.get("data");
		
		result = (String) dataObj.get("description");
    	
    	return result;
    	
    }
}









