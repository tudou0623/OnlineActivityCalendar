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
	<div id="header">��������ϵͳ</div>
<div id="log_left">
<h1>
Oacal �Ƿǳ�ţ�Ƶ��ճ̹�����վ<br>
Oacal ������ʱ���ĳ���<br>
Oacal ���㲻����ѡ��<br>
Oacal ����Ϊ�㲻�ɻ�ȱ��һ����<br>
<br><br>
������ԥʲô��<br>
�Ͻ��������ǰɣ�����<br>
</h1>
</div>

<div id="log_right"><h2>
			This is my login page.
			<s:form action="login2.action">
				<s:textfield name="userLoginID" label="�û���" />
				<s:password name="userPwd" label="����"/>
				<s:submit name="login" value="��¼" align="left" method="login" />
				<s:submit name="register" value="ע��" align="left" method="register" />
			</s:form>
		</h2></div>
	</body>
</html>