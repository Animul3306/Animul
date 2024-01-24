package com.multi.animul.diagnosis;

import java.io.InputStream;
import java.util.Properties;

public class  ApiKey {
    private String apiKey;
    private String apiSecret;
    private String kakaoApi;

    public void readApiKey() {
        try (InputStream input =  ApiKey.class.getClassLoader().getResourceAsStream("db.properties")) {

            if (input == null) {
                System.out.println("Sorry, unable to find api-key.properties");
                return;
            }

            Properties prop = new Properties();
            prop.load(input);

            apiKey = prop.getProperty("clova.url");
            apiSecret = prop.getProperty("clova.secretKey");
            kakaoApi = prop.getProperty("kakao.key");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String getApiKey() {
        return apiKey;
    }

    public String getApiSecret() {
        return apiSecret;
    }

	public String getKakaoApi() {
		return kakaoApi;
	}
    
}
