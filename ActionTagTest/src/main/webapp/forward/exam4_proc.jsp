<%@ page contentType="text/html; charset=utf-8" %>
<%
	request.setCharacterEncoding("utf-8");
	
	String toWhere = "kr.jsp";
	String lang = "korean";
	
	//무엇으로 판단해서 영어로보낼지 한국어로보낼지 ?, 원래는 아이피로 확인. 
	String from = request.getRemoteAddr();
	
	//끝나는 글자가 127.0.0.1일경우
	if(from.endsWith("127.0.0.1")){
		toWhere = "eng.jsp";
		lang = "english";
	}
	
%>
<!-- exam4에서 입력받은 name이랑 addr이 그대로 전달돼서 kr.jsp로 넘어감.
하지만 lang은 여기서 추가된거라 전달해줘야함. -->
<jsp:forward page="<%=toWhere%>">
	<jsp:param name="lang" value="<%=lang %>"/>
</jsp:forward>