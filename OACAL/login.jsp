<%@ page language="java" pageEncoding="gb2312" %>
<%@ page contentType="text/html; charset=gb2312"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
	<head>
	<link href="src/css/login.css" rel="stylesheet" type="text/css"/>
		<title>OACAL index page</title>		
	</head>
	
	<body>
	<div id="header">在线日历系统</div>
<div id="log_left">
<h1>
Oacal 是非常牛逼的日程管理网站<br>
Oacal 将引领时代的潮流<br>
Oacal 是你不二的选择<br>
Oacal 将成为你不可或缺的一部分<br>
<br><br>
还在犹豫什么！<br>
赶紧加入我们吧！！！<br>
</h1>
</div>

<div id="log_right"><h2>
			This is my login page.
			<s:form action="login2.action">
				<s:textfield name="userLoginID" label="用户名" />
				<s:password name="userPwd" label="密码"/>
				<s:submit name="login" value="登录" align="left" method="login" />
				<s:submit name="register" value="注册" align="left" method="register" />
			</s:form>
		</h2></div>
	</body>
</html>