<%@ page language="java" pageEncoding="utf-8" %>
<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<link href="src/css/create_activity.css" rel="stylesheet" type="text/css"/>
<link href="src/css/jquery.datepick.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="src/jquery-1.3.2.js"></script>
<script type="text/javascript" src="src/js/common.js"></script>
<script type="text/javascript" src="src/datepick/jquery.datepick.js"></script>
<script type="text/javascript">
$(function(){
$(".popupDatepicker").datepick();
});
</script>
<title>创建活动</title>
</head>
<body>
<div id="header">在线日历系统</div>
<p>&nbsp;</p>
<div id="left">
  <div id="zhuangtai">创建状态
  </div>
  <div id="fabuhuodong"><a href="activity2!addPage.action">发布活动</a></div>
  <div id="haoyou">好友框 </div>
  <div id="chakanhuodong"><a href="activity2!viewAct.action">查看活动</a></div>
  <div id="rili">我的日历</div>
</div>
<div id="middle">
<form id='create' action="activityAction!create_act.action">
<div id='middle_left'>
<div id='act_name'>活动序号<br><input type="text" name="act_id"></div>
<div id='act_start_time'>开始时间<br><input type="datetime" name="start_time" class="popupDatepicker"></div>
<div id='act_end_time'>结束时间<br><input type="datetime" name="end_time" class="popupDatepicker"></div>
<div>人数<br><input type="number" name="capacity"><br></div>
<div>隐私<br><input type="number" name="privacy"><br></div>
<div id='act_place'>活动地点</div>
<div id='act_info'>活动详情<br><textarea name="description" cols="50" style="height: 122px; "></textarea><br>
<input type="submit" value="submit">
</div>
</div>
<div id='middle_right'>
<div id='middle_right_up'>
<div id='yaoqing'>邀请</div>
<div id='chazhao'>查找</div>
</div>
<div id='middle_right_down'></div>
</div>
</form>
</div>
<div id="right" onmouseover="right_change();" onmouseout="right_change2();"></div>
<p>&nbsp;</p>


</body>
</html>
