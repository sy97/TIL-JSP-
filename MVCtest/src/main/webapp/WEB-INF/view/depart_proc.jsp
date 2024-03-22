<%@page import="mybean.model.DepartmentBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=utf-8" %>

	<%
	//서블릿으로부터 값 가져와서 보여주기. View의 역할만 할수있게.
	ArrayList<String> advice = (ArrayList)request.getAttribute("advice");
	%>
	<h1>학과선택에 따른 결과입니다.</h1>
	
	<% 
		for(String s : advice){
	%>		
			
		<div style="color:blue"><%=s %></div>
	<%		
		}
	%>