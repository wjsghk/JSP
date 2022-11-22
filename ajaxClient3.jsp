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
            url: './112103ajaxServer3.jsp',
            type:'post',
            dataType:'json',
            success:function(data){   
               $.each(data,function(i,d){
                  $("#info").before("<p>" + d.nickName + "</p>");
                  $("#info").before("<p>" + d.ph_number + "</p>");
                  $("#info").before("<p>" + d.address + "</p>");
                  
                  /*$("#info").before("<p>" + data[i].nickName + "</p>"); //배열형식
                  $("#info").before("<p>" + data[i].ph_number + "</p>");
                  $("#info").before("<p>" + data[i].address + "</p>");*/
               });
            }
         });
      });      
   });
</script>
</head>
<body>
   <input id="buttonSubmit" type="button" value="제출">
   <div id="info"></div>
</body>
</html>