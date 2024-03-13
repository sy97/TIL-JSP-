<%@ page contentType="text/html; charset=utf-8" %>
[머릿말]<br>
<%
request.setCharacterEncoding("utf-8");
response.setCharacterEncoding("utf-8");
%>
<!-- 여기는 객체가 새로 생성되는 것이 아니라, 이미 인스턴스가 생성되어 있기 때문에 참조만하는것임 
그렇기 때문에 직전에 만든거랑 똑같이 적어줘야함.-->
<jsp:useBean id="incl" class="scope.IncludeBean" scope="request"/>
<jsp:getProperty property="header" name="incl"/>