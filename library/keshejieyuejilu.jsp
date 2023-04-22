<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ include file="system/easyui_header_plugin.jsp"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<html>
<style>

</style>
<head>
</head>
<body class="easyui-layout" data-options="fit:true">
	<div id="toolbar1" class="easyui-panel" data-options="region:'north',split:false,height:31" style="background-color:#E0ECFF;"></div>
	<div id="gridpanel" class="easyui-panel" data-options="region:'center',border:false,doSize:true">
		<div id="myGrid1" class="easyui-datagrid"></div>
	</div>
</body>
<script>
user=myGetCookie("user");
$(function(){	
	myButtonGroup('tbar1', 'toolbar1', '归还/cmdback/icon-undo;-;刷新/cmdrefresh/refreshIcon;-;关闭/cmdclose/icon-cancel;', 2, 0, 0, 66, -2);
	myComboField('fanwei','toolbar1','',0,2,1150,27,100,'fanwei','全部;借出;已还');
	
	
	$('#fanwei').combobox({
		onChange:function(){
			fnLoadGridData();
		}
	});
	$('#fanwei').combobox('select','全部');
	$('#myGrid1').datagrid({
		rownumbers:true,
		fit:true,
		pagination:false,
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		columns:[[
		          	{title:'借阅编号',field:'borrowid',width:100,halign:'center',align:'center'},
		          	{title:'借出日期',field:'borrowdate',width:100,halign:'center',align:'center'},
		          	{title:'应还日期',field:'requireddate',width:100,halign:'center',align:'center'},
		          	{title:'逾期天数',field:'exceeddays',width:100,halign:'center',align:'center'},
		          	{title:'书刊条码',field:'code',width:100,halign:'center',align:'center'},
		          	{title:'ISBN',field:'bookid',width:200,halign:'center',align:'center'},
		          	{title:'书刊名称',field:'bookname',width:200,halign:'center',align:'center'},
		          	{title:'馆藏分类',field:'collections',width:100,halign:'center',align:'center'},
		          	{title:'分类名称',field:'categoryname',width:100,halign:'center',align:'center'},
		          	{title:'读者账号',field:'boperator',width:100,halign:'center',align:'center'},
		          	{title:'读者名称',field:'name',width:100,halign:'center',align:'center'},
		          	{title:'读者类别',field:'title',width:100,halign:'center',align:'center'},
		          	{title:'是否归还',field:'isreturned',width:100,halign:'center',align:'center'},
		          	{title:'归还日期',field:'returndate',width:100,halign:'center',align:'center'},
		          	{title:'归还操作员',field:'roperator',width:100,halign:'center',align:'center'}
		          ]],
frozenColumns:[[
					{title:'',field:'checkbox',width:30,halign:'center',align:'center',checkbox:true}
                ]]
	});
	$('#cmdclose').click(function(){
		window.location.href='keshemain.jsp';
	});

	$('#cmdrefresh').click(function(){
		fnLoadGridData();
	});
	$('#cmdback').click(function(){
		var row=$('#myGrid1').datagrid('getSelected');
		if(row.isreturn=='0'){
			$.messager.prompt("操作提示","请输入登陆密码：",function(data){
	    		if(data==user.password){
	    			$.messager.confirm("操作提示","<div style='text-align:center;'>归还此书？</div>",function(data){
	    				if(data){
	    					var p={};
	    					p.code=row.code;
	    					p.date=getTime();
	    					p.userid=user.userid;
	    					var rs=myRunSqlProcedure('test8',p);
	    					console.log(555,p);
	    					myMessagebox("还书成功！","warning");
	    					fnLoadGridData();
	    				}
	    			});
	    		}else{
	    			myMessagebox("密码错误！","error");
	    		}
	    	});
			
		}else myMessagebox("此书已还！","warning");
		
	});
	fnLoadGridData();
});
function fnLoadGridData(){
	var sign=$('#fanwei').combobox('getText');
	var p={};
	p.sign=sign;
	var rs=myRunSqlProcedure('grid_4',p);
	$('#myGrid1').datagrid('loadData',rs);
	$('#myGrid1').datagrid('selectRow',0);
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
</body>
</html>