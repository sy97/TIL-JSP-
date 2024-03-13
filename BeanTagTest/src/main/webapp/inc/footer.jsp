<%@ page contentType="text/html; charset=utf-8" %>
[꼬릿말]<br>
<jsp:useBean id="incl" class="scope.IncludeBean" scope="request"/>
<jsp:getProperty property="footer" name="incl"/>