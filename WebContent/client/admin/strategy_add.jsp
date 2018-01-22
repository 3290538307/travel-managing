<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<!--
		Charisma v1.0.0

		Copyright 2012 Muhammad Usman
		Licensed under the Apache License v2.0
		http://www.apache.org/licenses/LICENSE-2.0

		http://usman.it
		http://twitter.com/halalit_usman
	-->
	<meta charset="utf-8">
	<title>后台管理---添加攻略</title>
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<meta name="description" content="Charisma, a fully featured, responsive, HTML5, Bootstrap admin template.">
	<meta name="author" content="Muhammad Usman">

	<!-- The styles -->
	<link id="bs-css" href="css/bootstrap-cerulean.css" rel="stylesheet">
	<style type="text/css">
	  body {
		padding-bottom: 40px;
	  }
	  .sidebar-nav {
		padding: 9px 0;
	  }
	</style>
	<link href="css/bootstrap-responsive.css" rel="stylesheet">
	<link href="css/charisma-app.css" rel="stylesheet">
	<link href="css/jquery-ui-1.8.21.custom.css" rel="stylesheet">
	<link href='css/fullcalendar.css' rel='stylesheet'>
	<link href='css/fullcalendar.print.css' rel='stylesheet'  media='print'>
	<link href='css/chosen.css' rel='stylesheet'>
	<link href='css/uniform.default.css' rel='stylesheet'>
	<link href='css/colorbox.css' rel='stylesheet'>
	<link href='css/jquery.cleditor.css' rel='stylesheet'>
	<link href='css/jquery.noty.css' rel='stylesheet'>
	<link href='css/noty_theme_default.css' rel='stylesheet'>
	<link href='css/elfinder.min.css' rel='stylesheet'>
	<link href='css/elfinder.theme.css' rel='stylesheet'>
	<link href='css/jquery.iphone.toggle.css' rel='stylesheet'>
	<link href='css/opa-icons.css' rel='stylesheet'>
	<link href='css/uploadify.css' rel='stylesheet'>

	<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
	<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- The fav icon -->
	<link rel="shortcut icon" href="img/favicon.ico">
		
</head>

