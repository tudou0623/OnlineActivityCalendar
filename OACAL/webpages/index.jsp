<%@ page language="java" pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<html>
	<head>
	<script type="text/javascript" src="src/js/common.js"></script>
<link href="src/css/index.css" rel="stylesheet" type="text/css"/>
		<title>welcome</title>
	</head>
	
	<body>
	<div id="header">在线日历系统
	     <div style="red">
			<h2>
				亲爱的
				<s:property value="userLoginID" />
				，欢迎您！
				</h2>
		</div>
	</div>
<p>&nbsp;</p>
<div id="left">
  <div id="zhuangtai">创建状态
  </div>
  <div id="fabuhuodong" onclick=""><a href="activity2!addPage.action">发布活动</a>
  </div>
  <div id="haoyou">好友信息</div>
  <div id="chakanhuodong" onclick=""><a href="activity2!viewAct.action">查看活动</a></div>
  <div id="rili" onclick="">我的日历</div>
<p>&nbsp;</p>
</div>
<div id="middle">
<div id="middle_up"></div>
<div id="middle_table">
    <table width="100%" height="600" border="1">
      <tr height="120">
        <td width="14.3%">&nbsp;</td>
        <td width="14.3%">&nbsp;</td>
        <td width="14.3%">&nbsp;</td>
        <td width="14.3%">&nbsp;</td>
        <td width="14.3%">&nbsp;</td>
        <td width="14.3%">&nbsp;</td>
        <td width="14.2%">&nbsp;</td>
      </tr>
      <tr height="120">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr height="120">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr height="120">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr height="120">
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </div>
</div>
<div id="right" onmouseover="right_change();" onmouseout="right_change2();"></div>
<p>&nbsp;</p>
	</body>
</html>