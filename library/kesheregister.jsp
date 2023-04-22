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
	//表单的名称为id+Form（myWin1Form），两个按钮id为id+ok(myWin1ok),id+close(myWin1close)
	myWindow('myWin1', '用户注册', 0, 0, 520, 405, 'bbar', 'submit;close');
	myTextField('userid','myWin1Form','用户账号:', 68, 0*rowheight+20,20,0, 280);
	myTextField('username','myWin1Form','用户名称:',   68, 1*rowheight+30,20,0, 280);
	myComboField('gender','myWin1Form','性别:', 68, 2*rowheight+30,20,0, 280, 'gender','男;女');
	myPasswordField('password','myWin1Form','登录密码:', 68, 3*rowheight+30,20,0, 280);
	myPasswordField('password1','myWin1Form','密码确认:', 68, 4*rowheight+30,20,0, 280);
	myComboField('level','myWin1Form','用户类别:', 68, 5*rowheight+30,20,0, 280, 'title','');
	myTextField('phone','myWin1Form','手机号:',   68, 6*rowheight+30,20,0, 280);	
	myTextField('answer','myWin1Form','你就读的小学名称:', 148, 7*rowheight+30,20,0, 200);
	myLabel('errmsg','myWin1Form','', 0*rowheight+20+36,20+68,0, 280);
	pmyPage.keydownfields='userid;username;gender;password;password1;level;phone;answer';  //支持键盘操作
	$('#myWin1').window({
		title:'用户注册'
	});
	$('#userid').textbox({
		required: true,
		prompt: '输入账号',
		buttonIcon: 'locateIcon',
		onClickButton: function(){
			var p={};
			p.userid=$('#userid').textbox('getValue');
			var rs=myRunSqlProcedure('d1003_1', p);
			if (rs.rows.length>0) $('#errmsg').html('<span style="color:red">'+'该用户账号已经被注册！'+'</span>');
			else $('#errmsg').html('该用户账号可以注册使用！');
			myFocus('userid');			
		}
	});
	
	//按任一键不显示账号注册提示符
	$('#userid').textbox('textbox').bind('keydown',function(e){
		var key=e.which;
		if (key>=48) $('#errmsg').html(''); //有效的输入键
	});		

	$('#username').textbox({
		required: true,
		prompt: '用户名不能为空'
	});
	
	//下拉框
	p={};
	rs=myRunSqlProcedure('d1003_2', p).rows;
	$('#level').combobox({valueField:rs.level,textField:rs.title,data: rs});
	$('#level').combobox('setValue', rs[0].title);
	//打开窗体
	$('#myWin1').window('open');
	//定义按钮事件
	$('#myWin1ok').linkbutton({
		onClick:function(){
			var msg='';
			var p={};
			p.userid=$('#userid').textbox('getValue');
			p.username=$('#username').textbox('getValue');
			p.gender=$('#gender').combobox('getValue');
			p.password=$('#password').textbox('getValue');
			p.password1=$('#password1').textbox('getValue');
			p.level=$('#level').combobox('getValue');
			p.phone=$('#phone').textbox('getValue');
			p.answer=$('#answer').textbox('getValue');
			//客户端验证数据
			//1)用户id与用户名称不为空
			if (p.userid=='' || p.username=='') msg+='<br>用户账号或用户名不能为空！';
			//2)账号不能只是数字
			for(var i=0;i<12;i++){
				var r=p.userid.substr(i,1);
				if(!(/^[0-9]+$/.test(r)))//学号只是数字
					flag1=1;
			}if(flag1!=1)msg+='<br>账号不能只有数字！';
			//3)用户密码不为空
			if (p.password=='' || p.password1=='') msg+='<br>用户登录密码不能为空！';
			//4)用户密码不一致
			if (p.password!=p.password1) msg+='<br>两次登录密码不一致！';
			if (msg==''){
				//服务器端验证数据
				//用户账号是否重复已存在,并判断那些项重复
				if(p.phone=='')msg+='<br>手机号不能为空！';
				var rs=myRunSqlProcedure('d1003_3', p);
				for (var i=0; i<rs.rows.length; i++){
					if (rs.rows[i].flag==1) msg+='<br>账号重复！';
					if (rs.rows[i].flag==2) msg+='<br>手机号已经被注册！';
				}
			}
			if (msg==''){  //数据验证全部正确
				p.database='mybookstore';
				p.tablename='mybookstore.readers';
				p.keyfield='account';
				p.sortfield='';
				var row={};
				//将p的属性赋值到row，不能写row=p;
				row.account=p.userid;
				row.name=p.username;
				row.gender=p.gender;
				row.password=p.password;
				row.phone=p.phone;
				row.level=p.level;
				row.answer=p.answer;
				row.signdate=getTime();
				row._action='add';
				p.data=[];
				p.data.push(row);
				console.log(p);	
				rs=myRunSqlProcedure('sys_runEditRows', p); 
				console.log(rs);	
				myMessagebox('用户注册成功。<br>重新登录后生效！', 'info', 0, 300, 'fnClose');
			}else{
				msg=('发现以下错误，用户注册失败！')+msg;
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
	//myCloseWindow();	
	window.top.location.href='keshelogin.jsp';
}


function fnFocus(){
	myFocus('userid');  //聚焦到某一列
}

function getTime() {
    var myDate = new Date();
    var myYear = myDate.getFullYear(); //获取完整的年份(4位,1970-????)
    var myMonth = myDate.getMonth() + 1; //获取当前月份(0-11,0代表1月)
    var myToday = myDate.getDate(); //获取当前日(1-31)
    var myDay = myDate.getDay(); //获取当前星期X(0-6,0代表星期天)
    var myHour = myDate.getHours(); //获取当前小时数(0-23)
    var myMinute = myDate.getMinutes(); //获取当前分钟数(0-59)
    var mySecond = myDate.getSeconds(); //获取当前秒数(0-59)
    var week = ['星期日', '星期一', '星期二', '星期三', '星期四', '星期五', '星期六'];
    var nowTime;

    nowTime = myYear + '-' + fillZero(myMonth) + '-' + fillZero(myToday);
    return nowTime;
};

function fillZero(str) {
    var realNum;
    if (str < 10) {
        realNum = '0' + str;
    } else {
        realNum = str;
    }
    return realNum;
}

</script>

</html>