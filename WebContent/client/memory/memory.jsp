<%@page import="com.etc.pojo.Memory"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>旅游记忆 | 驴友网</title>
    <meta name="Keywords" content="驴友网"/>
    <meta name="Description" content="旅游社交，在旅途中享受激情与欢乐"/>
    <meta name="baidu-site-verification" content="fGdITGCHHMB5crjs" />
    <link rel="shortcut icon" href="favicon.ico"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
	<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
	<link rel="stylesheet" href="../css/global.css" media="all"/>
	<link rel="stylesheet" href="../css/boxy,jquery.fancybox-1.3.4.css"/>
    <link rel="stylesheet" type="text/css" href="../css/index.css" media="all">
    <script type="text/javascript">
    var userjson = '';
    var c_cityinfo = '';
</script>
<!-- 合并jquery and $LAB -->

</head>

<body>
<%@include file="../header.jsp" %>
<!--top end-->

<!--main body-->
<div id="container">
<!--面朝大海-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>面朝大海</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.do">+更多</a></div>
    </div>
    	<ul class="poi_hot" id="poi_hot">
    		<%List<Memory> memory1=(List<Memory>)request.getAttribute("memory1"); %>
    	<%for(int i=0;i<4;i++){ %>
    			<li>
		            <a  title="<%=memory1.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory1.get(i).getId() %>">
						<img src="../images/<%=memory1.get(i).getPath1() %>" alt="<%=memory1.get(i).getTitle() %>" width="221" height="300">
		            </a>
		            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="<%=memory1.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory1.get(i).getId() %>"><%=memory1.get(i).getTitle() %></a></p>
		            <div class="alpha-txt intro_info">
		                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
		            </div>
				</li>
    	<%} %>
    	</ul>
    	
</div>
<!--面朝大海- end-->

<!--古镇时光-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>古镇时光</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.do">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
    	<%List<Memory> memory2=(List<Memory>)request.getAttribute("memory2"); %>
    	<%for(int i=0;i<4;i++){ %>
    			<li>
		            <a title="<%=memory2.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory2.get(i).getId() %>">
						<img src="../images/<%=memory2.get(i).getPath1() %>" alt="<%=memory2.get(i).getTitle() %>" width="221" height="300">
		            </a>
		            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="<%=memory2.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory2.get(i).getId() %>"><%=memory2.get(i).getTitle() %></a></p>
		            <div class="alpha-txt intro_info">
		                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
		            </div>
				</li>
    	<%} %>
    	
    </ul>
</div>
<!--古镇时光- end-->

<!--吃货血拼-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>吃货血拼</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.do">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
		<%List<Memory> memory3=(List<Memory>)request.getAttribute("memory3"); %>
    	<%for(int i=0;i<4;i++){ %>
    			<li>
		            <a  title="<%=memory3.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory3.get(i).getId() %>">
						<img src="../images/<%=memory3.get(i).getPath1() %>" alt="<%=memory3.get(i).getTitle() %>" width="221" height="300">
		            </a>
		            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="<%=memory3.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory3.get(i).getId() %>"><%=memory3.get(i).getTitle() %></a></p>
		            <div class="alpha-txt intro_info">
		                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
		            </div>
				</li>
    	<%} %>
    </ul>
</div>
<!--吃货血拼- end-->

<!--户外撒野-->
<div class="ui-box fn-clear">
    <div class="ui-title">
        <h2 class="ui-title-cnt fn-left"><em>户外撒野</em></h2>
        <div class="ui-title-subcnt fn-right"><a target="_blank" href="memory_list.do">+更多</a></div>
    </div>
    <ul class="poi_hot" id="poi_hot">
		<%List<Memory> memory4=(List<Memory>)request.getAttribute("memory4"); %>
    	<%for(int i=0;i<4;i++){ %>
    			<li>
		            <a  title="<%=memory4.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory4.get(i).getId() %>">
						<img src="../images/<%=memory4.get(i).getPath1() %>" alt="<%=memory4.get(i).getTitle() %>" width="221" height="300">
		            </a>
		            <p class="alpha-txt alpha-txt-green"><a target="_blank" title="<%=memory4.get(i).getTitle() %>" href="memory_detail.do?id=<%=memory4.get(i).getId() %>"><%=memory4.get(i).getTitle() %></a></p>
		            <div class="alpha-txt intro_info">
		                <p>惠州罗浮山风景区是春天爬山、泡温泉休闲好去处。</p>
		            </div>
				</li>
    	<%} %>
    </ul>
</div>
</div>
<!--户外撒野- end-->
<!--main body end-->
<div class="footer " >
    <div class="footerWrap fn-clear">
        <ul class="about_roadqu ">
            <li><a href="#">关于驴友</a>|</li>
            <li><a href="#">联系我们</a>|</li>
            <li><a href="#">用户公约</a>|</li>
            <li><a href="#">意见反馈</a>|</li>
            <li><a href="#">帮助中心</a>|</li>
            <li><a href="#">友情链接</a></li>   
        </ul>
        <div class="foot">
			<p><span>版权所有软件1001班
			<a href="#" >陈文平</a><a href="#" > 胡剑彬</a><a href="#" >林清华</a><a href="#" >汤怡青</a><a href="#" >袁泽</a><a href="#" >周晓丽</a>
			</span></p>
            <div class="sns">
				<span>关注我们： </span><a href="#" class="login_sina">新浪微博 </a><a href="#" class="login_qq">腾讯微博</a>
				<a href="#" title="360绿色网站"><img src="http://trust.360.cn/img.php?sn=5229&id=5" border="0" /></a> 
			<!-- WPA Button Begin -->
		<!-- WPA Button END -->
			</div>
		</div>
	</div>
</div>
<!-- footer end -->
</body>
</html>
