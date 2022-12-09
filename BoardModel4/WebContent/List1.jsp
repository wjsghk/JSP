<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>파일 첨부형 게시판 - 목록 보기(List)</h2>

    <!-- 검색 폼 -->
    <form method="get">  <!-- action="http://localhost:8081/BoardModel2/list.do" -->
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField">
                <option value="title">제목</option>
                <option value="content">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>
    </table>
    </form>
    
    <table border="1" width="90%">
        <tr>
            <th width="10%">번호</th>
            <th width="*">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">조회수</th>
            <th width="15%">작성일</th>
            <th width="8%">첨부</th>
        </tr>
        <c:choose>
	        
	        <c:when test="${empty boardLists }">
		        <tr>
		            <td colspan="6" align="center">
		                등록된 게시물이 없습니다^^*
		            </td>
		        </tr>
	        </c:when>
	        
	        <c:otherwise>
	        	<c:forEach items="${boardLists }" var = "row" varStatus="loop">
			        <tr>	
			        	<td>${ map.totalCount - (((map.pageNum-1) * map.pageSize) + loop.index)} </td>
			        	<td><a href="view.do">${row.title }</a></td>
			        	<td>${row.name }</td>
			        	<td>${row.visitcount }</td>
			        	<td>${row.postdate }</td>
			        	<td><a href="download.do">[DOWN]</a></td>
			        </tr>
		        </c:forEach>
	        </c:otherwise>
        </c:choose>
     </table>
     
     <table border="1" width="90%">
        <tr align="center">
        	<td>${map.pagingImg }</td>
        	<td width="100">
        	<button type="button" onclick="location.href='wirte.do'">글쓰기</button></td>
        </tr>
     </table>
</body>
</html>





