<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="system/easyui_header_plugin.jsp"%>
<html>
<title>用户登录</title>
<head>
	<meta charset="utf-8">
</head>
<style>
	.l-btn-text {
		font-size: 15px; 
		font-family: 微软雅黑;
		//background-color: red;
		color: black;		
	}	
	.textbox {
		//border: 1px solid #95B8E7;
		border: 1px solid black;
	}	
	.l-btn {
		//color: #5a742d;
		border: 1px solid black;
	}
	.window .window-header {
		border:none;
		padding: 6px 0px 4px 0px;
		height: 32px;
		line-height: 28px;
		padding-left: 12px;
		font-family: 微软雅黑;
	}
	
	a{ text-decoration: none;}
		p{
	 		width: 60px;
	 		height: 30px;
	 		display: inline-block;
	 		letter-spacing: 3px;
			border-type:none;
		}
	#div{
		 height: 20px;
		 margin-bottom: 10px;
	}
	#btn,p:hover{
	 cursor: default;
	}
	button{
	 display: block;
	}
</style>		
<body>
	<div id="main" style="margin:1px 1px 1px 1px;">
		<div id="myForm1" class="easyui-window" style="position:relative; width:360px;height:400px" data-options=" modal:true, resizable:false, closable:false, maximizable:false, minimizable:false, collapsible:false, border:false, title:'用户登录'">
			<div style=:position:absolute;width:360px;height:60px;top:0px;left:0px;"><img style="width:360px;height:60px" src="images/xianfeng.jpg"/></div>
			<div style="position:absolute;width:280px;height:30px;top:65px;left:42px;">用户名称</div>
			<div style="position:absolute; width:280px; height:30px; top:85px; left:42px;"><input class="easyui-textbox" type="text" id="userid" data-options="prompt:'用户账号/手机号/邮箱', iconCls:'icon-man', iconWidth:38" style="font-size:13px; height:100%; width:100%; padding:0px 8px 0px 10px;" ></div>
			<label id="msg1" style="position:absolute;top:115px;left:50px;" for="userid"></label>
			<div style="position:absolute;width:280px;height:30px;top:130px;left:42px;">用户密码</div>
			<div style="position:absolute; width:280px; height:30px; top:150px; left:42px;"><input class="easyui-validatebox easyui-textbox" type="password" id="password" data-options="prompt:'登录密码',iconCls:'icon-lock',iconWidth:38" style=" font-size:13px; height:100%; width:100%; padding:0px 8px 0px 10px;" ></div>
			<label id="msg2" style="position:absolute;top:180px;left:50px;" for="password"></label>
			<div style="position:absolute;width:280px;height:30px;top:195px;left:42px;">验证码</div>
			<div id="box" style="heght:30px;position:absolute;top:215px;left:42px;">
 				<input class="easyui-textbox" type="text" id="int"/>
 				<p id="p" style="height:30px;width:70px;position:absolute;top:-20px;left:205px;color:white;background-color:red;font-size:20px;"></p>
			</div>
			<label id="msg3" style="position:absolute;top:242px;left:50px;" for="int"></label>
			<div style="position:absolute; width:210px; top:255px; left:42px;"><input type="checkbox" id="autologin" /><div style="margin:-17px 0px 0px 18px;">下次自动登录</div></div>
			<div style="position:absolute; width:80px; top:255px; left:260px;"><a href="keshefind.jsp?userid=abc">忘记密码</a></div>
			<div style="position:absolute; width:80px; top:330px; left:44px;">还没有账号？</div>
			<div style="position:absolute; width:80px; top:330px; left:260px;"><a href="kesheregister.jsp" target="_self">马上注册？</a></div>
			<div style="position:absolute; top:280px; left:42px; height:40px; width:280px;"><a href="javascript:void(0)" id="loginbtn" class="easyui-linkbutton" data-options="plain:true" style="font-size:13px; width:100%; height:100%;">登录</a></div>	
		</div>
	</div>
