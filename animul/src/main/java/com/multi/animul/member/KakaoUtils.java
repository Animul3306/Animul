package com.multi.animul.member;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.security.oauth2.core.OAuth2Token;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

public class KakaoUtils {
    public static String getAccessToken(String code) {
        String accessToken = "";
        String refreshToken = "";
        String reqUrl = "https://kauth.kakao.com/oauth/token";
        String result = "";

        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            
            conn.setRequestProperty("Content-type", "application/x-www-form-urleancoded;charset=utf-8");
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=").append("f6a4bee86800ecddb68844607b78f567");
            sb.append("&redirect_uri=").append("http%3a%2f%2flocalhost%3a8888%2fanimul%2fmember%2fkakaoLogin%2fOAuth2C");
            
            sb.append("&code=").append(code);

            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
            System.out.println("[KakaoApi.getAccesToken] responseCode = {" + responseCode + "}");
            // log.info("[KakaoApi.getAccesToken] responseCode = {}", responseCode);

            BufferedReader br;
            if (responseCode >= 200 && responseCode <= 300) {
                br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            } else {
                br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
            }

            String line = "";
            StringBuilder responseSb = new StringBuilder();
            while((line = br.readLine()) != null){
                responseSb.append(line);
            }
            result = responseSb.toString();
            System.out.println("responseBody = {"+result+"}");
            // log.info("responseBody = {}", result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            accessToken = element.getAsJsonObject().get("access_token").getAsString();
            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        }catch (Exception e){ e.printStackTrace(); }

        return result;
    }

    private static String KAKAO_API_KEY = "81de27e11ee8bd7cbc41383916476670";
    private static String KAKAO_REDIRECT_URL = "http%3A%2F%2Flocalhost%3A8888%2Fanimul%2Fmember%2FkakaoLogin%2FOAuth2"; 

    public static OAuth2Token getOAuthToken(String code){
        String reqUrl = "https://kauth.kakao.com/oauth/token";

        RestTemplate rt = new RestTemplate();


        //HttpHeader 오브젝트
        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-type", "application/x-www-form-urlencoded;charset=utf-8");

        //HttpBody 오브젝트
        MultiValueMap<String, String> params = new LinkedMultiValueMap<>();
        params.add("grant_type", "authorization_code");
        params.add("client_id", KAKAO_API_KEY);
        params.add("redirect_uri", KAKAO_REDIRECT_URL);
        params.add("code", code);

        //http 바디(params)와 http 헤더(headers)를 가진 엔티티
        HttpEntity<MultiValueMap<String, String>> kakaoTokenRequest = new HttpEntity<>(params, headers);

        System.out.println(kakaoTokenRequest.toString());

        //reqUrl로 Http 요청 , POST 방식
        ResponseEntity<String> response = rt.exchange(reqUrl, HttpMethod.POST, kakaoTokenRequest, String.class);

        String responseBody = response.getBody();

        Gson gson = new Gson();
        OAuth2Token oAuthToken = gson.fromJson(responseBody, OAuth2Token.class);

        return oAuthToken;
    }


    
}
