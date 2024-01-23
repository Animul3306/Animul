package com.multi.animul.bbs;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;

import org.springframework.stereotype.Component;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

@Component
public class ApiExplorerProtect {
	
	
	public ArrayList<ProtectVO> protectAPI(String page){
		// 1. URL�� ����� ���� StringBuilder.
        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1543061/abandonmentPublicSrvc/abandonmentPublic"); /*URL*/
        String responseText = null;
        // 2. ���� API�� ��û �԰ݿ� �´� �Ķ���� ����.
        try {
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=rox78OnV4UZCBEHRVpxi84xhU%2F9FcbBch18WPOXMbIBeRrOF72uwzuyhGb%2BAbdQ8o3ylceUYkqIsgHxUzeaFPA%3D%3D");
	        urlBuilder.append("&" + URLEncoder.encode("bgnde","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*���⳯¥(�˻� ������) (YYYYMMDD)*/
	        urlBuilder.append("&" + URLEncoder.encode("endde","UTF-8") + "=" + URLEncoder.encode("", "UTF-8")); /*���⳯¥(�˻� ������) (YYYYMMDD)*/
	        //urlBuilder.append("&" + URLEncoder.encode("upkind","UTF-8") + "=" + URLEncoder.encode(upkind, "UTF-8")); /*�����ڵ� (�� : 417000, ����� : 422400, ��Ÿ : 429900)*/
	        //urlBuilder.append("&" + URLEncoder.encode("kind","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*ǰ���ڵ� (ǰ�� ��ȸ OPEN API ����)*/
	       // urlBuilder.append("&" + URLEncoder.encode("upr_cd","UTF-8") + "=" + URLEncoder.encode(upr_cd, "UTF-8")); /*�õ��ڵ� (�õ� ��ȸ OPEN API ����)*/
	        //urlBuilder.append("&" + URLEncoder.encode("org_cd","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*�ñ����ڵ� (�ñ��� ��ȸ OPEN API ����)*/
	        //urlBuilder.append("&" + URLEncoder.encode("care_reg_no","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*��ȣ�ҹ�ȣ (��ȣ�� ��ȸ OPEN API ����)*/
	        //urlBuilder.append("&" + URLEncoder.encode("state","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*����(��ü : null(��), ������ : notice, ��ȣ�� : protect)*/
	        //urlBuilder.append("&" + URLEncoder.encode("neuter_yn","UTF-8") + "=" + URLEncoder.encode(" ", "UTF-8")); /*���� (��ü : null(��), �� : Y, �ƴϿ� : N, �̻� : U)*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(page, "UTF-8")); /*������ ��ȣ (�⺻�� : 1)*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("15", "UTF-8")); /*�������� ������ ���� (1,000 ����), �⺻�� : 10*/
	        urlBuilder.append("&" + URLEncoder.encode("_type","UTF-8") + "=" + URLEncoder.encode("json", "UTF-8")); /*xml(�⺻��) �Ǵ� json*/
	        
	        // 3. URL ��ü ���� (toString���� string���� ��ȯ)
	        URL url = new URL(urlBuilder.toString());
	        
	        // 4. ��û�ϰ��� �ϴ� URL�� ����ϱ� ���� Connection ��ü ����.
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        // 5. ����� ���� �޼ҵ� SET (Get ��û)
	        conn.setRequestMethod("GET");
	        // 6. ����� ���� Content-type SET. (json���� �����ؾߵ�)
	        conn.setRequestProperty("Content-type", "application/json");
	        
	        // 7. ��� ���� �ڵ� Ȯ��.
	        System.out.println("Response code: " + conn.getResponseCode());
	        
	        // 8. ���޹��� �����͸� BufferedReader ��ü�� ����. ������ �� ��� error �߻�
	        BufferedReader rd;
	        if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
	            rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
	        } else {
	            rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
	        }
	        
	        // 9. ����� �����͸� ���κ��� �о� StringBuilder ��ü�� ����.
	        StringBuilder sb = new StringBuilder();
	        String line;
	        while ((line = rd.readLine()) != null) {
	            sb.append(line);
	        }
	        responseText  = sb.toString();
	       
	        
	        // 10. ��ü ����
	        rd.close();
	        conn.disconnect();
	        
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        
        	//json ������ ���ϴ� �����͸� �����Ͽ� Vo�� ���
      		//���䵥���� Text�� JSONObjectȭ ��Ű�� �۾� (�Ľ�)
            JsonObject totalObj = JsonParser.parseString(responseText).getAsJsonObject();
 
      		
      		//��ü JSON �������κ��� response �Ӽ������� ������ ��.
      		JsonObject responseObj = totalObj.getAsJsonObject("response");
      	
      		
      		//��ü JSON �������κ��� response �Ӽ������� ������ ��.
      		JsonObject bodyObj = responseObj.getAsJsonObject("body");
      	
      		
      		
      		//body���� totalCount ����
      		int totalCount = bodyObj.get("totalCount").getAsInt();
     
      		
      		
      		JsonObject itemsObj = bodyObj.getAsJsonObject("items");
      		JsonArray itemArr = itemsObj.getAsJsonArray("item");
      		System.out.println(itemArr);

      		

      		
      		
      		//items�� �ִ� �� item�� Vo�� ���,���� Vo���� ArrayList�� ���
      		ArrayList<ProtectVO> list = new ArrayList<>();
      		
      		System.out.println("==========================");
      		for(int i=0; i<itemArr.size(); i++) {
      			
      			//items�� ����ִ� item��ü �ϳ��� �����ϱ�
      			JsonObject item = itemArr.get(i).getAsJsonObject();
//      			System.out.println(item);
      			
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
      			vo.setChargeNm(item.get("chargeNm").getAsString());
      			vo.setOfficetel(item.get("officetel").getAsString());
      			//vo.setUpkind(item.get("upkind").getAsString());
      			//vo.setupr_cd(item.get("upr_cd").getAsString());
      			
      			list.add(vo);
      		}
      	
      		
              
              
        
		
		return list;
		
	}
}
        
        
