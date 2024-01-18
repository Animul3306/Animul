package com.multi.animul.diagnosis;

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
import java.util.List;
import java.util.UUID;

import org.json.JSONArray;
import org.json.JSONObject;

public class ClovaOcr {
	public ArrayList<ArrayList<String>> ocr(String fileName) {
		String apiURL = "https://fotdsyrcm1.apigw.ntruss.com/custom/v1/26935/32450a3b73e5fefc74658a551b5f468904b86e05b0717edea20870314ef93312/general";
		String secretKey = "SVF5Uk5nVGVYT3BZRk10dWRwSWxva1VQQXpCVXZDb2Q=";
		String imageFile = fileName;
		ArrayList<String> list = new ArrayList<String>();
		ArrayList<String> findUid = new ArrayList<String>();
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
			con.setRequestProperty("enableTableDetection", "true");

			JSONObject json = new JSONObject();
			json.put("version", "V2");
			json.put("requestId", UUID.randomUUID().toString());
			json.put("timestamp", System.currentTimeMillis());
			JSONObject image = new JSONObject();
			image.put("format", "png");//jpg
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

			//System.out.println(response);
			JSONObject json2 = new JSONObject(response.toString());
			System.out.println(json2);
			JSONArray images_arr = json2.getJSONArray("images");
			JSONObject images_0 = images_arr.getJSONObject(0);
			JSONArray fields_arr = images_0.getJSONArray("fields");
			System.out.println("uid: " + images_0.getString("uid"));
			findUid.add(images_0.getString("uid"));
			for (int i = 0; i < fields_arr.length(); i++) {
				JSONObject inferText = fields_arr.getJSONObject(i);
				String text = inferText.getString("inferText").replace(",", "").replaceAll(" ", "");
				//System.out.println(text.matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣|a-z|A-Z]+.*"));
				//System.out.println(text);
				list.add(text);
			}
		} catch (Exception e) {
			System.out.println(e);
		}
		ArrayList<ArrayList<String>> receiptAnalyzeList = receiptAnalyze(list);
		receiptAnalyzeList.add(0, findUid);
		return receiptAnalyzeList;
	}

	
	
	private ArrayList<ArrayList<String>> receiptAnalyze(ArrayList<String> list){
		ArrayList<ArrayList<String>> receiptOrganize = new ArrayList<ArrayList<String>>();
		
		
		System.out.println(list);
		
		ArrayList<String> findHospital = new ArrayList<String>();
		//병원명 찾기
		if(list.contains("명:")) {
			System.out.println(list.get(list.indexOf("명:") + 1));
			findHospital.add(list.get(list.indexOf("명:") + 1));
		} else if(list.contains("명")) {
			if(list.get(list.indexOf("명") + 1).equals(":")) {
				System.out.println(list.get(list.indexOf("명") + 2));
				findHospital.add(list.get(list.indexOf("명") + 2));
			}
		}
		

		ArrayList<String> findSigungu = new ArrayList<String>();
		//전이랑 전화가 나오기 전까지 시 구 군의 마지막 인덱스 출력
		String[] targetSuffixes = {"시", "구", "군"}; // 찾고자 하는 문자열의 접미사 배열
		
        int lastIndex = -1; // 찾은 문자열의 마지막 인덱스를 저장할 변수

        for (int i = 0; i < list.size(); i++) {
            String currentString = list.get(i);

            if(!(list.get(i).equals("전") || list.get(i).equals("전화"))) {
            	for (String targetSuffix : targetSuffixes) {
                    if (currentString.endsWith(targetSuffix)) {
                        lastIndex = i;
                        break;
                    }
                }
            } else {
            	break;
            }
        }

        // 결과 출력
        if (lastIndex != -1) {
            System.out.println("마지막으로 나오는 " + String.join(" 또는 ", targetSuffixes) + "로 끝나는 문자열: " + list.get(lastIndex));
            
            findSigungu.add(list.get(lastIndex));
            
        } else {
            System.out.println(String.join(" 또는 ", targetSuffixes) + "로 끝나는 문자열을 찾을 수 없습니다.");
        }
        
        ArrayList<String> findDate = new ArrayList<String>();

        //날짜 찾기
		if(list.contains("날짜:")) {
			System.out.println(list.get(list.indexOf("날짜:") + 1));
			findDate.add(list.get(list.indexOf("날짜:") + 1));
		}  else if(list.contains("짜:")) {
			System.out.println(list.get(list.indexOf("짜:") + 1));
			findDate.add(list.get(list.indexOf("짜:") + 1));
		} else if (list.get(list.indexOf("날짜") + 1).equals(":")) {
			System.out.println(list.get(list.indexOf("날짜") + 2));
			findDate.add(list.get(list.indexOf("날짜") + 2));
		} else if (list.get(list.indexOf("짜") + 1).equals(":")) {
			System.out.println(list.get(list.indexOf("짜") + 2));
			findDate.add(list.get(list.indexOf("짜") + 2));
		}
		
		
		ArrayList<String> findItem = new ArrayList<String>();
		ArrayList<String> findPrice = new ArrayList<String>();
		//진료 항목과 금액 찾기
		if(list.get(list.indexOf("수량") + 1).equals("금액")) {
			int j = 0;
			String allStr = "";
			for (int i = list.indexOf("수량") + 2; i < list.size(); i++) {
				if(!(list.get(i + 1).equals("계"))) {
					Boolean result = list.get(i).matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣|a-z|A-Z]+.*");
					if(!result) { //숫자가 안들이거면
						System.out.println(i + ": ---숫자> " + list.get(i));
						System.out.println(j);
						findPrice.add(list.get(i));
						findItem.add(allStr);
						allStr = "";
						j++;
						i+=2;
					}
					
					if(result){ //들어가면
						System.out.println(i + ": ---문자> " + list.get(i));
						allStr += list.get(i);
						
					}
					
				} else {
					break;
				}
			}
		}
		
		ArrayList<String> findTotalPrice = new ArrayList<String>();
		//청구 금액 찾기
		String[] totalPriceTargets = {"청구금액:", "금액:", "금액", "청구금액"};
		
		int lastIndex2 = -1; // 찾은 문자열의 마지막 인덱스를 저장할 변수

        for (int i = 0; i < list.size(); i++) {
            String currentString = list.get(i);

            for (String totalPriceTarget : totalPriceTargets) {
                if (currentString.contains(totalPriceTarget)) {
                	 lastIndex2 = i;
                     break;
                }     
            }
        
        }
        // 결과 출력
        if (lastIndex != -1) {
        	Boolean a = list.get(lastIndex2 + 1).matches(".*[ㄱ-ㅎㅏ-ㅣ가-힣|a-z|A-Z]+.*");
        	if(!a) {
        		findTotalPrice.add(list.get(lastIndex2 + 1));
        	} else {
        		findTotalPrice.add(list.get(lastIndex2 + 2));
        	}
        } else {
            System.out.println("찾을 수 없습니다.");
        }
        receiptOrganize.add(findHospital);
        receiptOrganize.add(findSigungu);
        receiptOrganize.add(findDate);
        receiptOrganize.add(findItem);
        receiptOrganize.add(findPrice);
        receiptOrganize.add(findTotalPrice);
 		
        System.out.println("병원명: " + findHospital.toString());
        System.out.println("주소: " + findSigungu.toString());
        System.out.println("날짜: " + findDate.toString());
        System.out.println("지료 항목 리스트: " + findItem.toString());
        System.out.println("가격 리스트: " + findPrice.toString());
        System.out.println("청구 금액: " + findTotalPrice.toString());
	
		
		return receiptOrganize;
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
}
