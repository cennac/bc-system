jQuery(function($){
var expiresOption = {expires: 14, path: '/'};// 14天自动过期
$("#name").focus();
function login() {
	var name = $("#name").val();
	var password = $("#password").val();

	// 验证参数
	if (!name || name.length == 0) {
		showMsg("帐号不能为空！");
		$("#name").focus();
		return;
	}
	if (!password || password.length == 0) {
		showMsg("密码不能为空！");
		$("#password").focus();
		return;
	}else{
		$("#password").attr("data-p",password);
	}

	showMsg("正在登录...");
	
	var md5password = hex_md5(password);
	if(!document.getElementById("remember").checked){// 删除cookie
		//showMsg("删除cookie...");
		$.removeCookie(bc.syskey + '_remember', {expires: 365*10, path: '/'});
		$.removeCookie(bc.syskey + '_name', expiresOption);
		$.removeCookie(bc.syskey + '_password', expiresOption);
	}else{// 勾选了自动登录，设置cookie信息
		$.cookie(bc.syskey + '_remember', "true", {expires: 365*10, path: '/'});// 这个cookie没有过期日期
		if(!$.cookie(bc.syskey + '_name')){// cookie还没有才创建
			//showMsg("创建cookie...");
			$.cookie(bc.syskey + '_name', name, expiresOption);
			$.cookie(bc.syskey + '_password', md5password, expiresOption);
		}
	}
	
	// 执行登录
	doAjaxLogin(name, md5password);
	return false;
}

// 使用帐号和加密的密码登录系统
function doAjaxLogin(name,md5password){
	$.ajax({
		url : bc.root + "/doLogin",
		data : {
			name : name,
			password : md5password//使用md5加密避免密码明文传输
		},
		type : "POST",
		dataType: "json",
		success : function(json) {
			if(json.success){
				showMsg("登录验证成功，正在进入系统&hellip;");
				//登录成功跳转到主页
				window.open(bc.root + "/index" ,"_self");
			}else{
				showMsg(json.msg);
				$.removeCookie(bc.syskey + '_name', expiresOption);
				$.removeCookie(bc.syskey + '_password', expiresOption);
			}
		},
		error : function(json) {
			showMsg("登录异常！");
		}
	});
}

// 检测cookie信息确定是否自动登录
if($.cookie(bc.syskey + '_remember')){
	document.getElementById("remember").checked = true;
	var cookieName = $.cookie(bc.syskey + '_name');
	var cookiePassword = $.cookie(bc.syskey + '_password');
	if(cookieName && cookiePassword){
		$("#name").val(cookieName);
		showMsg("正以 " + cookieName + " 自动登录...");
		doAjaxLogin(cookieName, cookiePassword);
	}
}

// 监听登录按钮的点击事件
$("#loginBtn").click(login);
// 监听帐号密码的回车时间
$(":input").keyup(function(e){
	if(e.which == 13){//按下回车键
		if(this.id=="name" && $("#password").val() == 0){
			$("#password").focus();
		}else{
			login();
		}
	}
});

// 显示提示信息
function showMsg(msg) {
	// alert(msg);
	$("#msg").html(msg);
}

//for debug: 自动以管理员登录
if(bc.debug){
	$("#name").val("admin");
	$("#password").val("888888");
	//$("#loginBtn").trigger("click");
}

//在右下角显示浏览器的版本信息 http://www.google.com/chrome/eula.html?hl=zh-CN&standalone=1
var html = '<div style="position:absolute;bottom:5px;left:5px;color:#969696;text-overflow: ellipsis;white-space: nowrap;font-size:12px;">';
if($.browser.msie){
	if($.browser.version < 8){//用户浏览器版本太低的处理
		html += "<div>当前浏览器版本太低，无法正常使用本系统，建议您使用 Chrome 浏览器! <a href='" + bc.root + "/bc/attach/download?puid=chrome17.0.963.46(default)'>内网下载</a>";
		html += "&nbsp;<a href='http://www.google.com/chrome'>外网下载</a><div>";
	}else if($.browser.version >=8 && $.browser.version < 9){//IE8升级建议
		html += "<div>当前浏览器不支持Html5，为了得到更好的用户体验和浏览速度，建议您使用 Chrome 浏览器! <a href='" + bc.root + "/bc/attach/download?puid=chrome17.0.963.46(default)'>内网下载</a>";
		html += "&nbsp;<a href='http://www.google.com/chrome'>外网下载</a><div>";
	}
}
html += '<div title="';
html += window.navigator.userAgent;
html += '">当前浏览器版本信息：';
if($.browser.msie){
	html += 'IE ' +  $.browser.version + ', ';
}
html += window.navigator.userAgent;
html += '<div></div>';
if($.browser.msie && $.browser.version < 9){
	$(html).appendTo("body");
}else{
	$("#version").attr("title",window.navigator.userAgent);
}

if($.browser.msie && $.browser.version < 8){//用户浏览器版本太低的处理
	alert("浏览器版本太低，无法正常使用本系统，建议您使用 Chrome 浏览器， 试试左下角的“下载”按钮吧！如果您使用的是双核浏览器，请切换到高速模式使用！");
}else if($.browser.msie && $.browser.version == 8){//用户浏览器版本太低的处理
	alert("浏览器版本太低，建议您使用 Chrome 浏览器， 试试左下角的“下载”按钮吧！如果您使用的是双核浏览器，请切换到高速模式使用！");
}

/** 查看系统变更日志 */
var clWin;
$("#version").click(function showChangelog(){
	try {
		if (!clWin) {
			clWin = window.open(bc.root + "/changelog/changelog.html?ts=" + bc.ts, "_blank");
		} else {
			clWin.document.location.reload(true);
			clWin.focus();
		}
	} catch (e) {
		clWin = null;
		showChangelog();
	}
	return false;
});

});