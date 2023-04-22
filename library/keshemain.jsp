<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ include file="system/easyui_header_plugin.jsp"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<style type="text/css"> 
	a:link {  color:black;text-decoration: none}
	a:visited{color:black;}
	xa:hover { text-decoration: underline}	
	.xmypanel-header {
  		background-color: #E0ECFF; 
	}
	.tabs {background-color:#E0ECFF;}
</style>
<head>
	<title>个人知识管理系统</title>
	<meta charset="utf-8">
</head>
<body style="font-size:13px; ">
	<div id="mainlayout" class="easyui-layout" data-options="fit:true" style="margin:0px 0px 1px 0px;">
		<div id="toppanel" data-options="region:'north'" style="overflow:hidden; height:150px;background-color:#E0ECFF ">
			<div id="myTab" class="easyui-tabs" style="position:absolute;top:25px;left:0px;border-width:0px;">
				<div id="myTab1" title="首页" style="background-color:#E0ECFF"></div>
				<div id="myTab2" title="系统" style="background-color:#E0ECFF"></div>
				<div id="myTab3" title="帮助" style="background-color:#E0ECFF"></div>
			</div>
		</div>
		<div id="centerpanel" data-options="region:'center'" style="position:relative;background-color:#4071b4;overflow:hidden;">
		<div id="daohangpanel" class="easyui-panel" style="background-color:#E0ECFF;width:233px;height:440px;padding-top:10px;padding-left:10px;margin-top:10px;margin-left:10px;overflow:auto;">
		<div id="sidemenu" class="easyui-sidemenu" data-options="data:data" ></div></div>	
		<div style="color:white;font-size:20px;position:absolute;top:150px;left:480px;">欢迎使用</div>
		<div style="color:white;font-size:30px;position:absolute;top:180px;left:480px;">先 锋 图 书 馆 管 理 系 统</div>
		<div style="color:white;font-size:16.5px;position:absolute;top:220px;left:480px;">PIONEER LIBRARY MANAGEMENT SYSTEM</div>
		<div id="leixing" style="color:white;position:absolute;top:50px;left:1000px;width:200px;height:30px;"></div>
		<div id="banben" style="color:white;position:absolute;top:80px;left:1000px;width:200px;height:30px;"></div>
		<div id="sumbook" style="color:white;position:absolute;top:110px;left:1000px;width:200px;height:30px;"></div>
		<div id="sumreader" style="color:white;position:absolute;top:140px;left:1000px;width:200px;height:30px;"></div>
		<div id="gongsi" style="color:white;position:absolute;top:300px;left:1000px;width:200px;height:30px;"></div>
		<div id="dianhua" style="color:white;position:absolute;top:330px;left:1000px;width:200px;height:30px;"></div>
		<div id="wangzhi" style="color:white;position:absolute;top:360px;left:1000px;width:200px;height:30px;"><a href="http://www.quickcn.com" style="color:white;text-decoration:underline;">http://www.quickcn.com</a></div>
		</div>
	</div>
<div id="myWin2" class="easyui-window" >
		<div id="win2" class="easyui-layout" data-options="fit:true">
		<div id="toolbar1" class="easyui-panel" data-options="region:'north',border:false,split:false,doSize:true" style="overflow:hidden; background-color:#E0ECFF;height:31px;" ></div>
		<div id="gridpanel" class="easyui-panel" data-options="region:'south',border:true,split:false,doSize:true,height:250" style="height:250px;overflow:auto;"></div>
		<div id="formpanel" class="easyui-panel" data-options="region:'center',border:true"></div>
		</div>
		
	</div>
	<div id="myWin3" class="easyui-window" >
		<div id="win3" class="easyui-layout" data-options="fit:true">
		<div id="toolbar3" class="easyui-panel" data-options="region:'north',border:false,split:false,doSize:true" style="overflow:hidden; background-color:#E0ECFF;height:31px;" ></div>
		<div id="treepanel" class="easyui-panel" data-options="region:'west',border:false,split:false,doSize:true,width:250" style="height:250px;overflow:auto;">
		<div id="myTree3" class="easyui-tree"></div>
		</div>
		<div id="formpanel3" class="easyui-panel" data-options="region:'center',border:true"></div>
		</div>
		
	</div>
	<div id="myWin4" class="easyui-window" >
		<div id="win4" class="easyui-layout" data-options="fit:true">
		<div id="toolbar4" class="easyui-panel" data-options="region:'north',border:false,split:false,doSize:true" style="overflow:hidden; background-color:#E0ECFF;height:31px;" ></div>
		<div id="treepanel4" class="easyui-panel" data-options="region:'west',border:false,split:false,doSize:true,width:250" style="height:250px;overflow:auto;">
		<div id="myTree4" class="easyui-tree"></div>
		</div>
		<div id="formpanel4" class="easyui-panel" data-options="region:'center',border:true"></div>
		</div>
		
	</div>
</body>
<script>
var data= [{
    text: '书刊管理',
    iconCls: 'icon-sum',
    state: 'open',
    children: [{
        text: '书刊信息维护',
        iconCls: 'icon-more'
    },{
        text: '书刊类别设置',
        iconCls: 'icon-more'
    }]
},{
    text: '读者管理',
    iconCls: 'icon-sum',
    children: [{
        text: '读者信息维护',
        iconCls: 'icon-more'
    },{
        text: '读者类别设置',
        iconCls: 'icon-more'
    },{
        text: '借阅规章制度',
        iconCls: 'icon-more'
    }]
},{
    text: '借阅管理',
    iconCls: 'icon-sum',
    children: [{
        text: '借书还书续借',
        iconCls: 'icon-more'
    },{
        text: '借阅记录查询',
        iconCls: 'icon-more'
    }]
},{
    text: '查询统计',
    iconCls: 'icon-sum',
    children: [{
        text: '逾期记录查询',
        iconCls: 'icon-more'
    },{
        text: '借阅记录统计',
        iconCls: 'icon-more'
    }]
},{
    text: '系统维护',
    iconCls: 'icon-sum',
    children: [{
        text: '数据字典维护',
        iconCls: 'icon-more'
    },{
        text: '用户授权设置',
        iconCls: 'icon-more'
    },{
        text: '操作日志管理',
        iconCls: 'icon-more'
    },{
        text: '系统参数设置',
        iconCls: 'icon-more'
    },{
        text: '高级管理工具',
        iconCls: 'icon-more'
    }]
}];
	//提取登录用户的信息，放到一个json中
	user=myGetCookie("user"); //从cookie中提取用户名
	console.log(user);
	rowheight=50;
	menuData=[];
	action='borrow';
	addoredit='replace';
	$(function(){
		document.onkeypress=myBanBackSpace;
		document.onkeydown=myBanBackSpace;
		var str='当前用户：'+user.userid+'&nbsp;'+user.username;
		if (user.level=='1') myLabel('username','leixing', str+'(普通读者)', 0, 0, 0, 0,'');
		else if (user.level=='2') myLabel('username','leixing', str+'(高级读者)', 0, 0, 0, 0,'');
		else if (user.level=='3') myLabel('username','leixing', str+'(特殊读者)', 0, 0, 0, 0,'');
		else myLabel('username','leixing', str+'(系统管理员)', 0, 0, 0, 0,'');
		s1='先锋图书馆管理系统';
		myLabel('label1','toppanel', s1, 10,540, 0, 0,'');
		myLabel('label2','banben','软件版本：v2020(5.20.5.918)',0,0,0,0,'');
		var p={};
		var rs=myRunSqlProcedure('d1005_1',p).rows;
		var ss1=rs[0].book1;
		var ss2=rs[0].book2;
		var ss3=rs[0].reader;
		myLabel('label3','sumbook','书刊总计：'+ss2+'册'+ss1+'种',0,0,0,0,'');
		myLabel('label4','sumreader','读者总计：'+ss3+'人',0,0,0,0,'');
		myLabel('label5','gongsi','酒泉先锋软件有限公司',0,0,0,0,'');
		myLabel('label6','dianhua','全国统一客服热线：400-0937-606',0,0,0,0,'');
		$('#myTab').tabs({border:false,fit:true});
		
		//myTab1
		var str='<a href="javascript:void(0)" id="luru" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:0px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/append.png" style="position:relative;left:-5px;margin-bottom:8px;width:40px;height:60%;"/><br/>录入</span></a>';
		$('#myTab1').append(str);
		var str='<a href="javascript:void(0)" id="mulu" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:50px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/book.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>书刊目录</span></a>';
		$('#myTab1').append(str);
		var str='<a href="javascript:void(0)" id="fuben" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:120px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/copy.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>复本列表</span></a>';
		$('#myTab1').append(str);
		//
		var str='<a href="javascript:void(0)" id="duzhe" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:185px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/user.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>读者管理</span></a>';
		$('#myTab1').append(str);
		//
		var str='<a href="javascript:void(0)" id="jiechu" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:260px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/right.png" style="position:relative;left:-5px;margin-bottom:8px;width:40px;height:60%;"/><br/>借出</span></a>';
		$('#myTab1').append(str);
		var str='<a href="javascript:void(0)" id="guihuan" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:310px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/left.png" style="position:relative;left:-5px;margin-bottom:8px;width:40px;height:60%;"/><br/>归还</span></a>';
		$('#myTab1').append(str);
		var str='<a href="javascript:void(0)" id="xujie" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:380px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/upload.png" style="position:relative;left:-5px;margin-bottom:8px;width:40px;height:60%;"/><br/>续借</span></a>';
		$('#myTab1').append(str);
		//
		var str='<a href="javascript:void(0)" id="jieyue" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:450px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/tableedit.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>借阅记录</span></a>';
		$('#myTab1').append(str);
		var str='<a href="javascript:void(0)" id="yuqi" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:520px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/Calendar.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>逾期记录</span></a>';
		$('#myTab1').append(str);
		var str='<a href="javascript:void(0)" id="tongji" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:600px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/chartcolumn.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>借阅统计</span></a>';
		$('#myTab1').append(str);
		//
		var str='<a href="javascript:void(0)" id="shukan" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:670px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/pieicon.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>书刊类别</span></a>';
		$('#myTab1').append(str);
		var str='<a href="javascript:void(0)" id="duzheleibie" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:740px;display:inline-block;width:75px;height:90px;">';
		str+='<img src="system/images/user_red.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>读者类别</span></a>';
		$('#myTab1').append(str);
		//
		var str='<a href="keshelogin.jsp" id="tuichu" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:817px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/quit.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>退出系统</span></a>';
		$('#myTab1').append(str);
		
		//myTab2
		var str='<a href="keshelogin.jsp" id="chongxin" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:0px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/refresh1.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>重新登陆</span></a>';
		$('#myTab2').append(str);
		var str='<a href="keshechange.jsp" id="xiugai" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:70px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/user_key.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>修改密码</span></a>';
		$('#myTab2').append(str);
		//
		var str='<a href="javascript:void(0)" id="daohang" class="easyui-linkbutton"><span id="dh" style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:145px;display:inline-block;width:70px;height:87px;">';
		str+='<img src="system/images/view.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>功能导航</span></a>';
		$('#myTab2').append(str);
		//myTab3
		var str='<a href="https://plms-docs.readthedocs.io/en/latest/" id="shouce" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:0px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/book.png" style="position:relative;left:0px;margin-bottom:8px;width:40px;height:60%;"/><br/>用户手册</span></a>';
		$('#myTab3').append(str);
		var str='<a href="http://www.quickcn.com/buy/?utm_source=client-trial-2021-5.21.1.513" id="goumai" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:15px;position:absolute;top:35px;left:60px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/cart.png" style="position:relative;left:4px;margin-bottom:8px;width:40px;height:60%;"/><br/>购买注册</span></a>';
		$('#myTab3').append(str);
		var str='<a href="http://www.quickcn.com/library/?utm_source=client-trial-2021-5.21.1.513" id="guanfang" class="easyui-linkbutton"><span style="padding-top:8px;padding-left:10px;border-right:1px solid #95B8E7;position:absolute;top:35px;left:130px;display:inline-block;width:70px;height:90px;">';
		str+='<img src="system/images/earth.png" style="position:relative;left:9px;margin-bottom:8px;width:40px;height:60%;"/><br/>官方网站</span></a>';
		$('#myTab3').append(str);
		
		//按钮功能
		//导航栏按钮
		$('#daohang').click(function(){
			var dis=$('#daohangpanel').parent().css('display');
			if(dis=='none'){
				$('#daohangpanel').panel('open');
				$('#dh').css({'background-color':'#E0ECFF'});
			}else{
				$('#daohangpanel').panel('close');
				$('#dh').css({'background-color':'#4071b4'});
			}
		});
	//录入按钮
		myWindow('myWin1','书刊信息录入',5,350,600,680,'bbar','save;close');
		myTabs('myTabA','myWin1Form','基本信息;附加信息',0,0,0,0);
		var s='<div id="isbn" style="border-bottom:1px solid #95B8E7;width:640px;height:45px;padding-left:5px;padding-top:5px;margin-top:10px;margin-left:10px;"></div>';
		$('#myTabA1').append(s);
		myTextField('bookid','isbn','ISBN：',58,0*rowheight+15,10,30,350);
			
		$('#bookid').textbox({
			buttonIcon:'locateIcon',
			onClickButton:function(){
				var p={};
				p.bookid=$('#bookid').textbox('getValue');
				rs1=myRunSqlProcedure('test1',p);
				console.log(rs1.rows);
				if(rs1.rows.length>0){
					$('#myGrid1').datagrid({data:rs1.rows});
					var number=rs1.rows[0].number;
					var borrow=rs1.rows[0].borrow;
					var leftover=rs1.rows[0].leftover;
					$('#mylabel7').html(number);
					$('#mylabel8').html(borrow);
					$('#mylabel9').html(leftover);
					$('#bookid').textbox('setValue',rs1.rows[0].bookid);
					$('#bookname').textbox('setValue',rs1.rows[0].bookname);
					$('#author').textbox('setValue',rs1.rows[0].author);
					$('#collection').textbox('setValue',rs1.rows[0].collection);
					$('#categoryid').textbox('setValue',rs1.rows[0].categoryid);
					$('#categoryname').textbox('setValue',rs1.rows[0].categoryname);
					$('#area').textbox('setValue',rs1.rows[0].area);
					$('#publishdate').textbox('setValue',rs1.rows[0].publishdate);
					$('#inputcode').textbox('setValue',rs1.rows[0].inputcode);
					$('#press').textbox('setValue',rs1.rows[0].press);
				}else myMessagebox('此书不存在！','info');
			}
		});
		myTextField('bookname','myTabA1','书刊名称',58,1*rowheight+15,10,30,250);
		
		myTextField('inputcode','myTabA1','输入码',58,1*rowheight+15,340,30,250);
		myTextField('author','myTabA1','作者',58,2*rowheight+15,10,30,250);
		myComboField('collection','myTabA1','馆藏类型',58,2*rowheight+15,340,30,250,'categoryname');
		var p={};
		var rs=myRunSqlProcedure('test2',p).rows;
		$('#collection').combobox({
			valueField:rs.collection,
			textField:rs.categoryname,
			value:rs.collection,
			data:rs
		});
		
		var p={};
		var rs=myRunSqlProcedure('test3',p).rows;
		var s='<div style="position:absolute;left:10px;top:165px;width:308px;height:30px;"><input id="categoryid" class="easyui-combogrid" style="width:100%;height:100%;"></div>';
		$('#myTabA1').append(s);
		var label='<span style="font-family:楷体;">'+'类型编码'+'</span>';
		$('#categoryid').combogrid({
			label:label,
			labelWidth:58,
		    panelWidth:220,
		    idField:'categoryid',
		    textField:'categoryid',
		    columns:[[
		        {field:'categoryid',title:'书刊类型编号',width:100},
		        {field:'categoryname',title:'书刊类型名称',width:100}
		    ]],
		    data:rs
		});
		
		var s='<div style="position:absolute;left:340px;top:165px;width:308px;height:30px;"><input id="categoryname" class="easyui-combogrid" style="width:100%;height:100%;"></div>';
		$('#myTabA1').append(s);
		var label='<span style="font-family:楷体;">'+'类型名称'+'</span>';
		$('#categoryname').combogrid({
			label:label,
			labelWidth:58,
		    panelWidth:220,
		    idField:'categoryid',
		    textField:'categoryname',
		    columns:[[
		        {field:'categoryid',title:'书刊类型编号',width:100},
		        {field:'categoryname',title:'书刊类型名称',width:100}
		    ]],
		    data:rs
		});
		myTextField('press','myTabA1','出版社',58,4*rowheight+15,10,30,250);
		myTextField('area','myTabA1','出版地区',58,4*rowheight+15,340,30,89);
		myDateField('publishdate','myTabA1','出版日期',58,4*rowheight+15,490,30,95);
		var ss='<div id="lurugrid" style="width:640px;height:200px;border:1px solid #95B8E7;position:absolute;top:265px;left:10px;overflow:auto;">';
		ss+='<div id="myGrid1" class="easyui-datagrid" data-options="border:false"></div></div>';
		$('#myTabA1').append(ss);
	

		$('#myWin1Bottombar').append('总册数&nbsp;&nbsp;&nbsp;&nbsp;借出册数&nbsp;&nbsp;&nbsp;&nbsp;剩余册数');
		myLabel('mylabel7','myWin1Bottombar','',20,10,10,20,'');
		myLabel('mylabel8','myWin1Bottombar','',20,70,10,20,'');
		myLabel('mylabel9','myWin1Bottombar','',20,135,10,20,'');
		
		$('#myTabA2').append('<p style="position:absolute;top:0px;left:30px;">内容简介</p>'+'<div style="position:absolute;top:35px;left:30px;width:280px;height:400px;border:1px solid #95B8E7;"></div>');
		myFileField('fileupload1','myTabA2','图片',0,10,340,20,300,'right','resources_{sys.timestamp}','mybase/resources/','filenames');
		var p={};
		p.id='filenames'; p.parent='myTabA2'; p.labelwidth=90; p.top=35; p.left=250; 
		p.height=400; p.width=380; p.previewto='myTabA';p.datatype='json';p.style='list;preview';
		p=myDefListField(p);	
		myDateField('signdate','myTabA2','登记日期',58,442,35,30,100);
		myTextField('operator','myTabA2','操作员',58,442,210,30,100);
		$('#myWin1').window('close');
		$('#luru').click(function(){
			$('#myWin1').window('open');
			$('#myGrid1').datagrid({
				fit:true,
				rownumbers: true,
				pagination:false, 
				singleSelect:true,
				nowrap: true,
				striped:true,
				columns:[[		  
							{title:'书刊条码',field:'code', width:90, halign:'center', align:'center'},
							{title:'ISBN',field:'bookid', width:150, halign:'center', align:'center'},
						    {title:'书刊名称',field:'bookname', width:160, halign:'center', align:'center'},
						    {title:'状态',field:'conditions', width:100, halign:'center', align:'center'},
						    {title:'分类编号',field:'categoryid', width:100, halign:'center', align:'center'},
						    {title:'分类名称',field:'categoryname', width:100, halign:'center', align:'center'},
						    {title:'作者',field:'author', width:100, halign:'center', align:'center'},
						    {title:'馆藏编号',field:'collection', width:100, halign:'center', align:'center'},
						    {title:'出版社',field:'press', width:100, halign:'center', align:'center'},
						    {title:'出版日期',field:'publishdate', width:100, halign:'center', align:'center'},
						    {title:'登记日期',field:'signdate', width:100, halign:'center', align:'center'},
						    {title:'操作员',field:'operator', width:100, halign:'center', align:'center'}
				        ]],
				 onSelect:function(index,row){
					$('#signdate').textbox('setValue',row.signdate);
					$('#operator').textbox('setValue',row.operator);
				 } 
			});
			$('#bookid').textbox('setValue','');
			$('#bookname').textbox('setValue','');
			$('#author').textbox('setValue','');
			$('#collection').textbox('setValue','');
			$('#categoryid').textbox('setValue','');
			$('#categoryname').textbox('setValue','');
			$('#area').textbox('setValue','');
			$('#publishdate').textbox('setValue','');
			$('#inputcode').textbox('setValue','');
			$('#press').textbox('setValue','');
			$('#signdate').textbox('setValue','');
			$('#operator').textbox('setValue','');
			$('#myGrid1').datagrid('loadData',[]);
			$('#mylabel7').html('0');
			$('#mylabel8').html('0');
			$('#mylabel9').html('0');
			fnFocus("bookid");
		});
		$('#bookid').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'bookid');
		});
		$('#bookname').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'bookname');
		});
		$('#inputcode').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'inputcode');
		});
		$('#author').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'author');
		});
		$('#collection').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'collection');
		});
		$('#categoryid').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'categoryid');
		});
		$('#categoryname').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'categoryname');
		});
		$('#press').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'press');
		});
		$('#area').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'area');
		});
		$('#publishdate').textbox('textbox').bind('keydown',function(e){
			fnKeyDownEvent(e,'publishdate');
		});
		
		$('#myWin1ok').click(function(){
			if(rs1.rows.length>0){
				var row1={};
				row1.bookid=rs1.rows[0].bookid;
				row1.bookname=$('#bookname').textbox('getValue');
				row1.author=$('#author').textbox('getValue');
				row1.collection=rs1.rows[0].n;
				row1.categoryid=$('#categoryid').textbox('getValue');
				row1.area=$('#area').textbox('getValue');
				row1.publishdate=$('#publishdate').textbox('getValue');
				row1.inputcode=$('#inputcode').textbox('getValue');
				row1.press=$('#press').textbox('getValue');
				row1.number=parseInt(rs1.rows[0].number)+1;
				row1.borrow=parseInt(rs1.rows[0].borrow);
				row1.leftover=parseInt(rs1.rows[0].leftover)+1;
				row1._action='replace';
				var row={};
				row.bookid=$('#bookid').textbox('getValue');
				row.conditions=1;
				row.signdate=getTime();
				row.operator=user.userid;
				row._action='add';
			}else{
				var row1={};
				row1.bookid=$('#bookid').textbox('getValue');
				row1.bookname=$('#bookname').textbox('getValue');
				row1.author=$('#author').textbox('getValue');
				row1.collection=$('#collection').combobox('getValue');
				row1.categoryid=$('#categoryid').textbox('getValue');
				row1.area=$('#area').textbox('getValue');
				row1.publishdate=$('#publishdate').textbox('getValue');
				row1.inputcode=$('#inputcode').textbox('getValue');
				row1.press=$('#press').textbox('getValue');
				row1.number=1;
				row1.borrow=0;
				row1.leftover=1;
				row1._action='add';
				var row={};
				row.bookid=$('#bookid').textbox('getValue');
				row.conditions=1;
				row.signdate=getTime();
				row.operator=user.userid;
				row._action='add';
			}
			var msg='';
			if($('#bookid').textbox('getValue')=='')msg+='书刊编码不能为空！';
			if($('#bookname').textbox('getValue')=='')msg+='书刊名称不能为空！';
			if($('#inputcode').textbox('getValue')=='')msg+='输入码不能为空！';
			if($('#categoryid').textbox('getValue')=='')msg+='类型编码不能为空！';
			if($('#collection').textbox('getValue')=='')msg+='馆藏分类不能为空！';
			if(msg==''){
				var p={};
				p.database='mybookstore';
				p.tablename='mybookstore.books';
				p.keyfield='bookid';
				p.sortfield='';
				p.data=[];
				p.data.push(row1);
				var rs=myRunSqlProcedure('sys_runEditRows',p);
				var p={};
				p.database='mybookstore';
				p.tablename='mybookstore.conditions';
				p.keyfield='code';
				p.sortfield='';
				p.data=[];
				p.data.push(row);
				var rs=myRunSqlProcedure('sys_runEditRows',p);
				myMessagebox('书刊录入成功！', 'info', 0, 300, '');
				
			}else{
				myMessagebox(msg, 'error');
			}
			$('#myWin1').window('close');
		});
		
		//借出按钮
		$('#myWin2').window({title:'借书还书续借',width:630,height:490,iconCls:'titleIcon',
			closable:true,collapsible:false,maximizable:false,minimizable:false,modal:true,left:350,top:5});
		$('#toolbar1').panel();
		$('#gridpanel').panel();
		$('#formpanel').panel();
		myButtonGroup('tbar1', 'toolbar1', '清屏/cmdcancel/icon-cut;-;借书/cmdborrow/icon-redo;还书/cmdback/icon-undo;续借/cmdcontinue/icon-add;', 2, 0, 0, 66, -2);
		var s='<div style="position:absolute;left:35px;top:10px;width:208px;height:30px;"><input id="bid" class="easyui-combogrid" style="width:100%;height:100%;"></div>';
		$('#formpanel').append(s);
		$('#bid').combogrid();
		var p={};
		p.bid2='';
		var rs=myRunSqlProcedure('test4',p).rows;
		var label='<span style="font-family:楷体;">'+'输入码'+'</span>';
		$('#bid').combogrid({
			label:label,
			labelWidth:68,
		    panelWidth:500,
		    idField:'code',
		    textField:'inputcode',
		    mode:'remote',
		    columns:[[
		        {field:'code',title:'书刊条码',width:100},
		        {field:'conditions',title:'状态',width:100},
		        {field:'bookid',title:'ISBN',width:100},
		        {field:'bookname',title:'书刊名称',width:100},
		        {field:'categoryid',title:'分类编号',width:100},
		        {field:'categoryname',title:'分类名称',width:100},
		        {field:'author',title:'著者',width:100},
		        {field:'collections',title:'馆藏分布',width:100},
		        {field:'inputcode',title:'输入码',width:100}
		    ]],
		    data:rs,
		    onChange:function(v1,v2){
		    	var p={};
				p.bid2=$('#bid').combogrid('getValue');
				var rs=myRunSqlProcedure('test4',p);
				$('#bid').combogrid('grid').datagrid('loadData', rs);
		    },
		    onSelect:function(index,row){
		    	row2=row;
		    	console.log(111,row2);
		    	$('#bname').textbox('setValue',row.bookname);
		    	$('#bcode1').textbox('setValue',row.code);
		    	$('#bisbn1').textbox('setValue',row.bookid);
		    	
		    }
		});
		
		   
		myTextField('bname','formpanel','书刊名称',68,50,35,30,140);
		myTextField('bcode1','formpanel','书刊条码',68,90,35,30,140);
		myTextField('bisbn1','formpanel','ISBN/ISSN',78,130,25,30,140);
		
		var s='<div style="position:absolute;left:270px;top:10px;width:208px;height:30px;"><input id="rid" class="easyui-combogrid" style="width:100%;height:100%;"></div>';
		$('#formpanel').append(s);
		$('#rid').combogrid();
		var p={};
		var rs=myRunSqlProcedure('test5',p).rows;
		var label='<span style="font-family:楷体;">'+'读者编码'+'</span>';
		$('#rid').combogrid({
			label:label,
			labelWidth:68,
		    panelWidth:500,
		    idField:'account',
		    textField:'account',
		    mode:'remote',
		    columns:[[
		        {field:'account',title:'读者账号',width:100},
		        {field:'name',title:'读者姓名',width:100},
		        {field:'level',title:'读者类别',width:100},
		        {field:'idnumber',title:'身份证号',width:100},
		        {field:'gender',title:'性别',width:100},
		        {field:'phone',title:'手机号',width:100},
		        {field:'address',title:'地址',width:100}
		    ]],
		    data:rs,
		    onSelect:function(index,row){
		    	console.log(222,row);
		    	$.messager.prompt("操作提示","请输入登陆密码：",function(data){
		    		if(data==user.password){
		    			$('#rname').textbox('setValue',row.name);
				    	$('#ridnumber').textbox('setValue',row.idnumber);
				    	$('#rlevel').textbox('setValue',row.level);
		    		}else{
		    			$('#rid').combogrid('setValue','');
		    			myMessagebox("密码错误！","error");
		    		}
		    	});
		    	
		    }
		});
		
		myTextField('rname','formpanel','读者名称',68,50,270,30,140);
		myTextField('ridnumber','formpanel','身份证号',68,90,270,30,140);
		myTextField('rlevel','formpanel','读者类别',68,130,270,30,140);
		
		var ss='<div style="position:absolute;top:10px;left:510px;"><a id="action" href="javascript:void(0)" class="easyui-linkbutton" style="width:90px;height:150px;"></a></div>';
		$('#formpanel').append(ss);
		
		var str='<div id="borrowgrid" class="easyui-datagrid" style="overflow:auto;"></div>';
		$('#gridpanel').append(str);
		$('#borrowgrid').datagrid({
			fit:true,
			border:false,
			rownumbers: false,
			pagination:false, 
			singleSelect:true,
			nowrap: true,
			striped:true,
			columns:[[	
						{title:'借书编号',field:'borrowid', width:90, halign:'center', align:'center'},
						{title:'借出日期',field:'borrowdate', width:90, halign:'center', align:'center'},
						{title:'应还日期',field:'requireddate', width:150, halign:'center', align:'center'},
					    {title:'逾期天数',field:'exceeddays', width:160, halign:'center', align:'center'},
					    {title:'书刊名称',field:'bookname', width:100, halign:'center', align:'center'},
					    {title:'ISBN',field:'bookid', width:100, halign:'center', align:'center'},
					    {title:'书刊条码',field:'code', width:100, halign:'center', align:'center'},
					    {title:'归还日期',field:'returndate', width:100, halign:'center', align:'center'},
					    {title:'借出操作员',field:'boperator', width:100, halign:'center', align:'center'},
					    {title:'归还操作员',field:'roperator', width:100, halign:'center', align:'center'}
			        ]],
			 onSelect:function(index,row){
				 $('#bname').textbox('setValue',row.bookname);
				 $('#bcode1').textbox('setValue',row.code);
				 $('#bisbn1').textbox('setValue',row.bookid);
			 }
		});
		$('#myWin2').window('close');


		$('#cmdcancel').click(function(){
			$('#bid').textbox('setValue','');
			$('#bname').textbox('setValue','');
			$('#bcode1').textbox('setValue','');
			$('#bisbn1').textbox('setValue','');
			$('#rid').textbox('setValue','');
			$('#rname').textbox('setValue','');
			$('#ridnumber').textbox('setValue','');
			$('#rlevel').textbox('setValue','');
			$('#borrowgrid').datagrid('loadData',[]);
		});
		$('#cmdborrow').click(function(){
			action='borrow';
			$('#action').linkbutton({
				text:'借出此书',
				iconCls:'icon-redo'
			});
		});
		$('#cmdback').click(function(){
			action='back';
			$('#action').linkbutton({
				text:'归还此书',
				iconCls:'icon-undo'
			});	
		});
		$('#cmdcontinue').click(function(){
			action='continue';
			$('#action').linkbutton({
				text:'续借此书',
				iconCls:'icon-add'
			});
		});
		$('#action').click(function(){
			var bid=$('#bcode1').textbox('getValue');
			var rid=$('#rid').combogrid('getValue');
			if(bid==''||rid=='')$('#action').linkbutton('disable');
			else{
				if(action=='borrow'){
					var rows=$('#borrowgrid').datagrid('getRows');
					if(user.level==1&&rows.length==3)$('#action').linkbutton('disable');
					else if(user.level==2&&rows.length==6)$('#action').linkbutton('disable');
					else if(user.level==3&&rows.length==10)$('#action').linkbutton('disable');
					else if(user.level==4&&rows.length==20)$('#action').linkbutton('disable');
					if(row2.conditions=='借出')$('#action').linkbutton('disable');
					else{
						$('#action').linkbutton('enable');
						$.messager.confirm("操作提示","<div style='text-align:center;'>借出此书？</div>",function(data){
							if(data){
								var row={};
								row.borrowdate=getTime();
								if(user.level==1){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+30);
									row.requireddate=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}else if(user.level==2){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+60);
									row.requireddate=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}else if(user.level==3){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+120);
									row.requireddate=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}else if(user.level==4){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+150);
									row.requireddate=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}
								row.code=bid;
								row.account=rid;
								row.isreturn=0;
								row.exceeddays=0;
								row.returndate='';
								row.boperator=user.userid;
								row.roperator='';
								row._action='add';
								var p={};
								p.database='mybookstore';
								p.tablename='mybookstore.borrow';
								p.keyfield='borrowid';
								p.sortfield='';
								p.data=[];
								p.data.push(row);
								var rs=myRunSqlProcedure('sys_runEditRows',p);
								var p={};
								p.code=bid;
								var rs=myRunSqlProcedure('test6',p);
							}
							myMessagebox("借书成功！","warning");
							$('#myWin2').window('close');
							var p={};
							p.date=getTime();
							var rs=myRunSqlProcedure('test10',p);
						});
						
					}
					
				}
				else if(action=='back'){
						$.messager.confirm("操作提示","<div style='text-align:center;'>归还此书？</div>",function(data){
							if(data){
								var p={};
								p.code=$('#bcode1').textbox('getValue');
								p.date=getTime();
								p.userid=user.userid;
								var rs=myRunSqlProcedure('test8',p);
								console.log(555,p);
								myMessagebox("还书成功！","warning");
								$('#myWin2').window('close');
							}
						});
					}
				else if(action=='continue'){
					row3=$('#borrowgrid').datagrid('getSelected');
						$.messager.confirm("操作提示","<div style='text-align:center;'>续借此书？</div>",function(data){
							if(data){
								console.log(888,row3);
								var p={};
								p.borrowid=row3.borrowid;
								p.date1=getTime();
								if(user.level==1){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+30);
									p.date2=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}else if(user.level==2){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+60);
									p.date2=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}else if(user.level==3){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+120);
									p.date2=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}else if(user.level==4){
									var date1=new Date();
									var date2=new Date(date1);
									date2.setDate(date1.getDate()+150);
									p.date2=(date2.getFullYear()+'-'+(date2.getMonth()+1)+'-'+date2.getDate());
								}
								var rs=myRunSqlProcedure('test9',p); 
								
								myMessagebox("续借成功！","warning");
								var p={};
								p.date=getTime();
								var rs=myRunSqlProcedure('test10',p);
								$('#myWin2').window('close');
							}
						});
				}
			}
			//$('#myWin2').window('close');
		});
		
		$('#jiechu').click(function(){
			$('#myWin2').window('open');
			empty();
			action='borrow';
			var p={};
			p.date=getTime();
			var rs=myRunSqlProcedure('test10',p);
			$('#action').linkbutton({
				text:'借出此书',
				iconCls:'icon-redo'
			});
			
		});
		//归还按钮
		$('#guihuan').click(function(){
			$('#myWin2').window('open');
			empty();
			action='back';
			var p={};
			p.date=getTime();
			var rs=myRunSqlProcedure('test10',p);
			$('#action').linkbutton({
				text:'归还此书',
				iconCls:'icon-undo'
			});
		});
		//续借按钮
		$('#xujie').click(function(){
			$('#myWin2').window('open');
			empty();
			action='continue';
			var p={};
			p.date=getTime();
			var rs=myRunSqlProcedure('test10',p);
			$('#action').linkbutton({
				text:'续借此书',
				iconCls:'icon-add'
			});
		});
		//书刊目录的按钮
		$('#mulu').click(function(){
			window.open("kesheshukanmulu.jsp");
		});
		//复本列表的按钮
		$('#fuben').click(function(){
			window.open("keshefubenliebiao.jsp");
		});
		//读者管理的按钮
		$('#duzhe').click(function(){
			window.open("kesheduzheguanli.jsp");
		});
		//借阅记录的按钮
		$('#jieyue').click(function(){
			window.open("keshejieyuejilu.jsp");
		});
		//逾期记录的按钮
		$('#yuqi').click(function(){
			window.open("kesheyuqijilu.jsp");
		});
		//借阅统计
		$('#tongji').click(function(){
			window.open("keshejieyuetongji.jsp");
		});
		//书刊类别
		$('#myWin3').window({title:'书刊类别设置',width:630,height:490,iconCls:'titleIcon',
			closable:true,collapsible:false,maximizable:false,minimizable:false,modal:true,left:350,top:5});
		$('#toolbar3').panel();
		$('#treepanel').panel();
		$('#formpanel3').panel();
		myButtonGroup('tbar3', 'toolbar3', '新增/popadd/addIcon;修改/popedit/editIcon;删除/popdelete/deleteIcon;保存/popsave/saveIcon;', 2, 0, 0, 66, -2);
		$('#myWin3').window('close');
		myTextField('cid','formpanel3','类别编号',68,10,10,30,200);
		myTextField('cname','formpanel3','类别名称',68,50,10,30,200);
		var p={};
		p.style='full';
		var rs=myRunTreeProcedure('tree_3',p);
		$('#myTree3').tree({
			data:rs,
			onSelect:function(node){
				$('#cid').textbox('setValue',node.categoryid);
				$('#cname').textbox('setValue',node.categoryname);
			}
		});
		$('#shukan').click(function(){
			$('#myWin3').window('open');
		});
		$('#popadd').click(function(){
			addoredit='add';
			var node=$('#myTree3').tree('getSelected');
			$('#cid').textbox('setValue','');
			$('#cname').textbox('setValue','');
			var row={};
			row.id='';
			row.text='';
			$('#myTree3').tree('append',{
				parent:node.target,
				data:row
			});
			var cnode=$('#myTree3').tree('find','');
			$('#myTree3').tree('select',cnode.target);
		});
		$('#popedit').click(function(){
			addoredit='replace';
		});
		$('#popdelete').click(function(){
			var node=$('#myTree3').tree('getSelected');
			var pnode=$('#myTree3').tree('getParent',node.target);
			var cnodes=$('#myTree3').tree('getChildren',pnode.target);
			var row={};
			row._action='delete';
			row.categoryid=node.categoryid;
			var p={};
			p.database='mybookstore';
			p.tablename='mybookstore.categories';
			p.keyfield='categoryid';
			p.sortfield='';
			p.data=[];
			p.data.push(row);
			var rs=myRunSqlProcedure('sys_runEditRows',p);
			var bnodes=myGetBrotherTreeNode('myTree3', node);
			$("#myTree1").tree("remove", node.target); 
			if (bnodes[1]!=null) $("#myTree3").tree("select", bnodes[1].target);
			else if (bnodes[0]!=null) $("#myTree3").tree("select", bnodes[0].target);
			else if (pnode!=null) $("#myTree3").tree("select", pnode.target);
			$('#myTree3').tree('remove',node.target);
		});
		$('#popsave').click(function(){
			var node=$('#myTree3').tree('getSelected');
			var pnode=$('#myTree3').tree('getParent',node.target);
			if(addoredit=='add'){
				var row={};
				row.id=$('#cid').textbox('getValue');
				row.text=$('#cname').textbox('getValue');
				row.categoryid=$('#cid').textbox('getValue');
				row.categoryname=$('#cname').textbox('getValue');
				row.parentnodeid=pnode.categoryid;
				row.isparentflag=0;
				row.level=parseInt(pnode.level)+1;
				row.ancester=pnode.ancester+pnode.categoryid+'#';
				row._action='add';
				var p={};
				p.database='mybookstore';
				p.tablename='mybookstore.categories';
				p.keyfield='categoryid';
				p.sortfield='';
				p.data=[];
				p.data.push(row);
				var rs=myRunSqlProcedure('sys_runEditRows',p);
				$('#myTree3').tree('update',{
					target:node.target,
					text:row.text
				});
			}else{
				var row={};
				row.id=$('#cid').textbox('getValue');
				row.text=$('#cname').textbox('getValue');
				row.categoryid=$('#cid').textbox('getValue');
				row.categoryname=$('#cname').textbox('getValue');
				row.parentnodeid=pnode.categoryid;
				row.isparentflag=node.isparentflag;
				row.level=node.level;
				row.ancester=node.ancester;
				row._action='replace';
				var p={};
				p.database='mybookstore';
				p.tablename='mybookstore.categories';
				p.keyfield='categoryid';
				p.sortfield='';
				p.data=[];
				p.data.push(row);
				var rs=myRunSqlProcedure('sys_runEditRows',p);
				$('#myTree3').tree('update',{
					target:node.target,
					text:row.text
				});
			}			
		});
		//读者类别
		$('#myWin4').window({title:'读者类别设置',width:630,height:490,iconCls:'titleIcon',
			closable:true,collapsible:false,maximizable:false,minimizable:false,modal:true,left:350,top:5});
		$('#toolbar4').panel();
		$('#treepanel4').panel();
		$('#formpanel4').panel();
		myButtonGroup('tbar4', 'toolbar4', '新增/popadd4/addIcon;修改/popedit4/editIcon;删除/popdelete4/deleteIcon;保存/popsave4/saveIcon', 2, 0, 0, 66, -2);
		$('#myWin4').window('close');
		myTextField('level','formpanel4','等级编号',68,10,10,30,200);
		myTextField('title','formpanel4','等级名称',68,50,10,30,200);
		myTextField('booknumber','formpanel4','可借书目',68,90,10,30,200);
		myTextField('days','formpanel4','可借时间',68,130,10,30,200);
		myTextField('longdays','formpanel4','续借时间',68,170,10,30,200);
		var p={};
		p.style='full';
		var rs=myRunTreeProcedure('tree_2',p);
		$('#myTree4').tree({
			data:rs,
			onSelect:function(node){
				$('#level').textbox('setValue',node.levelid);
				$('#title').textbox('setValue',node.title);
				$('#booknumber').textbox('setValue',node.booknumber);
				$('#days').textbox('setValue',node.days);
				$('#longdays').textbox('setValue',node.longdays);
			}
		});
		$('#duzheleibie').click(function(){
			$('#myWin4').window('open');
		});
		$('#popadd4').click(function(){
			addoredit='add';
			var node=$('#myTree4').tree('getSelected');
			$('#level').textbox('setValue','');
			$('#title').textbox('setValue','');
			$('#booknumber').textbox('setValue','');
			$('#days').textbox('setValue','');
			$('#longdays').textbox('setValue','');
			var row={};
			row.id='';
			row.text='';
			$('#myTree4').tree('append',{
				parent:node.target,
				data:row
			});
			var cnode=$('#myTree4').tree('find','');
			$('#myTree4').tree('select',cnode.target);
		});
		$('#popedit4').click(function(){
			addoredit='replace';
		});
		$('#popdelete4').click(function(){
			var node=$('#myTree4').tree('getSelected');
			var pnode=$('#myTree4').tree('getParent',node.target);
			var cnodes=$('#myTree4').tree('getChildren',pnode.target);
			var row={};
			row._action='delete';
			row.level=node.levelid;
			var p={};
			p.database='mybookstore';
			p.tablename='mybookstore.level';
			p.keyfield='level';
			p.sortfield='';
			p.data=[];
			p.data.push(row);
			var rs=myRunSqlProcedure('sys_runEditRows',p);
			var bnodes=myGetBrotherTreeNode('myTree4', node);
			if (bnodes[1]!=null) $("#myTree4").tree("select", bnodes[1].target);
			else if (bnodes[0]!=null) $("#myTree4").tree("select", bnodes[0].target);
			else if (pnode!=null) $("#myTree4").tree("select", pnode.target);
			$('#myTree4').tree('remove',node.target);
		});
		$('#popsave4').click(function(){
			var node=$('#myTree4').tree('getSelected');
			var pnode=$('#myTree4').tree('getParent',node.target);
			if(addoredit=='add'){
				var row={};
				row.text=$('#title').textbox('getValue');
				row.level=$('#level').textbox('getValue');
				row.title=$('#title').textbox('getValue');
				row.booknumber=$('#booknumber').textbox('getValue');
				row.days=$('#days').textbox('getValue');
				row.longdays=$('#longdays').textbox('getValue');
				row._action='add';
				var p={};
				p.database='mybookstore';
				p.tablename='mybookstore.level';
				p.keyfield='level';
				p.sortfield='';
				p.data=[];
				p.data.push(row);
				var rs=myRunSqlProcedure('sys_runEditRows',p);
				$('#myTree4').tree('update',{
					target:node.target,
					text:row.text
				});
			}else{
				var row={};
				row.text=$('#title').textbox('getValue');
				row.level=$('#level').textbox('getValue');
				row.title=$('#title').textbox('getValue');
				row.booknumber=$('#booknumber').textbox('getValue');
				row.days=$('#days').textbox('getValue');
				row.longdays=$('#longdays').textbox('getValue');
				row._action='replace';
				var p={};
				p.database='mybookstore';
				p.tablename='mybookstore.level';
				p.keyfield='level';
				p.sortfield='';
				p.data=[];
				p.data.push(row);
				var rs=myRunSqlProcedure('sys_runEditRows',p);
				$('#myTree4').tree('update',{
					target:node.target,
					text:row.text
				});
			}
			
			
		});
		//计算逾期天数
		var p={};
		p.date=getTime();
		var rs=myRunSqlProcedure('test10',p);
		//sidemenu
		$('#sidemenu').sidemenu({
			onSelect:function(item){
				if(item.text=='书刊信息维护')window.open("kesheshukanmulu.jsp");
				else if(item.text=='书刊类别设置')$('#myWin3').window('open');
				else if(item.text=='读者信息维护')window.open("kesheduzheguanli.jsp");
				else if(item.text=='读者类别设置')$('#myWin4').window('open');
				else if(item.text=='借书还书续借')$('#myWin2').window('open');
				else if(item.text=='借阅记录查询')window.open("keshejieyuejilu.jsp");
				else if(item.text=='逾期记录查询')window.open("kesheyuqijilu.jsp");
				else if(item.text=='借阅记录统计')window.open("keshejieyuetongji.jsp");
			}
		});
	}); //end of jquery

	function fntoURL(node){
		console.log(node.url,node.id);
		if (node.isparentflag>0 || node.url=='') return;
		$("#menuframe").attr('src', node.url);
		//$("#menuframe").attr('xxmlfile', node.xmlfile);		
	}
	function fnFocus(id){
		$("#"+id).next("span").find("input").focus();	
	}

	function fnKeyDownEvent(e,ed){
		var key=e.which;
		var row=[];
		row.push('bookid');
		row.push('bookname');
		row.push('inputcode');
		row.push('author');
		row.push('collection');
		row.push('categoryid');
		row.push('categoryname');
		row.push('press');
		row.push('area');
		row.push('publishdate');
		if(key==13 || key==40){
			for(var i=0;i<row.length;i++){
				if(row[i]==ed)
					$('#'+row[i+1]).textbox('textbox').focus();
			}
		}
		if(key==38){
			for(var i=0;i<row.length;i++){
				if(row[i]==ed)
					$('#'+row[i-1]).textbox('textbox').focus();
			}
		}
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
function days(date1,date2){//计算两个日期相差的天数
	var sdate=Date.parse(date1);
	var edate=Date.parse(date2);
	var days=(edate-sdate)/(1*24*60*60*1000);
	console.log(777,days);
}
function empty(){
	p={};
	p.bid2='';
	rs=myRunSqlProcedure('test4',p);
	$('#bid').combogrid('grid').datagrid('loadData', rs);
	$('#bid').textbox('setValue','');
	$('#bname').textbox('setValue','');
	$('#bcode1').textbox('setValue','');
	$('#bisbn1').textbox('setValue','');
	$('#rid').textbox('setValue','');
	$('#rname').textbox('setValue','');
	$('#ridnumber').textbox('setValue','');
	$('#rlevel').textbox('setValue','');
	var p={};
	p.rid=user.userid;
	var rs=myRunSqlProcedure('test7',p);
	console.log(444,rs.rows);
	$('#borrowgrid').datagrid({data:rs.rows});
}
	
</script>
</html>