<body>

		<!-- topbar starts -->
	<%@include file="sidebar.jsp" %>
			
						
			<noscript>
				<div class="alert alert-block span10">
					<h4 class="alert-heading">Warning!</h4>
					<p>You need to have <a href="http://en.wikipedia.org/wiki/JavaScript" target="_blank">JavaScript</a> enabled to use this site.</p>
				</div>
			</noscript>
			
			<div id="content" class="span10">
			<!-- content starts -->
			

			<div>
				<ul class="breadcrumb">
					<li>
						<a href="#">旅游攻略</a> <span class="divider">/</span>
					</li>
					<li>
						<a href="#">添加攻略</a>
					</li>
				</ul>
			</div>
			
			<div class="row-fluid sortable">
				<div class="box span12">
					<div class="box-header well" data-original-title>
						<h2><i class="icon-edit"></i> 添加攻略</h2>
						<div class="box-icon">
							<a href="#" class="btn btn-setting btn-round"><i class="icon-cog"></i></a>
							<a href="#" class="btn btn-minimize btn-round"><i class="icon-chevron-up"></i></a>
							<a href="#" class="btn btn-close btn-round"><i class="icon-remove"></i></a>
						</div>
					</div>
					<div class="box-content">
						<form class="form-horizontal" action="strategy_add.do" >
						  <fieldset>
							<div class="control-group">
							  <label class="control-label" for="typeahead">标题 </label>
							  <div class="controls">
								<input type="text" name="title" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" >
								<p class="help-block">请输入标题!</p>
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="typeahead">目的地 </label>
							  <div class="controls">
								<input type="text" name="spot" class="span6 typeahead" id="destination"  data-provide="typeahead" data-items="4" >
								<p class="help-block">请输入目的地!</p>
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="date01">适宜时间</label>
							  <div class="controls">
								<input type="text" name="triptime" class="input-xlarge datepicker" id="date01" value="季节/时间">
							    <p class="help-block">自己编辑或选择!</p>								
							  </div>
							</div>
							<div class="control-group">
							  <label class="control-label" for="typeahead">适宜人群</label>
							  <div class="controls">
								<input type="text" name="people" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" >				
							  </div>
							</div>	
							<div class="control-group">
							  <label class="control-label" for="fileInput">图片</label>
							  <div class="controls">
								<input class="input-file uniform_on" name="imgpath" id="fileInput" type="file">
							  </div>
							</div>
							  <div class="control-group">
								<label class="control-label" for="selectError">类型</label>
								<div class="controls">
								  <select id="selectError" name="triptype" data-rel="chosen" >
								    <option>     </option>
									<option>主题游</option>
									<option>时令游</option>
									<option>其它</option>
								  </select>
								</div>
							  </div>							          
							<div class="control-group">
							  <label class="control-label" for="textarea2">简介</label>
							  <div class="controls">
								<textarea class="cleditor" name="content" id="textarea2" rows="3"></textarea>
							  </div>
							</div>	
							<div class="control-group">
							  <label class="control-label" for="typeahead">必备装备</label>
							  <div class="controls">
								<input type="text" name="equipment" class="span6 typeahead" id="typeahead"  data-provide="typeahead" data-items="4" >				
							  </div>
							</div>	
							<div class="control-group">
							  <label class="control-label" for="typeahead">注意事项</label>
							  <div class="controls">
								<textarea class="autogrow" name="notice"></textarea>				
							  </div>
							</div>		
							<div class="control-group">
							  <label class="control-label" for="typeahead">详情</label>
							  <div class="controls">
								<textarea class="autogrow"name="summary" ></textarea>				
							  </div>
							</div>																			
							<div class="form-actions">
							  <button type="submit" class="btn btn-primary" >发布攻略</button>
							  <button type="reset" class="btn">取消</button>
							</div>
						  </fieldset>
						</form>   

					</div>
				</div><!--/span-->

			</div><!--/row-->

	<!-- external javascript
	================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->

	<!-- jQuery -->
	<script src="js/jquery-1.7.2.min.js"></script>
	<!-- jQuery UI -->
	<script src="js/jquery-ui-1.8.21.custom.min.js"></script>
	<!-- transition / effect library -->
	<script src="js/bootstrap-transition.js"></script>
	<!-- alert enhancer library -->
	<script src="js/bootstrap-alert.js"></script>
	<!-- modal / dialog library -->
	<script src="js/bootstrap-modal.js"></script>
	<!-- custom dropdown library -->
	<script src="js/bootstrap-dropdown.js"></script>
	<!-- scrolspy library -->
	<script src="js/bootstrap-scrollspy.js"></script>
	<!-- library for creating tabs -->
	<script src="js/bootstrap-tab.js"></script>
	<!-- library for advanced tooltip -->
	<script src="js/bootstrap-tooltip.js"></script>
	<!-- popover effect library -->
	<script src="js/bootstrap-popover.js"></script>
	<!-- button enhancer library -->
	<script src="js/bootstrap-button.js"></script>
	<!-- accordion library (optional, not used in demo) -->
	<script src="js/bootstrap-collapse.js"></script>
	<!-- carousel slideshow library (optional, not used in demo) -->
	<script src="js/bootstrap-carousel.js"></script>
	<!-- autocomplete library -->
	<script src="js/bootstrap-typeahead.js"></script>
	<!-- tour library -->
	<script src="js/bootstrap-tour.js"></script>
	<!-- library for cookie management -->
	<script src="js/jquery.cookie.js"></script>
	<!-- calander plugin -->
	<script src='js/fullcalendar.min.js'></script>
	<!-- data table plugin -->
	<script src='js/jquery.dataTables.min.js'></script>

	<!-- chart libraries start -->
	<script src="js/excanvas.js"></script>
	<script src="js/jquery.flot.min.js"></script>
	<script src="js/jquery.flot.pie.min.js"></script>
	<script src="js/jquery.flot.stack.js"></script>
	<script src="js/jquery.flot.resize.min.js"></script>
	<!-- chart libraries end -->

	<!-- select or dropdown enhancer -->
	<script src="js/jquery.chosen.min.js"></script>
	<!-- checkbox, radio, and file input styler -->
	<script src="js/jquery.uniform.min.js"></script>
	<!-- plugin for gallery image view -->
	<script src="js/jquery.colorbox.min.js"></script>
	<!-- rich text editor library -->
	<script src="js/jquery.cleditor.min.js"></script>
	<!-- notification plugin -->
	<script src="js/jquery.noty.js"></script>
	<!-- file manager library -->
	<script src="js/jquery.elfinder.min.js"></script>
	<!-- star rating plugin -->
	<script src="js/jquery.raty.min.js"></script>
	<!-- for iOS style toggle switch -->
	<script src="js/jquery.iphone.toggle.js"></script>
	<!-- autogrowing textarea plugin -->
	<script src="js/jquery.autogrow-textarea.js"></script>
	<!-- multiple file upload plugin -->
	<script src="js/jquery.uploadify-3.1.min.js"></script>
	<!-- history.js for cross-browser state change on ajax -->
	<script src="js/jquery.history.js"></script>
	<!-- application script for Charisma demo -->
	<script src="js/charisma.js"></script>
	
		
</body>
</html>
