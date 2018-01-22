<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<body>
<%  
String path = request.getContextPath();  
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/client";  
%>  
	<script type="text/javascript">
	 var websocket1 = null;
	 var websocket2=null;
    //判断当前浏览器是否支持WebSocket
    if ('WebSocket' in window) {
        websocket1 = new WebSocket("ws://localhost:8080/good/good/${uid}");
        websocket2=new WebSocket("ws://localhost:8080/good/message/${uid}");
    }
    else {
    	
        alert('当前浏览器 Not support websocket');
    }
    window.setInterval(showalert, 1000); 
    function showalert() 
    { 
    	websocket1.send(${uid});
    	websocket2.send(${uid});
    } 
    websocket1.onmessage = function (event) {
    	document.getElementById('fc').innerHTML=event.data;
    }
    websocket2.onmessage = function (event) {
    	document.getElementById('msg').innerHTML=event.data;
    }
    

	</script>
	
<div class="header">
    <div class="headWrap">
        <div class="headTop fn-clear">
            <h1 class="logo">
                <a href="index.do" title="驴友网" style="float: left;" >驴友网</a>
            </h1>
            <h2 class="slogan" title="在旅途中相遇">在旅途中相遇</h2>

            <div class="loginInfo">
            	<%if(session.getAttribute("name")==null){ %>                
                <ul class="not_login">
               
                    <li style="float:right"><a href="<%=basePath %>/login/register.jsp" class="btn_reg">注册</a></li>
                    <li  style="float:right"><a href="<%=basePath %>/login/login.jsp"  id="top-nav-login" class="btn_login">登录</a></li>
                </ul><%}else{ %>
                	<li style="float:right"><a href="<%=basePath %>/notice/message.do">站内信（<span id="msg"></span>）</a>&nbsp;&nbsp;&nbsp;</li>
                	<li style="float:right"><a href="<%=basePath %>/notice/apply.do">好友申请（<span id="fc"></span>）</a>&nbsp;&nbsp;&nbsp;</li>

                	<li style="float:right"><a href="<%=basePath %>/logout.do?name=<%=session.getAttribute("name")  %>">注销</a></li> 
                	<li style="float:right"><a href="<%=basePath %>/user/state.do"><%=session.getAttribute("name") %></a>&nbsp;&nbsp;&nbsp;&nbsp;</li>
                <%} %>
                
            </div>
        </div>

        <ul class="dropdown">
            <li class="current">
                <a href="<%=basePath %>/index.do" >首页</a>
            </li>
            <li>
                <a href="<%=basePath %>/memory/memory.do">旅游记忆</a>
            </li>
            <li>
				<a href="<%=basePath %>/traveller/traveller.do">结伴游</a>
			</li>
            <li>
				<a href="<%=basePath %>/strategy/strategy.do">景点攻略</a>
			</li>
		</ul>
				 
		<div class="navSearch">
			<form action="<%=basePath %>/memory/memory_search.jsp" method="get" id="searchForm" target="_blank">
				<input name="k" type="text" class="top-search-input" id="searchKey" value="搜索旅游记忆" maxlength="50" autocomplete="off"/>
                <input name="" type="submit" value="搜索" class="search_btn">
            </form>
			<div id="keyword_tip_content"></div>
		</div>
	</div>
</div>
<!--top end-->