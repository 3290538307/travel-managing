<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="c" 
           uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html lang="zh">
    <head>
        <meta charset="utf-8">
        <title>好友申请 | 驴友网</title>
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
	<div class="mainWrap wide-wrap fn-clear">
		<div class="main">
			<!--comments-->
			<div id="comment" class="comment cnt-box fn-clear">
				<h2>好友申请</h2>
					<ul id="comment-list" class="comment-list">
					<c:forEach items="${applyFriends }" var="apply">
						<li class="fn-clear">
							<div class="comment_headPic fn-left">
								<c:if test="${empty apply.imagepath }">
									<img width="75" height="75"  src="../images/default.jpg">
								</c:if>
								<c:if test="${ not empty apply.imagepath }">
									<img width="75" height="75"  src="../images/${apply.imagepath }">
								</c:if>
							</div>
							<div class="comment_info fn-right">
								<p>
									<a class="comment_user" href="#"> ${apply.name }</a>申请于&nbsp;&nbsp;${apply.time }
									<label style="float:right"><a class="comment_user" href="agree.do?id=${apply.id }">同意</a><a class="comment_user" href="refuse.do?id=${apply.id }">拒绝</a></label>
								</p>
								<div class="comment_box">
									<div class="SA">
										<em>◆</em><span>◆</span>
                                    </div>
									<div class="comment_cnt">请求加您为好友。</a> 
                                            
                                    </div>
                                </div>
                            </div>
                        </li>
					</c:forEach>
					</ul>
					
					<!--分页-->
					<div class="no-pages cf">
						<c:if test="${currentPage>1 }">
							<a href="apply.do?p=${currentPage-1 }" class="pageBtn">上一页 &lt;&lt;</a>
						</c:if>
						<c:forEach begin="1" end="${length }" step="1" var="i">
							<c:if test="${currentPage==i }">
								<strong>${i }</strong>
							</c:if>
							<c:if test="${currentPage!=i }">
								<a href="apply.do?p=${i }">${i }</a>
							</c:if>
						</c:forEach>
						<c:if test="${currentPage<length }">
							<a href="apply.do?p=${currentPage+1 }" class="pageBtn">下一页 &gt;&gt;</a>
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