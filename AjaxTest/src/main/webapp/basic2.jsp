<%@ page contentType="text/html; charset=utf-8" %>

<%
//db로부터 받아왔다고 가정하고
	String[] news = {"파업하는 줄도 몰랐어요, 버스정류장 텅 비고 지하철 붐벼",
			"수능 직전까지 사설 모의고사 다 훑어 '판박이 문항' 잡아낸다.",
			"민간신용비율 2분기 연속 하락!"};

%>

<%
	for(String s : news){
%>
	<%=s %>:
<%		
	}
%>