<%@ page contentType="text/html; charset=utf-8" %>
<%
	String userNum = request.getParameter("userNum");
	String name="", gender="", addr="", tel="";
	//받아온 데이터랑 db데이터랑 조회했다고 치고!
	
	if(userNum.equals("1")){
		name = "홍길동";
		gender = "남성";
		addr = "서울시 강북구";
		tel = "111-1111";
	}
	
	if(userNum.equals("2")){
		name = "강소영";
		gender = "여성";
		addr = "수원시 팔달구";
		tel = "222-2222";
	}
	
	if(userNum.equals("3")){
		name = "강모모";
		gender = "미상";
		addr = "오산시 금암마을";
		tel = "333-3333";
	}
	
%>

<%=name%>,<%=gender%>,<%=addr%>,<%=tel%>