<%@page import="java.util.Date"%>
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 1000단위로 끊겨서 출력됨 -->
	<fmt:formatNumber value="10000000"/><br>
	<!-- 끊지 않고 출력하려면 -->
	<fmt:formatNumber value="10000000" groupingUsed="false"/><br>
	<!-- 패턴으로 몇번쨰 자리까지 보일지 결정 -->
	<fmt:formatNumber value="3.141598" pattern="#.###" /><br>
	<fmt:formatNumber value="0.5" type="percent" /><br>
	
	<!--통화표시-->
	<fmt:formatNumber value="2500000" type="currency" /><br>
	<fmt:formatNumber value="2500000" type="currency"  currencySymbol="$"/><br>

	<hr>
	<!-- 날짜 포맷 -->
	<c:set var="today" value="<%=new Date() %>"/>
	<!-- 날짜형태로 -->
	<fmt:formatDate value="${today }" type="date"/><br>
	
	<!-- 시간형태로 -->
	<fmt:formatDate value="${today }" type="time"/><br>
	
	<!-- 둘다 나오게 하려면 -->
	<fmt:formatDate value="${today }" type="both"/><br>
	<br>
	
	<!-- 날짜 나타내는 네가지 형식 -->
	<fmt:formatDate value="${today }" dateStyle="short"/><br>
	<fmt:formatDate value="${today }" dateStyle="medium"/><br>
	<fmt:formatDate value="${today }" dateStyle="long"/><br>
	<fmt:formatDate value="${today }" dateStyle="full"/><br>
	<br>
	
	<fmt:formatDate value="${today }" timeStyle="short" type="time"/><br>
	<fmt:formatDate value="${today }" timeStyle="medium" type="time"/><br>
	<fmt:formatDate value="${today }" timeStyle="long" type="time"/><br>
	<fmt:formatDate value="${today }" timeStyle="full" type="time"/><br>
	<br>
	<fmt:formatDate value="${today }" pattern="yyyy/MM/dd(E)"/><br>
	
	<!-- 원하는 국가형태 -->
	<fmt:setLocale value="en_us"/>
	<fmt:formatNumber value="2500000" type="currency" /><br>
	<fmt:formatDate value="${today }" type="both" dateStyle="full" timeStyle="full"/><br>
	
	<hr>
	<!-- 해당국가 표준시간 -->
	<fmt:setLocale value="ko_kr"/>
	서울 : <fmt:formatDate value="${today}" type="both"/>
	<br>
	<fmt:timeZone value="Asia/Hong_Kong">
		홍콩 : <fmt:formatDate value="${today}" type="both"/>
	</fmt:timeZone>
	<br>
	<fmt:timeZone value="Euroup/LonDon">
		런던 : <fmt:formatDate value="${today}" type="both"/>
	</fmt:timeZone>
	<br>
	<fmt:timeZone value="America/New_York">
		뉴욕 : <fmt:formatDate value="${today}" type="both"/>
	</fmt:timeZone>
	
	<!-- 문자 인코딩 -->
	<fmt:requestEncoding value="utf-8"/>
</body>
</html>
























