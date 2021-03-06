package com.AourZ.PayStory.service.ai;

import java.io.BufferedReader;
import java.io.DataOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Service;

import com.AourZ.PayStory.model.accountBook.ExpenditureItemVO;
import com.AourZ.PayStory.model.accountBook.ExpenditureVO;

@Service
public class OCRService {
	public static ExpenditureVO clovaOCRService (String filePathName) {
		String apiURL = "https://i972ng1kto.apigw.ntruss.com/custom/v1/14509/7a6ee47c8bf6b80892e163b6b50e80a611a9f85b688f7ba3b6419bb6e470f50e/document/receipt";
		String secretKey = "ZlVoZWNCYk12cFhSV1pFbXJCYUhybWRoamlOd1BYdFE=";
		String imageFile = filePathName;
		
		ExpenditureVO result = new ExpenditureVO();
		
		try {
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection)url.openConnection();
			con.setUseCaches(false);
			con.setDoInput(true);
			con.setDoOutput(true);
			con.setReadTimeout(30000);
			con.setRequestMethod("POST");
			String boundary = "----" + UUID.randomUUID().toString().replaceAll("-", "");
			con.setRequestProperty("Content-Type", "multipart/form-data; boundary=" + boundary);
			con.setRequestProperty("X-OCR-SECRET", secretKey);

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "jpg");
			image.put("name", "demo");
			JSONArray images = new JSONArray();
			images.put(image);
			json.put("images", images);
			String postParams = json.toString();

