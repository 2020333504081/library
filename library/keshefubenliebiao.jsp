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
	<div id="treepanel" class="easyui-panel" data-options="region:'west',split:true,width:250">
		<div id="myTree1" class="easyui-tree"></div>
	</div>
	<div id="gridpanel" class="easyui-panel" data-options="region:'center',border:false,doSize:true">
		<div id="myGrid1" class="easyui-datagrid"></div>
	</div>
	
</body>
<script>
rowheight=50;
$(function(){	
	myButtonGroup('tbar1', 'toolbar1', '刷新/cmdrefresh/refreshIcon;-;删除/cmddelete/deleteIcon;-;关闭/cmdclose/icon-cancel;', 2, 0, 0, 66, -2);
	
	var p={};
	p.style='expand';
	p.parentnodeid='';
	var rs=myRunTreeProcedure('tree_1',p);
	$('#myTree1').tree({
		data:rs,
		onExpand:function(node){
			var cnodes=$('#myTree1').tree('getChildren', node.target);
			if (cnodes.length==1 && cnodes[0].text.trim()==''){
				for (var i=0; i<cnodes.length; i++){
					$('#myTree1').tree('remove', cnodes[i].target);
				}
			}
				var p={};
				p.level=node.level;
				p.parentnodeid=node.categoryid;
				var rs=myRunTreeProcedure('tree_1',p);
				console.log(rs);
				$('#myTree1').tree('append',{
					parent:node.target,
					data:rs
				});
		},
		onDblClick: function(node){  //父节点展开，叶子节点选中
			if (!$(this).tree('isLeaf', node.target)){
				if (node.state=='closed') $(this).tree('expand', node.target);  //open
				else $(this).tree('collapse', node.target);
			}
		},
		onSelect:function(node){
			var opts=$(this).tree('options');
			fnLoadGridData(1);
		}
	});
	$('#myGrid1').datagrid({
		rownumbers:true,
		fit:true,
		pagination:true,
		pageNumber:1,
		pageSize:20,
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		columns:[[
					{title:'书刊条码',field:'code',width:200,halign:'center',align:'center'},
					{title:'状态',field:'conditionid',width:100,halign:'center',align:'center'},
					{title:'登记时间',field:'signdate',width:200,halign:'center',align:'center'},
					{title:'操作员',field:'operator',width:200,halign:'center',align:'center'},
					{title:'ISBN',field:'bookid',width:200,halign:'center',align:'center'},
		          	{title:'书刊名称',field:'bookname',width:200,halign:'center',align:'center'},
		          	{title:'著者',field:'author',width:200,halign:'center',align:'center'},
		          	{title:'分类编码',field:'categoryid',width:100,halign:'center',align:'center'},
		          	{title:'分类名称',field:'categoryname',width:100,halign:'center',align:'center'},
		          	{title:'馆藏分类',field:'collections',width:100,halign:'center',align:'center'},
		          	{title:'出版社',field:'press',width:100,halign:'center',align:'center'}
		          ]],
frozenColumns:[[
					{title:'',field:'checkbox',width:30,halign:'center',align:'center',checkbox:true}
                ]]	
	});
	$("#myGrid1").datagrid("getPager").pagination({  
		pageList: [10,20,50,100,200,300,500],
		showPageList: false, 
		beforePageText:'第',
		afterPageText:'页&nbsp;共{pages}页', 
		displayMsg:'当前显示第{from}～{to}行，共{total}行',
		onSelectPage:function(pageno, pagesize){
			fnLoadGridData(pageno);
		}  
	});
	

	var node=$('#myTree1').tree('getRoot');
	$('#myTree1').tree('select',node.target);
	$('#cmdrefresh').click(function(){
		var node=$('#myTree1').tree('getRoot');
		$('#myTree1').tree('select',node.target);
		fnLoadGridData(1);
	});
	$('#cmdclose').click(function(){
		window.location.href='keshemain.jsp';
	});
	$('#cmddelete').click(function(){
		var rows=$('#myGrid1').datagrid('getRows');
		var row=$('#myGrid1').datagrid('getSelected');
		var index=$('#myGrid1').datagrid('getRowIndex',row);
		if(row.conditions=='1'){
			var p={};
			p.bookid=row.bookid;
			p.code=row.code;
			var rs=myRunSqlProcedure('test11',p);
			var opts=$('#myGrid1').datagrid('options');
			var pageno=opts.pageNumber;
			fnLoadGridData(pageno);
			if(index<rows.length-1){
				console.log(rows.length);
				$('#myGrid1').datagrid('selectRow',index);
			}
			else {
				$('#myGrid1').datagrid('selectRow',index-1);
			}
		}
		
	});

});
function fnLoadGridData(pageno){
	var node=$('#myTree1').tree('getSelected');
	var opts=$('#myGrid1').datagrid('options');
	var pagesize=opts.pageSize;
	opts.pageNumber=pageno;
	var p={};
	p.categoryid=node.categoryid;
	p.isparentflag=node.isparentflag;
	p.pageno=pageno;
	p.pagesize=pagesize;
	var rs=myRunSqlProcedure('grid_2',p);
	if(rs.rows.length>0)rs.total=rs.rows[0].total;
	else rs.total=0;
	$('#myGrid1').datagrid('loadData',rs);
	$('#myGrid1').datagrid('selectRow',0);
}

 
</script>	
</body>
</html>