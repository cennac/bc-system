<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	response.setHeader("Pragma", "No-cache");
	response.setHeader("Cache-Control", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1" />
<title><s:text name="app.title" />
</title>
<link rel="shortcut icon" type="image/x-icon" href="<s:url value='/login/images/favicon.png'><s:param name='ts' value='ts'/></s:url>"/>
<link rel="stylesheet" type="text/css"
	href="<s:url value='/login/login.css' ><s:param name='ts' value='%{getText("app.ts")}'/></s:url>" />
</head>
<body>
	<form method="post" action="./" name="loginForm">
		<img class="appLogo" src="<s:url value='/login/images/logo-bc.png'/>" title="<s:text name='app.title'/> V<s:text name='app.version'/>"/>
		<div class="textContainer">
			<input type="text" id="name" placeholder="帐号"/>
			<div class="accountIcon"><img src="<s:url value='/login/images/user.png'/>"/></div>
		</div>
		<div class="textContainer">
			<input type="password" id="password" placeholder="密码"/>
			<div class="passwordIcon"><img src="<s:url value='/login/images/key.png'/>"/></div>
			<div class="submitIcon" id="loginBtn" title="登录"><img src="<s:url value='/login/images/go.png'/>"/></div>
		</div>
	</form>
	<div id="version"><s:text name="app.version"/></div>
	<div id="msg" data-auth='${bcauth}'></div>
	
	<s:if test='%{"true" != getText("app.product")}'><div id="test"><s:text name="app.debugInfo"/></div></s:if>
	
	<script type="text/javascript">
		var bc={};
		bc.debug = <s:text name="app.debug" />;
		bc.ts = bc.debug ? new Date().getTime() : "<s:text name="app.ts" />";
		bc.root = "<%=request.getContextPath()%>";
	</script>
	<script type="text/javascript" src="<s:url value='/ui-libs/jquery/1.7.2/jquery.min.js'/>"></script>
	<script type="text/javascript" src="<s:url value='/ui-libs/jshash/2.2/md5-min.js'/>"></script>
	<script type="text/javascript" src="<s:url value='/login/login.js' ><s:param name='ts' value='%{getText("app.ts")}'/></s:url>"></script>
</body>
</html>