package com.multi.animul.bbs;


import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
public class ApiExplorerProtect {
	
	
	public ArrayList<ProtectVO> protectAPI(String page, String upr_cd){
		// 1. URL을 만들기 위한 StringBuilder.
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
        String responseText = null;
        // 2. 오픈 API의 요청 규격에 맞는 파라미터 생성.
        try {
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=rox78OnV4UZCBEHRVpxi84xhU%2F9FcbBch18WPOXMbIBeRrOF72uwzuyhGb%2BAbdQ8o3ylceUYkqIsgHxUzeaFPA%3D%3D");
	        urlBuilder.append("&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*���⳯¥(�˻� ������) (YYYYMMDD)*/
	        urlBuilder.append("&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*���⳯¥(�˻� ������) (YYYYMMDD)*/
	        //urlBuilder.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode(upkind, "UTF-8")); /*�����ڵ� (�� : 417000, ����� : 422400, ��Ÿ : 429900)*/
	        //urlBuilder.append("&" + URLEncoder.encode("kind","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*ǰ���ڵ� (ǰ�� ��ȸ OPEN API ����)*/
	        urlBuilder.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode(upr_cd, "UTF-8")); /*�õ��ڵ� (�õ� ��ȸ OPEN API ����)*/
	        //urlBuilder.append("&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*�ñ����ڵ� (�ñ��� ��ȸ OPEN API ����)*/
	        //urlBuilder.append("&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*��ȣ�ҹ�ȣ (��ȣ�� ��ȸ OPEN API ����)*/
	        //urlBuilder.append("&" + URLEncoder.encode("state","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*����(��ü : null(��), ������ : notice, ��ȣ�� : protect)*/
	        //urlBuilder.append("&" + URLEncoder.encode("neuter_yn","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*���� (��ü : null(��), �� : Y, �ƴϿ� : N, �̻� : U)*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*������ ��ȣ (�⺻�� : 1)*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*�������� ������ ���� (1,000 ����), �⺻�� : 10*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(�⺻��) �Ǵ� json*/
	        
	        // 3. URL 객체 생성 (toString으로 string으로 변환)
	        URL url = new URL(urlBuilder.toString());
	        
	        // 4. 요청하고자 하는 URL과 통신하기 위한 Connection 객체 생성.
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        // 5. 통신을 위한 메소드 SET (Get 요청)
	        conn.setRequestMethod("GET");
	        // 6. 통신을 위한 Content-type SET. (json으로 설정해야됨)
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        // 7. 통신 응답 코드 확인.
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        // 8. 전달받은 데이터를 BufferedReader 객체로 저장. 오류가 날 경우 error 발생
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	        }
	        
	        // 9. 저장된 데이터를 라인별로 읽어 StringBuilder 객체로 저장.
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        responseText  = sb.toString();
	       
	        
	        // 10. 객체 해제
	        rd.close();
	        conn.disconnect();
	        
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
	    	//json 데이터 원하는 데이터만 추출하여 Vo에 담기
	  		//응답데이터 Text를 JSONObject화 시키는 작업 (파싱)
            JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
 
      		
            //전체 JSON 형식으로부터 response 속성명으로 접근한 것.
      		JsonObject responseObj = totalObj.getAsJsonObject("response");
      	
      		
      		//전체 JSON 형식으로부터 response 속성명으로 접근한 것.
      		JsonObject bodyObj = responseObj.getAsJsonObject("body");
      	
      		
      		
      		//body에서 totalCount 접근
      		int totalCount = bodyObj.get("totalCount").getAsInt();
     
      		
      		
      		JsonObject itemsObj = bodyObj.getAsJsonObject("items");
      		JsonArray itemArr = itemsObj.getAsJsonArray("item");
      		System.out.println(itemArr);

      		

      		
      		
      		//items에 있는 각 item을 Vo에 담고,담은 Vo들을 ArrayList에 담기
      		ArrayList<ProtectVO> list = new ArrayList<ProtectVO>();
      		
      		System.out.println("==========================");
      		for(int i=0; i<itemArr.size(); i++) {
      			
      			//items에 담겨있는 item객체 하나씩 추출하기
      			JsonObject item = itemArr.get(i).getAsJsonObject();

      			
      			ProtectVO vo = new ProtectVO();
      			
      			vo.setDesertionNo(item.get("desertionNo").getAsString());
      			vo.setPopfile(item.get("popfile").getAsString());
      			vo.setHappenDt(item.get("happenDt").getAsString());
      			vo.setHappenPlace(item.get("happenPlace").getAsString());			
      			vo.setKindCd(item.get("kindCd").getAsString());
      			vo.setAge(item.get("age").getAsString());
      			vo.setWeight(item.get("weight").getAsString());
      			vo.setNoticeSdt(item.get("noticeSdt").getAsString());
      			vo.setProcessState(item.get("processState").getAsString());
      			vo.setSexCd(item.get("sexCd").getAsString());
      			vo.setNeuterYn(item.get("neuterYn").getAsString());
      			vo.setSpecialMark(item.get("specialMark").getAsString());
      			vo.setCareNm(item.get("careNm").getAsString());
      			vo.setCareTel(item.get("careTel").getAsString());
      			vo.setCareAddr(item.get("careAddr").getAsString());
      			vo.setOrgNm(item.get("orgNm").getAsString());
      			//vo.setChargeNm(item.get("chargeNm").getAsString());
      			vo.setOfficetel(item.get("officetel").getAsString());
      			//vo.setUpkind(item.get("upkind").getAsString());
      			//vo.setUpr_cd(item.get("upr_cd").getAsString());
      			//vo.setTotalCount(item.get("totalCount").getAsInt());
      			
      			list.add(vo);
      		}
      	
      		
              
              
        
		
		return list;
		
	}
}
        
        
