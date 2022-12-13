package api;


import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/NaverSearchAPI.do")
public class SearchAPI extends HttpServlet {
	private static final long serialVersionUID = 1L;

   
    public SearchAPI() {
    	
    }


	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//인증 정보 설정
		 String clientId = "ChrEwav6aNkGZCfwj0ca"; //애플리케이션 클라이언트 아이디
	        String clientSecret = "vAbhU8CTvw"; //애플리케이션 클라이언트 시크릿
	        //검색 조건 설정
	        int startNum = 0; //검색 시작 위치
	        String text = null;//검색어
	        try {
	        	startNum = Integer.parseInt(request.getParameter("startNum"));
	        	String searchText = request.getParameter("keyword");
	            text = URLEncoder.encode(searchText, "UTF-8");
	        } catch (UnsupportedEncodingException e) {
	            throw new RuntimeException("검색어 인코딩 실패",e);
	        }

	        //API URL 조합
	        String apiURL = "https://openapi.naver.com/v1/search/blog?query=" + text + "&display=10&start=" + startNum;    // JSON 결과
	        //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // XML 결과

	        //API 호풀
	        Map<String, String> requestHeaders = new HashMap<>();
	        requestHeaders.put("X-Naver-Client-Id", clientId);
	        requestHeaders.put("X-Naver-Client-Secret", clientSecret);
	        String responseBody = get(apiURL,requestHeaders);

	        //결과 출력
	        System.out.println(responseBody);//콘솔에 출력
	        response.setContentType("text/html; charset=utf-8");
	        response.getWriter().write(responseBody);//서블릿에서 출려
	} 


private static String get(String apiUrl, Map<String, String> requestHeaders){
    HttpURLConnection con = connect(apiUrl);
    try {
        con.setRequestMethod("GET");
        for(Map.Entry<String, String> header :requestHeaders.entrySet()) {
            con.setRequestProperty(header.getKey(), header.getValue());
        }


        int responseCode = con.getResponseCode();
        if (responseCode == HttpURLConnection.HTTP_OK) { // 정상 호출
            return readBody(con.getInputStream());
        } else { // 오류 발생
            return readBody(con.getErrorStream());
        }
    } catch (IOException e) {
        throw new RuntimeException("API 요청과 응답 실패", e);
    } finally {
        con.disconnect();
    }
}


private static HttpURLConnection connect(String apiUrl){
    try {
        URL url = new URL(apiUrl);
        return (HttpURLConnection)url.openConnection();
    } catch (MalformedURLException e) {
        throw new RuntimeException("API URL이 잘못되었습니다. : " + apiUrl, e);
    } catch (IOException e) {
        throw new RuntimeException("연결이 실패했습니다. : " + apiUrl, e);
    }
}


private static String readBody(InputStream body){
    InputStreamReader streamReader = new InputStreamReader(body);


    try (BufferedReader lineReader = new BufferedReader(streamReader)) {
        StringBuilder responseBody = new StringBuilder();


        String line;
        while ((line = lineReader.readLine()) != null) {
            responseBody.append(line);
        }


        return responseBody.toString();
    } catch (IOException e) {
        throw new RuntimeException("API 응답을 읽는 데 실패했습니다.", e);
    
}
	
}
}
