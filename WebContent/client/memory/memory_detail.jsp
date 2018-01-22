<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="zh"><!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <title>旅游记忆 | 驴友网</title>
        <meta name="keywords" content="旅游社交，在旅途中享受激情与欢乐" />
        <meta name="description" content="旅游社交，在旅途中享受激情与欢乐"/>
        <link rel="shortcut icon" href="../favicon.ico">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<meta http-equiv="mobile-agent" content="format=html5; url=http://m.roadqu.com">
		<link rel="stylesheet" href="../css/global.css" media="all">
		<link rel="stylesheet" href="../css/boxy,jquery.fancybox-1.3.4.css">
        <link rel="stylesheet" type="text/css" href="../css/huidong.css">
        <script type="text/javascript">
			var userjson = '';
			var c_cityinfo = '';
		</script>
	</head>
    
<body>
<%@include file="../header.jsp" %>

<div id="container">
	<div class="ui-box fn-clear">
			<p><img src="../images/${memDetail.path1 }" style="height:200px; width:300px; float:left; padding-right:5px;" >
			&nbsp;&nbsp;&nbsp;&nbsp;标题：${memDetail.title }<br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;类别：<c:if test="${memDetail.kind==1 }">面朝大海</c:if> 
			<c:if test="${memDetail.kind==2 }">古镇时光</c:if> 
			<c:if test="${memDetail.kind==3 }">吃货血拼</c:if>
			<c:if test="${memDetail.kind==4 }">户外撒野</c:if>
			&nbsp;&nbsp;&nbsp;&nbsp;发布者：${memDetail.name }&nbsp;&nbsp;&nbsp;&nbsp;发布时间：${memDetail.cdate}<br /><br />
			&nbsp;&nbsp;&nbsp;&nbsp;内容：${memDetail.content }</p>
	</div>
	
	<div class="ui-box fn-clear">
		<div id="comment" class="comment cnt-box fn-clear">
			<h2>发表评论</h2>
			<div class="comment_headPic fn-left">
				<a href="#"><img width="75" height="75" alt="i闲逛" src="../images/default.jpg">	</a>
			</div>
			<div class="comment_info fn-right">
			<div class="cont fn-clear">
				<form action="mreply_insert.do" method="post" >
				<textarea class="talkBox" id="comment_box" 
				style="float:left" name="content"></textarea>
				<input type="hidden" name="lyjy_id" value="${param.id }">
				<input type="submit" class="sendBtn" value="评论" name="sendinsert"
				onclick="return check(this.form)">
			</form>
			</div>
			</div>
		</div>				
	</div>
	
	<div class="mainWrap wide-wrap fn-clear">
		<div class="main">
			<!--comments-->
			<div id="comment" class="comment cnt-box fn-clear">
				<h2>所有评论</h2>
					<ul id="comment-list" class="comment-list">
						<c:forEach items="${mreply }" var="mre">
						<li class="fn-clear">
							<div class="comment_headPic fn-left">
								<a href="#"><img width="75" height="75" alt="i闲逛" src="../images/default.jpg"> </a>
							</div>
							
							<div class="comment_info fn-right">
								<p>
									<a class="comment_user" href="#"> ${mre.username }</a>${mre.time}
								</p>
								<div class="comment_box">
									<div class="SA">
										<em>◆</em><span>◆</span>
                                    </div>
									<div class="comment_cnt">${mre.content} <a href='#' >#一起玩旅游圈之试玩团心声#</a> 
                                    </div>
                                </div>
                            </div>
                           
                        </li>
                         </c:forEach>
					</ul>
					
					<!--分页-->
					<div class="no-pages cf">
						<c:if test="${currentPage>1 }">
							<a href="memory_detail.do?id=${param.id }&p=${currentPage-1 }" class="pageBtn">上一页 &lt;&lt;</a>
						</c:if>
						<c:forEach begin="1" end="${length }" step="1" var="i">
							<c:if test="${currentPage==i }">
								<strong>${i }</strong>
							</c:if>
							<c:if test="${currentPage!=i }">
								<a href="memory_detail.do?id=${param.id }&p=${i }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage<length }">
							<a href="memory_detail.do?id=${param.id }&p=${currentPage+1 }" class="pageBtn">下一页 &gt;&gt;</a>
						</c:if>
					</div>
				
				</div>
			</div>
		</div>
	</div>
	
	<!-- 底部footer 开始-->
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