</body>	
<script>
	var objWin;
	$(function(){
		document.onkeypress=myBanBackSpace;
		document.onkeydown=myBanBackSpace;
		var user=null;  
		user=myGetCookie1("user"); 
		console.log(user);
		
		var autologin=0;
		if (user!=undefined && user!=null && user!=''){
			userid=user.userid;
			password=user.password;
			autologin=user.autologin;
		}else{
			var userid='';
			var password='';
		}
		$("#userid").textbox("setValue", userid);
		$("#password").textbox("setValue", password);
		if (autologin==1){
			$("#password").textbox("setValue", password);
			$("#autologin").prop("checked", true);
		}	
		//登录点击事件
		$('#loginbtn').click(function(e){
			doLogin();
		}); 
		$('#userid').textbox({
			onChange:function(e,e){
				var userid=$('#userid').textbox('getValue');
				var password=$('#password').textbox('getValue');
				if(userid=='' || password=='')
					$('#loginbtn').linkbutton('disable');
				else{
					$('#loginbtn').linkbutton('enable');
				}
			}
		});
		$('#password').textbox({
			onChange:function(e,e){
				var userid=$('#userid').textbox('getValue');
				var password=$('#password').textbox('getValue');
				if(userid=='' || password=='')
					$('#loginbtn').linkbutton('disable');
				else{
					$('#loginbtn').linkbutton('enable');
				}
			}
		});
		
		mySelectOnFocus();
		fnFocus('userid');
		$('#userid').textbox('textbox').bind('keydown',function(e){
			$('#msg1').html('');
			$('#msg2').html('');
			$('#msg3').html('');
			var key=e.which;
			if(key==13 || key==40) fnFocus('password');
		});
		$('#password').textbox('textbox').bind('keydown',function(e){
			$('#msg1').html('');
			$('#msg2').html('');
			$('#msg3').html('');
			var key=e.which;
			if(key==38) fnFocus('userid');
			if(key==13 || key==40) fnFocus('int');
		});
		$('#int').textbox('textbox').bind('keydown',function(e){
			$('#msg1').html('');
			$('#msg2').html('');
			$('#msg3').html('');
			var key=e.which;
			if(key==38) fnFocus('password');
			if(key==13) doLogin();
		});
	}); //endofjquery

	function doLogin(){
		var int=document.getElementById("int").value;//获取用户输入的值
		 var p=document.getElementById("p").innerText;//获取验证码
		 //判断用户输入与验证码的大写一致(不分大小写)
		 if(int.toUpperCase()==p.toUpperCase()){
			 var msg='';
				msg='<span style="color:red">'+msg+'</span>'
				$('#msg3').html(msg);
				var p={};
				p.account=$("#userid").textbox("getValue");
				p.password=$("#password").textbox("getValue");
				console.log(p);
				if ($("#autologin").is(':checked')) p.autologin=1;
				else p.autologin=0;
				rs=myRunSqlProcedure('myd1001', p);
				rows=rs.rows;
				console.log(rows);
				var msg='';
				if (rows[0].flag==0){
					var msg='用户名输入错误！';
					msg='<span style="color:red">'+msg+'</span>'
					$('#msg1').html(msg);
					fnFocus('userid');
					code();
				}else if (rows[0].flag==-1){
					$('#msg1').html('');
					var msg='用户密码输入错误！';
					msg='<span style="color:red">'+msg+'</span>';
					$('#msg2').html(msg);
					fnFocus('password');
					code();
				}else if (rows[0].flag==1){ 
					$('#msg1').html('');
					$('#msg2').html('');
					var msg='用户登录成功！';
					var msg='<span style="color:red">（'+msg+'）</span>';
					var user={};
					user.userid=rows[0].userid;
					user.username=rows[0].username;
					user.level=rows[0].level;
					user.password=rows[0].password;
					user.autologin=p.autologin;
					console.log(222,user);
					//保存到cookie中去，可以用函数mySetCookie
					mySetCookie1("user",user, 0);
					window.top.location.href='keshemain.jsp';
					$('#myForm1').window('setTitle', '用户登录'+msg);
				}
		 }else{
			 var msg='验证码输入错误！';
				msg='<span style="color:red">'+msg+'</span>'
				$('#msg3').html(msg);
		 }
		
		
	}

	function fnFocus(id){
		$("#"+id).next("span").find("input").focus();	
	}

	function myGetCookie1(name){
		//读取cookie
	    var arr, reg=new RegExp("(^| )"+name+"=([^;]*)(;|$)");
	    if (arr=document.cookie.match(reg)) return JSON.parse(unescape(arr[2])); 
	    else return null; 
	} 

	function mySetCookie1(name, value, days){ 
	    var exp = new Date();
	    if (days==undefined || days<=0) days=21;  //不设置时间时为21天
	    exp.setTime(exp.getTime() + days*24*60*60*1000);
	    document.cookie = name + "="+ escape(JSON.stringify(value)) + ";expires=" + exp.toGMTString(); 
	} 
	function random(max,min){
		 return Math.round(Math.random()*(max-min)+min);
		}
		//随机4位验证码
		function code(){
		 //将数字、小写字母及大写字母输入
		 var str="1234567890qwertyuioplkjhgfdsazxcvbnmQWERTYUIOPLKJHGFDSAZXCVBNM";
		 //给一个空字符串
		 var res='';
		 //循环4次，得到4个字符
		 for(var i=0;i<4;i++){
		 //将得到的结果给字符串，调用随机函数，0最小数，62表示数字加字母的总数
		 res+=str[random(0,62)];
		 }
		 p.innerHTML=res;
		}
		code(); //调用验证码函数
		p.onclick=code; //点击也可以刷新验证码
		//验证验证码
		/*btn.onclick=function(){
		 var int=document.getElementById("int").value;//获取用户输入的值
		 var p=document.getElementById("p").innerText;//获取验证码
		 //判断用户输入与验证码的大写一致(不分大小写)
		 if(int.toUpperCase()==p.toUpperCase()){
			 var msg='验证码输入正确！';
				msg='<span style="color:red">'+msg+'</span>'
				$('#msg3').html(msg);
		 }else{
			 var msg='验证码输入错误！';
				msg='<span style="color:red">'+msg+'</span>'
				$('#msg3').html(msg);
		 }
		}*/
</script>
</html>
