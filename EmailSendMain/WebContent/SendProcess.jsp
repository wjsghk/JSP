<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@page import= "java.util.Map" %>
<%@page import= "java.util.HashMap" %>
<%@page import= "java.io.BufferedReader" %>
<%@page import= "java.io.FileReader" %>
<%@page import= "smtp.NaverSMTP" %>
<% request.setCharacterEncoding("UTF-8"); %>
<%
//폼값 (이메일내용)저장
Map<String,String> emailInfo = new HashMap<String,String>();
emailInfo.put("from",request.getParameter("from"));//보내는 사람
emailInfo.put("to",request.getParameter("to"));//받는 사람
emailInfo.put("subject",request.getParameter("subject"));//제목

//내용은 메일 포맷에 따라 다르게 처리
String content = request.getParameter("content");
String format = request.getParameter("format");
if(format.equals("text")){
	//텍스트 포맷일 때는 그대로 저장
	emailInfo.put("content",content);
	emailInfo.put("format","text/plain;charset=UTF-8");
}
else if (format.equals("html")){
	//html 포맷일때는 html형태로 변환해 저장
	content = content.replace("\r\n","<br/>");//줄 바꿈을 html형태로 수정
	String htmlContent = "";//html용으로 변환된 내용을 담아 담을 변수
	try{
		//html 메일용 템플릿 파일 읽기
		String templatePath = application.getRealPath("MailForm.html");
		BufferedReader br = new BufferedReader(new FileReader(templatePath));
		
		//한줄씩 읽어 htmlcontent 변수에 저장
		String oneLine;
		while((oneLine = br.readLine())!=null){
			htmlContent += oneLine + "\n";
		}
		br.close();
	}
	catch(Exception e){
		e.printStackTrace();
	}
	//템플릿의 "__CONTENT__"부분을 메일 내용으로 대체 (변환완료)
	htmlContent = htmlContent.replace("__CONTENT__", content);
	
	emailInfo.put("content",htmlContent);
	emailInfo.put("format","text/html;charset=UTF-8");
}

try{
	NaverSMTP smtpServer = new NaverSMTP();//메일 전송 클래스 생성
	smtpServer.emailSending(emailInfo);//전송
	out.print("이메일 전송 성공");
}
catch(Exception e){
	out.print("이메일 전송 실패");
	e.printStackTrace();
}
%>
<title>Insert title here</title>
</head>
<body>

</body>
</html>