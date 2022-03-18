package com.springbook.biz.util.naver;

import java.io.IOException;
import java.math.BigInteger;
import java.security.SecureRandom;

import javax.servlet.http.HttpSession;

import org.apache.maven.shared.utils.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

public class NaverLoginBO {

    private final static String CLIENT_ID = "L6VWoNHLW55mlDhnSMDh";
    private final static String CLIENT_SECRET = "vycWDHp6Yg";
    private final static String REDIRECT_URI = "http://localhost:8080/biz/home.do";

    private final static String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
    public String generateState()
	{
	    SecureRandom random = new SecureRandom();
	    return new BigInteger(130, random).toString(32);
	}

    /* 네아로 인증  URL 생성  Method */
    public String getAuthorizationUrl(HttpSession session) {

    String state = generateState();
    session.setAttribute("state", state);

    /* Scribe에서 제공하는 인증 URL 생성 기능을 이용하여 네아로 인증 URL 생성 */
    OAuth20Service oauthService = new ServiceBuilder()
    		.apiKey(CLIENT_ID)
    		.apiSecret(CLIENT_SECRET)
    		.callback(REDIRECT_URI)
    		.state(state)
    		.build(NaverLoginApi.instance());
    return oauthService.getAuthorizationUrl();
    }
    
    public OAuth2AccessToken getAccessToken(HttpSession session, String code, String state) throws IOException{
    	
    String sessionState= (String)session.getAttribute("state");
    if(StringUtils.equals(sessionState, state)) {
    	OAuth20Service oauthService = new ServiceBuilder()
    			.apiKey(CLIENT_ID)
    			.apiSecret(CLIENT_SECRET)
    			.callback(REDIRECT_URI)
    			.state(state)
    			.build(NaverLoginApi.instance());
    	
    	OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
    	return accessToken; 
    	
    }
    return null; 
    }
    
    public String getUserProfile(OAuth2AccessToken oauthToken) throws IOException{

        OAuth20Service oauthService =new ServiceBuilder()
              .apiKey(CLIENT_ID)
              .apiSecret(CLIENT_SECRET)
              .callback(REDIRECT_URI).build(NaverLoginApi.instance());

        OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
        oauthService.signRequest(oauthToken, request);
        Response response = request.send();
        return response.getBody();
      }
  }           
