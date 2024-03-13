<%@ page contentType="text/html; charset=utf-8" %>
[머릿말]<br>
<!-- 여기는 객체가 새로 생성되는 것이 아니라, 이미 인스턴스가 생성되어 있기 때문에 참조만하는것임 -->
<jsp:useBean id="incl" class="scope.IncludeBean" scope="request"/>
<jsp:getProperty property="header" name="incl"/>