			con.connect();
			DataOutputStream wr = new DataOutputStream(con.getOutputStream());
			long start = System.currentTimeMillis();
			File file = new File(imageFile);
			writeMultiPart(wr, postParams, file, boundary);
			wr.close();

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) {
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else {
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			StringBuffer response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();

			System.out.println(response.toString());
			result = jsonToVO(response.toString());
		} catch (Exception e) {
			System.out.println(e);
		}
		return result;
	}

	private static void writeMultiPart(OutputStream out, String jsonMessage, File file, String boundary) throws
		IOException {
		StringBuilder sb = new StringBuilder();
		sb.append("--").append(boundary).append("\r\n");
		sb.append("Content-Disposition:form-data; name=\"message\"\r\n\r\n");
		sb.append(jsonMessage);
		sb.append("\r\n");

		out.write(sb.toString().getBytes("UTF-8"));
		out.flush();

		if (file != null && file.isFile()) {
			out.write(("--" + boundary + "\r\n").getBytes("UTF-8"));
			StringBuilder fileString = new StringBuilder();
			fileString
				.append("Content-Disposition:form-data; name=\"file\"; filename=");
			fileString.append("\"" + file.getName() + "\"\r\n");
			fileString.append("Content-Type: application/octet-stream\r\n\r\n");
			out.write(fileString.toString().getBytes("UTF-8"));
			out.flush();

			try (FileInputStream fis = new FileInputStream(file)) {
				byte[] buffer = new byte[8192];
				int count;
				while ((count = fis.read(buffer)) != -1) {
					out.write(buffer, 0, count);
				}
				out.write("\r\n".getBytes());
			}

			out.write(("--" + boundary + "--\r\n").getBytes("UTF-8"));
		}
		out.flush();
	}
	
	// ?????? ???????????? ExpenditureVO??? ExpenditureItemList??? ??????
	public static ExpenditureVO jsonToVO(String jsonResultStr){
		ExpenditureVO expenditureVO = new ExpenditureVO();
		
		JSONObject jsonObj = new JSONObject(jsonResultStr);
		JSONArray imageArray = (JSONArray) jsonObj.get("images");
		
		try {
			if(imageArray != null) {
				JSONObject tempObj = (JSONObject) imageArray.get(0);
				JSONObject receiptObj = (JSONObject) tempObj.get("receipt");
				JSONObject resultObj = (JSONObject) receiptObj.get("result");
				
				/************ ?????????, ?????? ?????? -> VO ?????? **************/
				JSONObject storeObj = (JSONObject) resultObj.get("storeInfo");
				
				// ?????????
				JSONObject nameObj = (JSONObject) storeObj.get("name");
				JSONObject formattedNameObj = (JSONObject) nameObj.get("formatted");
				
				String expeditureSource = "";		// ?????????
				
				// ?????? ????????? ?????????
				if(storeObj.has("subName")) {
					JSONObject subNameObj = (JSONObject) storeObj.get("subName");
					JSONObject formattedSubNameObj = (JSONObject) subNameObj.get("formatted");
					expeditureSource = (String) formattedNameObj.getString("value") + " " + (String) formattedSubNameObj.getString("value") ;
				}else {
					expeditureSource = (String) formattedNameObj.getString("value");
				}
//				System.out.println("?????? : " + expeditureSource);
				expenditureVO.setExpenditureSource(expeditureSource);
				
				// ??????
				JSONArray addressArray = (JSONArray) storeObj.get("addresses");
				String expenditureAddress =  "";	// ??????
				
				if(addressArray != null) {
					JSONObject temp2Obj = (JSONObject) addressArray.get(0);
					JSONObject formattedAddressObj = (JSONObject) temp2Obj.get("formatted");
					expenditureAddress = (String) formattedAddressObj.getString("value");
//					System.out.println("??????: " + expenditureAddress);
					expenditureVO.setExpenditureAddress(expenditureAddress);
				}
				
				/************ ??????, ?????? ?????? -> VO ?????? **************/
				JSONObject paymentObj = (JSONObject) resultObj.get("paymentInfo");
				
				// ??????
				String year, month, day = "";
				
				JSONObject dateObj = (JSONObject) paymentObj.get("date");
				
				if(!dateObj.has("formatted")) {
					String dateText = (String) dateObj.getString("text");
					String[] dateTextArray = dateText.split("-|/|\\.|\\s");
					year = dateTextArray[0].replaceAll("[^0-9]", "");
					if(year.length() == 2) year = 20 + year;
					System.out.println(year);
					month = dateTextArray[1].replaceAll("[^0-9]", "");
					day = dateTextArray[2].replaceAll("[^0-9]", "");
					
					// ?????? 
					JSONObject timeObj = (JSONObject) paymentObj.get("time");
					JSONObject formattedTimeObj = (JSONObject) timeObj.get("formatted");
					String hour = (String) formattedTimeObj.getString("hour");
					String minute = (String) formattedTimeObj.getString("minute");
					
					// ?????????????????? ???????????? ???????????? ?????? (yyyy-MM-ddThh:mm) ???????????? ??????
					String expenditureDate = year + "-" + month + "-" + day + "T" + hour + ":" + minute;
					//System.out.println("??????: " + expenditureDate);
					expenditureVO.setExpenditureDate(expenditureDate);
				} else {
					JSONObject formattedDateObj = (JSONObject) dateObj.get("formatted");
					year = (String) formattedDateObj.getString("year");
					month = (String) formattedDateObj.getString("month");
					day = (String) formattedDateObj.getString("day");
					
					if(year.equals("") || month.equals("") || day.equals("")) {
						String dateText = (String) dateObj.getString("text");
						String[] dateTextArray = dateText.split("-|/|\\.|\\s");
						year = dateTextArray[0].replaceAll("[^0-9]", "");
						if(year.length() == 2) year = 20 + year;
						month = dateTextArray[1].replaceAll("[^0-9]", "");
						day = dateTextArray[2].replaceAll("[^0-9]", "");
						
						// ?????? 
						JSONObject timeObj = (JSONObject) paymentObj.get("time");
						JSONObject formattedTimeObj = (JSONObject) timeObj.get("formatted");
						String hour = (String) formattedTimeObj.getString("hour");
						String minute = (String) formattedTimeObj.getString("minute");
						
						// ?????????????????? ???????????? ???????????? ?????? (yyyy-MM-ddThh:mm) ???????????? ??????
						String expenditureDate = year + "-" + month + "-" + day + "T" + hour + ":" + minute;
						//System.out.println("??????: " + expenditureDate);
						expenditureVO.setExpenditureDate(expenditureDate);
					}else {
						if(year.length() == 2) year = 20 + year;
						
						// ?????? 
						JSONObject timeObj = (JSONObject) paymentObj.get("time");
						JSONObject formattedTimeObj = (JSONObject) timeObj.get("formatted");
						String hour = (String) formattedTimeObj.getString("hour");
						String minute = (String) formattedTimeObj.getString("minute");
						
						// ?????????????????? ???????????? ???????????? ?????? (yyyy-MM-ddThh:mm) ???????????? ??????
						String expenditureDate = year + "-" + month + "-" + day + "T" + hour + ":" + minute;
						//System.out.println("??????: " + expenditureDate);
						expenditureVO.setExpenditureDate(expenditureDate);
					}
				}
				
				/************ ????????? ?????? -> VO ?????? **************/
				JSONArray subResultArray = (JSONArray) resultObj.get("subResults");
				if(subResultArray.length() != 0) {
					JSONObject temp3Obj = (JSONObject) subResultArray.get(0);
					
					JSONArray itemArray = (JSONArray) temp3Obj.get("items");
					
					String expenditureItemName = "";
					int expenditureItemPrice;
					
					if(itemArray != null) {
						ArrayList<ExpenditureItemVO> expenditureItemList = new ArrayList<ExpenditureItemVO>();
						for(int i=0; i < itemArray.length(); i++) {
							ExpenditureItemVO itemVO = new ExpenditureItemVO();
							JSONObject temp4Obj = (JSONObject) itemArray.get(i);
							
							if(temp4Obj.has("price")) {
								// ????????? ?????? ??????
								JSONObject itemNameObj = (JSONObject) temp4Obj.get("name");
								JSONObject formattedItemNameObj = (JSONObject) itemNameObj.get("formatted");
								expenditureItemName = (String) formattedItemNameObj.getString("value");
								
								// ????????? ?????? ??????
								JSONObject priceObj = (JSONObject) temp4Obj.get("price");
								JSONObject itemPriceObj = (JSONObject) priceObj.get("price");
								JSONObject formattedPriceNameObj = (JSONObject) itemPriceObj.get("formatted");
								expenditureItemPrice = Integer.parseInt((String) formattedPriceNameObj.get("value"));
								
								// expenditureItemVO??? ?????? ??? expenditureItemList??? ??????
								itemVO.setExpenditureItemName(expenditureItemName);
								itemVO.setExpenditureItemPrice(expenditureItemPrice);
//								System.out.println("?????? ?????? "+ (i+1) +" =======================");
//								System.out.println("??????:" + expenditureItemName + "??????:" + expenditureItemPrice );
								expenditureItemList.add(itemVO);
							}
						}
						// expenditureVO??? expenditureItemList ??????
						expenditureVO.setItemList(expenditureItemList);
					}
				}
				
				/************ ??? ?????? ?????? -> VO ?????? ************/
				JSONObject totalPriceObj = (JSONObject) resultObj.get("totalPrice");
				JSONObject priceObj = (JSONObject) totalPriceObj.get("price");
				JSONObject formattedPriceObj = (JSONObject) priceObj.get("formatted");
				
				int expenditureAmount = Integer.parseInt((String) formattedPriceObj.get("value"));
//				System.out.println("=========================");
//				System.out.println("??? ?????? : " + expenditureAmount);
				expenditureVO.setExpenditureAmount(expenditureAmount);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return expenditureVO;
	}
}
