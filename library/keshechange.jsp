<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="system/easyui_header_plugin.jsp"%>
<html>
<style>
	.datagrid-row { height: 36px; }
	.panel-header { padding: 4px; } //默认是5px
	.div-a{ float:left;width:49%;border:1px solid #F00} 
	.div-b{ float:left;width:49%;border:1px solid #000}
	body { 
	    padding:0;  /*去除内边距*/ 
	    border:0;   /*去除边框*/ 
	    margin:0;   /*去除外边距*/ 
	}

	
</style>
<head>
</head>
<body style="margin: 1px 2px 2px 1px;">
</body>
<script>
pmyWin1={};
rowheight=50;
pmyPage={};
$(function(){
	//修改用户密码
	document.onkeypress=myBanBackSpace; //禁止backspace键
	document.onkeydown=myBanBackSpace;
	var user=myGetCookie("user"); 
	myWindow('myWin1', '修改密码', 0, 0, 300, 418, 'bbar', 'save;close');
	myLabel('userinfo','myWin1Form', '<b>'+user.userid+'&nbsp;'+user.username+'</b>', 0*rowheight+20,20,0, 280);
	myPasswordField('password', 'myWin1Form','输入原密码:', 84, 1*rowheight+10,20,0, 280);
	myPasswordField('password1','myWin1Form','输入新密码:', 84, 2*rowheight+10,20,0, 280);
	myPasswordField('password2','myWin1Form','新密码确认:', 84, 3*rowheight+10,20,0, 280);
	pmyPage.keydownfields='password;password1;password2';  //支持键盘操作	
	$('#myWin1').window({title:'修改密码'});
	//从字典中提取用户类别添加到下拉框
	//打开窗体
	$('#myWin1').window('open');
	//定义按钮事件
	$('#myWin1ok').linkbutton({
		onClick:function(){
			var msg='';
			var p={};
			p.password=$('#password').textbox('getValue');
			p.password1=$('#password1').textbox('getValue');
			p.password2=$('#password2').textbox('getValue');
			p.level=user.level;
			p.userid=user.userid;
			console.log(111,p);
			//客户端验证数据
			//1)旧密码不为空
			if (p.password=='') msg+='<br>旧登录密码不能为空！';
			//2)新密码不为空
			if (p.password1=='' || p.password2=='') msg+='<br>新登录密码不能为空！';
			//3)用户密码不一致
			if (p.password1!=p.password2) msg+='<br>新密码两次输入不一致！';
			if (msg==''){
				//服务器端验证数据
				//用户账号与密码是否一致
				var rs=myRunSqlProcedure('d1004_1', p);
				if (rs.rows.length==0) msg+='<br>原密码输入错误！';
			}
			if (msg==''){  //数据验证全部正确
				var row={};
				//将p的属性赋值到row，不能写row=p;
				$.each(p, function(key, value){
					row[key]=value;
				});
				row.account=p.userid;
				row._action='update';
				row.password=p.password1;
				p.data=[];
				p.data.push(row);
				p.database='mybookstore';
				p.tablename='mybookstore.readers';
				p.keyfield='account';
				p.sortfield='';
				rs=myRunSqlProcedure('sys_runEditRows', p); 
				console.log(rs);	
				myMessagebox('密码修改成功。<br>重新登录后生效！', 'info', 0, 300, 'fnClose');
			}else{
				msg=('发现以下错误，密码修改失败！')+msg;
				myMessagebox(msg, 'error');
			}
		}//onclick
	});
	//调用通用函数，下列各列实现键盘光标上下移动聚焦
	mySelectOnFocus(); //调用通用函数，实现聚焦时全选文本框
	myKeyDownEvent(pmyPage.keydownfields);  // //支持键盘操作，具有聚焦的功能
	//以下是事件
	$('#myWin1').window({
		onClose:function(){
			window.top.location.href='keshelogin.jsp';
		}
	});
	
	$('#myWin1').bind('contextmenu',function(e){
		e.preventDefault();
	});		

});  //endofjquery
	
function fnClose(){
	window.top.location.href='keshelogin.jsp';
}

function fnFocus(){
	myFocus('userid');  //聚焦到某一列
}


</script>

</html>