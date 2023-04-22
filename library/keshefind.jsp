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
	document.onkeypress=myBanBackSpace; //禁止backspace键
	document.onkeydown=myBanBackSpace;
	myWindow('myWin1', '找回密码', 0, 0, 210, 405, 'bbar', 'submit;close');
	myTextField('userid','myWin1Form','用户账号:', 68, 0*rowheight+20,20,0, 280);
	myTextField('answer','myWin1Form','你就读的小学名称:', 148, 1*rowheight+30,20,0, 200);
	myLabel('errmsg','myWin1Form','', 0*rowheight+20+36,20+68,0, 280);
	pmyPage.keydownfields='userid;answer';  //支持键盘操作
	$('#myWin1').window({
		title:'找回密码'
	});
	
	$('#userid').textbox({
		buttonIcon:'locateIcon',
		onClickButton:function(){
			p={};
			p.userid=$('#userid').textbox('getValue');
			rs=myRunSqlProcedure('d1004_1',p).rows;
			if(rs.length>0) msg='该用户存在！';
			else msg='该用户不存在！';
			$('#errmsg').html(msg);
		}
	});
	
	//按任一键不显示账号注册提示符
	$('#userid').textbox('textbox').bind('keydown',function(e){
		var key=e.which;
		if (key>=48) $('#errmsg').html(''); //有效的输入键
	});		

	
	//打开窗体
	$('#myWin1').window('open');
	//定义按钮事件
	$('#myWin1ok').linkbutton({
		onClick:function(){
			msg='';
			p={};
			p.userid=$('#userid').textbox('getValue');
			rs=myRunSqlProcedure('d1004_1',p).rows;
			if(rs.length==0) {
				msg='该用户不存在！';
				$('#errmsg').html(msg);
			}
			if(msg==''){
				p={};
				p.userid=$('#userid').textbox('getValue');
				p.answer=$('#answer').textbox('getValue');
				rs=myRunSqlProcedure('d1004_2',p).rows;
				console.log(rs);
				if(rs[0].answer!='0'){
					msg+='请记住您的密码：'+rs[0].answer;
					myMessagebox(msg, 'info');
				}else{
					myMessagebox('回答错误!', 'error');
				}
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
	//myCloseWindow();	
	window.top.location.href='keshelogin.jsp';
}


function fnFocus(){
	myFocus('userid');  //聚焦到某一列
}


</script>

</html>