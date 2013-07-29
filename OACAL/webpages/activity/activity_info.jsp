<%@ page language="java" import="java.util.*"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <link href="src/css/activity_info.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="src/js/common.js"></script>
    <title>My JSP 'activity_info.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="header">在线日历系统</div>
<p>&nbsp;</p>
<div id="wrapper" style="overflow:hidden">
<div id="left">
  <div id="zhuangtai">创建状态</div>
  <div id="fabuhuodong"><a href="activity2!addPage.action">发布活动</a></div>
  <div id="haoyou">好友框 </div>
  <div id="chakanhuodong"><a href="activity2!viewAct.action">查看活动</a></div>
  <div id="rili" onclick="window.location='./index.html'">我的日历</div>
<p>&nbsp;</p>
</div><!--end of left-->

<div id="middle">
<div id="middle_left">
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity1</div>
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity2</div>
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity3</div>
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity4</div>
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity5</div>
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity6</div>
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity7</div>
<div class="activity" onmouseover="expand(this)" onmouseout="shrink(this)">activity8</div>
</div><!--end of middle_left-->
<div id="middle_right">
<div class="category">category1</div>
<div class="category">category2</div>
<div class="category">category3</div>
<div class="category">category4</div>
<div class="category">category5</div>
<div class="category">category6</div>
</div><!--end of middle_right-->
</div><!--end of middle-->

<div id="right" onmouseover="right_change();" onmouseout="right_change2();">
<div id="display_size">
<div>
</div>
<div id="display_time">
<div class="d_time">本月</div>
<div class="d_time">本周</div>
<div class="d_time">今天</div>
<div class="d_time">历史</div>
</div>
</div><!--end of right-->
</div><!--end of wrapper -->
<p>&nbsp;</p>
  </body>
</html>
