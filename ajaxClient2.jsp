<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<script type="text/javascript">
   $(function(){
      $("#buttonSubmit").on("click",function(){ //제출 버튼 이벤트 지정
         $.ajax({
          	url : './ajaxServer2.jsp',
          	type : 'get',
          	dataType: 'json',
          	success:function(data){
          		$("#nickName").text(data.nickName);
          		$("#ph_number").text(data.ph_number);
          		$("#address").text(data.address);
          	}
         });
      });      
   });
</script>
</head>
<body>
	<input id="buttonSubmit" type="button" value="제출">
	<p id="nickName"></p>
	<p id="ph_number"></p>
	<p id="address"></p>
</body>
</html>