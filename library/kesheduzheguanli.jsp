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
	<div id="toolbar2" class="easyui-panel" data-options="region:'north',split:false,height:31" style="background-color:#E0ECFF;"></div>
	<div id="treepanel" class="easyui-panel" data-options="region:'west',split:true,width:250">
		<div id="myTree1" class="easyui-tree"></div>
	</div>
	<div id="gridpanel" class="easyui-panel" data-options="region:'center',border:false,doSize:true">
		<div id="myGrid1" class="easyui-datagrid"></div>
	</div>
	<div id="formpanel" class="easyui-panel" data-options="region:'center',border:false,doSize:true"></div>
</body>
<script>
rowheight=50;
$(function(){	
	myButtonGroup('tbar1', 'toolbar1', '新增/cmdadd/addIcon;修改/cmdedit/editIcon;删除/cmddelete/deleteIcon;-;刷新/cmdrefresh/refreshIcon;-;关闭/cmdclose/icon-cancel;', 2, 0, 0, 66, -2);
	myButtonGroup('tbar2','toolbar2','返回/cmdexit/exitIcon;保存/cmdsave/saveIcon;-;', 2, 0, 0, 66, -2);
	$('#toolbar2').panel('close');
	$('#formpanel').panel('close');
	myTextField('account','formpanel','用户账号:', 68, 1*rowheight+10,20,0, 280);
	myTextField('name','formpanel','用户名称:', 68, 2*rowheight+10,20,0, 280);
	myComboField('levelid','formpanel','用户类别:', 68, 3*rowheight+10,20,0, 280, 'gender','1,普通读者;2,高级读者;3,特殊读者');
	myComboField('gender','formpanel','性别:', 68, 4*rowheight+10,20,0, 280, 'gender','男;女');
	myTextField('phone','formpanel','手机号:', 68, 5*rowheight+10,20,0, 280);
	myTextField('address','formpanel','地址:', 68, 6*rowheight+10,20,0, 280);
	myTextField('idnumber','formpanel','身份证号:', 68, 7*rowheight+10,20,0, 280);
	myDateField('signdate','formpanel','登记日期:', 68, 8*rowheight+10,20,0, 280);
	$('#account').textbox({readonly:true});
	fnFocus("name");
	$('#account').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'account');
	});
	$('#name').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'name');
	});
	$('#levelid').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'level');
	});
	$('#gender').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'gender');
	});
	$('#phone').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'phone');
	});
	$('#address').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'address');
	});
	$('#idnumber').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'idnumber');
	});
	$('#signdate').textbox('textbox').bind('keydown',function(e){
		fnKeyDownEvent(e,'signdate');
	});
	
	
	
	var p={};
	p.style='full';
	var rs=myRunTreeProcedure('tree_2',p);
	$('#myTree1').tree({
		data:rs,
		onSelect:function(node){
			var opts=$(this).tree('options');
			fnLoadGridData();
		}
	});
	$('#myGrid1').datagrid({
		rownumbers:true,
		fit:true,
		pagination:false,
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		columns:[[
		          	{title:'用户账号',field:'account',width:200,halign:'center',align:'center'},
		          	{title:'用户名称',field:'name',width:200,halign:'center',align:'center'},
		          	{title:'用户分类',field:'title',width:200,halign:'center',align:'center'},
		          	{title:'性别',field:'gender',width:100,halign:'center',align:'center'},
		          	{title:'身份证号',field:'idnumber',width:100,halign:'center',align:'center'},
		          	{title:'登记日期',field:'signdate',width:100,halign:'center',align:'center'}
		          ]],
frozenColumns:[[
					{title:'',field:'checkbox',width:30,halign:'center',align:'center',checkbox:true}
                ]],
onDblClickRow:function(index,row){
	$('#toolbar1').panel('close');
	$('#treepanel').panel('close');
	$('#gridpanel').panel('close');
	$('#toolbar2').panel('open');
	$('#formpanel').panel('open');
},
onSelect:function(index,row){
	$('#account').textbox('setValue',row.account);
	$('#name').textbox('setValue',row.name);
	$('#levelid').combobox('setValue',row.title);
	$('#gender').combobox('setValue',row.gender);
	$('#idnumber').textbox('setValue',row.idnumber);
	$('#address').textbox('setValue',row.address);
	$('#phone').textbox('setValue',row.phone);
	$('#signdate').textbox('setValue',row.signdate);
}
	});
	
	
	var node=$('#myTree1').tree('getRoot');
	$('#myTree1').tree('select',node.target);
	$('#cmdrefresh').click(function(){
		var node=$('#myTree1').tree('getRoot');
		$('#myTree1').tree('select',node.target);
		fnLoadGridData();
	});
	$('#cmdclose').click(function(){
		window.location.href='keshemain.jsp';
	});
	$('#cmdexit').click(function(){
		$('#toolbar1').panel('open');
		$('#treepanel').panel('open');
		$('#gridpanel').panel('open');
		$('#toolbar2').panel('close');
		$('#formpanel').panel('close');
	});
	$('#cmdadd').click(function(){
		window.location.href="kesheregister.jsp";
	});
	$('#cmdedit').click(function(){
		var row=$('#myGrid1').datagrid('getSelected');
		$('#toolbar1').panel('close');
		$('#treepanel').panel('close');
		$('#gridpanel').panel('close');
		$('#toolbar2').panel('open');
		$('#formpanel').panel('open');
		$('#account').textbox('setValue',row.account);
		$('#name').textbox('setValue',row.name);
		$('#levelid').combobox('setValue',row.title);
		$('#gender').combobox('setValue',row.gender);
		$('#idnumber').textbox('setValue',row.idnumber);
		$('#address').textbox('setValue',row.address);
		$('#phone').textbox('setValue',row.phone);
		$('#signdate').textbox('setValue',row.signdate);
	});
	$('#cmddelete').click(function(){
		var rows=$('#myGrid1').datagrid('getRows');
		var row=$('#myGrid1').datagrid('getSelected');
		var index=$('#myGrid1').datagrid('getRowIndex',row);
		var p={};
		p.account=row.account;
		var rs=myRunSqlProcedure('test12',p);
		$('#myGrid1').datagrid('deleteRow',index);
		if(index<rows.length-1){
			$('#myGrid1').datagrid('selectRow',index);
		}
		else {
			$('#myGrid1').datagrid('selectRow',index-1);
		}
	});
	$('#cmdsave').click(function(){
		var row=$('#myGrid1').datagrid('getSelected');
		var index=$('#myGrid1').datagrid('getRowIndex',row);
		var row1={};
		row1.account=$('#account').textbox('getValue');
		row1.name=$('#name').textbox('getValue');
		row1.level=row.level;
		row1.gender=$('#gender').combobox('getValue');
		row1.idnumber=$('#idnumber').textbox('getValue');
		row1.address=$('#address').textbox('getValue');
		row1.phone=$('#phone').textbox('getValue');
		row1.signdate=$('#signdate').textbox('getValue');
		row1.password=row.password;
		row1.answer=row.answer;
		row1._action='replace';
		var p={};
		p.database='mybookstore';
		p.tablename='mybookstore.readers';
		p.keyfield='account';
		p.sortfield='';
		p.data=[];
		p.data.push(row1);
		var rs=myRunSqlProcedure('sys_runEditRows',p);
		$('#myGrid1').datagrid('updateRow',{
			index:index,
			row:row1
		});
		$('#toolbar1').panel('open');
		$('#treepanel').panel('open');
		$('#gridpanel').panel('open');
		$('#toolbar2').panel('close');
		$('#formpanel').panel('close');
	});
});
function fnLoadGridData(){
	var node=$('#myTree1').tree('getSelected');
	var p={};
	p.levelid=node.levelid;
	var rs=myRunSqlProcedure('grid_3',p);
	console.log(rs.rows);
	$('#myGrid1').datagrid('loadData',rs);
	$('#myGrid1').datagrid('selectRow',0);
}

function fnKeyDownEvent(e,ed){
	var key=e.which;
	var row=[];
	row.push('account');
	row.push('name');
	row.push('levelid');
	row.push('gender');
	row.push('phone');
	row.push('address');
	row.push('idnumber');
	row.push('signdate');
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
function fnFocus(id){
	$("#"+id).next("span").find("input").focus();	
}

 
</script>	
</body>
</html>