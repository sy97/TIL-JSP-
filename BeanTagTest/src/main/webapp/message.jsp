<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>message.jsp</title>
</head>
<body>
	<%
		String msg = "JSP를 배웁시다.";
	%>
	
	Message : <%=msg%>
	<!-- 위와같은 자바코드가 더이상 jsp에 들어있지 않게 하자. 클래스로 따로 만들자. -->
	
	<hr/>
	<!-- 클래스르 만들고 쓰려면 객체생성을 해야함.
	simple.MessageBean msg1 = new simple.MessageBean(); 
	이걸 태그를 통해서 할 수 있음.-->
	
	<!-- 아이디 자율, class="객체생성하고싶은 클래스" -->
	<jsp:useBean id="msg1" class="simple.MessageBean"></jsp:useBean>
	
	<!-- 원래는 msg1.setMsg("jsp를 배웁시다") -->
	<!-- property="메서드이름" , name-"id의 값, 즉 변수이름" 
	여기서 반드시 지켜야할 규칙은, setter메서드 호출할 때는 set생략, 그리고 첫글자는 대문자
	단, 불러 쓸 때는 소문자로 써야함.
	jsp:setproperty에 있는 set이랑 property뒤의 글자랑 합쳐져서 메서드이름이 됨.
	그래서 jsp에서는 자바 게터와 세터는 반드시 get, set으로 시작해야함.-->
	
	<jsp:setProperty property="msg" name="msg1" value="JSP를 배웁시다."/>
	
	
	Message : <jsp:getProperty property="msg" name="msg1"/>
	<hr/>
	
	<!-- 액션태그를 사용하지 않는경우 -->
	<%
	//simple.MessageBean msg2 = new simple.MessageBean(); 
	//액션태그에서 만든 객체는 이렇게 사용가능함. 단, 반대는안됨.
	msg1.setMsg("JSP를 배웁시다.");
	%>
	Message : <%=msg1.getMsg() %>
	
</body>
</html>

<!-- 
	설계도를 보고 클래스를 만들 수 있어야한다.
	class name : simple.MessageBean
	property : 
		name 			r/w(READ:GET/WRITE:SET)		data type		desc(설명)
		---------------------------------------------------------------------
		msg(getMsg) 	r/w(게터세터둘다)				String			메시지 입출력기능
		
 -->