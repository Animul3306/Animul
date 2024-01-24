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
		ApiKey apiKey = new ApiKey();
		apiKey.readApiKey();
		String apiURL = apiKey.getApiKey();
		String secretKey = apiKey.getApiSecret();
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
		
		for (int i = 0; i < list.size(); i++) {
		    if (list.get(i).contains("할인")) {
		        for (int j = i; j < list.size(); ) {
		            list.remove(j);
		            if (j < list.size() && list.get(j).matches("-\\d+")) {
		            	list.remove(j);
		                break;
		            }
		        }
		    }
		}
		
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
		if(list.contains("소재지:")) {
			findSigungu.add(list.get(list.indexOf("소재지:") + 1) + " " + list.get(list.indexOf("소재지:") + 2));
		} else if(list.contains("소재지")) {
			if(list.get(list.indexOf("소재지") + 1).equals(":")) {
				System.out.println(list.get(list.indexOf("소재지") + 2));
				findSigungu.add(list.get(list.indexOf("소재지") + 2) + " " + list.get(list.indexOf("소재지") + 3));
			}
		}
        
        ArrayList<String> findDate = new ArrayList<String>();

        //날짜 찾기
        String data = "";
        int dateIndex = 0;
		for (int i = 0; i < list.size(); i++) {
			if (list.get(i).matches("\\d{4}-\\d{2}-\\d{2}")) {
				dateIndex = i;
			}
		}
		System.out.println("_______________________1________________1_______________" + list.get(dateIndex) + "  " + list.get(dateIndex + 1));
		
		data = list.get(dateIndex) + " ";
		for(int i = dateIndex + 1; i < list.size(); i++) {
			data += list.get(i);
		}
		findDate.add(data);
		
		System.out.println("진료비:" + list.get(list.indexOf("진료") + 1).matches("\\((.*?)\\)"));
		
		ArrayList<String> findItem = new ArrayList<String>();
		ArrayList<String> itemCount = new ArrayList<String>();
		ArrayList<String> findPrice = new ArrayList<String>();
		//진료 항목과 금액 찾기
		if (list.get(list.indexOf("진료") + 1).matches("\\((.*?)\\)")) {
		    int j = 0;
		    String allStr = "";
		    int listSize = list.size();  // Cache the size of the list
		    for (int i = list.indexOf("진료") + 2; i < listSize - 1; i++) {
		        if (list.get(i + 1).equals("*표시가되어") || list.get(i + 1).equals("*표시가되어있는") || list.get(i + 1).equals("*표시가")) {
		            break;
		        }
		        Boolean result = list.get(i).matches("^[0-9]+$");
		        if (result) {
		            System.out.println(i + ": ---숫자> " + list.get(i + 1));
		            System.out.println(j);
		            itemCount.add(list.get(i));
		            findPrice.add(list.get(i + 1));
		            findItem.add(allStr);
		            allStr = "";
		            j++;
		            i++;
		        }

		        if (!result) {
		            System.out.println(i + ": ---문자> " + list.get(i));
		            allStr += list.get(i);
		        }
		    }
		}
		
		//만약 리스트에 할인이라는 항목이 들어가 있는 경우 제거하는 코드
		List<Integer> indicesToRemove = new ArrayList<>();

		for (int i = 0; i < findItem.size(); i++) {
		    if (!(findPrice.get(i).matches("\\d+"))) {
		        indicesToRemove.add(i);
		    }
		}

		for (int i = indicesToRemove.size() - 1; i >= 0; i--) {
		    int index = indicesToRemove.get(i);
		    findItem.remove(index);
		    findPrice.remove(index);
		}
		
		

		for (int i = 0; i < findPrice.size(); i++) {
		    if (Integer.parseInt(itemCount.get(i)) > 1) {
		        int multiCount = Integer.parseInt(findPrice.get(i))  / Integer.parseInt(itemCount.get(i));
		        findPrice.set(i, String.valueOf(multiCount));
		    }
		}
		
		
		//청구 금액 찾기
		ArrayList<String> findTotalPrice = new ArrayList<String>();
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
        if (lastIndex2 != -1) {
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
