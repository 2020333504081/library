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
	myButtonGroup('tbar1', 'toolbar1', '刷新/cmdrefresh/refreshIcon;-;复本/cmdcondition/icon-remove;-;关闭/cmdclose/icon-cancel;', 2, 0, 0, 66, -2);
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
				$('#myGrid2').datagrid({data:rs1.rows});
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
			}
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
	ss+='<div id="myGrid2" class="easyui-datagrid" data-options="border:false"></div></div>';
	$('#myTabA1').append(ss);
	$('#myGrid2').datagrid({
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
		pagination:false,
		singleSelect:true,
		selectOnCheck:false,
		checkOnSelect:false,
		columns:[[
		          	{title:'ISBN',field:'bookid',width:200,halign:'center',align:'center'},
		          	{title:'书刊名称',field:'bookname',width:200,halign:'center',align:'center'},
		          	{title:'著者',field:'author',width:200,halign:'center',align:'center'},
		          	{title:'分类编码',field:'categoryid',width:100,halign:'center',align:'center'},
		          	{title:'分类名称',field:'categoryname',width:100,halign:'center',align:'center'},
		          	{title:'馆藏分类',field:'collections',width:100,halign:'center',align:'center'},
		          	{title:'出版社',field:'press',width:100,halign:'center',align:'center'}
		          ]],
frozenColumns:[[
					{title:'',field:'checkbox',width:30,halign:'center',align:'center',checkbox:true},
					{title:'新增',field:'action1',width:50,halign:'center',align:'center',
						formatter:function(value,row,index){
							var s='<a href="javascript:fnadd()"><img src="system/images/add.png"/></a>';
							return s;
						}	
					},
					{title:'修改',field:'action2',width:50,halign:'center',align:'center',
						formatter:function(value,row,index){
							var s='<a href="javascript:fnedit('+index+')"><img src="system/images/edit.png"/></a>';
							return s;
						}	
					},
					{title:'删除',field:'action3',width:50,halign:'center',align:'center',
						formatter:function(value,row,index){
							var s='<a href="javascript:fndelete(\''+row.rowid+'\')"><img src="system/images/delete_edit.png"/></a>';
							return s;
						}	
					}
                ]]	
	});
	
	
	$('#myWin1ok').click(function(){
		var row=$('#myGrid1').datagrid('getSelected');
		var index=$('#myGrid1').datagrid('getRowIndex',row);
		if(addoredit=='edit'){
			var row1={};
			row1.bookid=row.bookid;
			row1.bookname=$('#bookname').textbox('getValue');
			row1.author=$('#author').textbox('getValue');
			row1.collection=$('#collection').combobox('getValue');
			row1.categoryid=$('#categoryid').combogrid('getValue');
			row1.area=$('#area').textbox('getValue');
			row1.publishdate=$('#publishdate').textbox('getValue');
			row1.inputcode=$('#inputcode').textbox('getValue');
			row1.press=$('#press').textbox('getValue');
			row1.number=row.number;
			row1.borrow=row.borrow;
			row1.leftover=row.leftover;
			row1._action='replace';
			var p={};
			p.database='mybookstore';
			p.tablename='mybookstore.books';
			p.keyfield='bookid';
			p.sortfield='';
			p.data=[];
			p.data.push(row1);
			var rs=myRunSqlProcedure('sys_runEditRows',p);
			fnLoadGridData();
			$('#myGrid1').datagrid('selectRow',index);
		}else{
			var p={};
			p.bookid=$('#bookid').textbox('getValue');
			rs1=myRunSqlProcedure('test1',p);
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
		}
			$('#myWin1').window('close');
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
	$('#cmdcondition').click(function(){
		var row=$('#myGrid1').datagrid('getSelected');
		var index=$('#myGrid1').datagrid('getRowIndex',row);
		fnedit(index);
		var p={};
		p.bookid=row.bookid;
		rs1=myRunSqlProcedure('test1',p);
		if(rs1.rows.length>0){
			$('#myGrid2').datagrid({data:rs1.rows});
			var number=rs1.rows[0].number;
			var borrow=rs1.rows[0].borrow;
			var leftover=rs1.rows[0].leftover;
			$('#mylabel7').html(number);
			$('#mylabel8').html(borrow);
			$('#mylabel9').html(leftover);
		}
	});
});
function fnLoadGridData(){
	var node=$('#myTree1').tree('getSelected');
	var p={};
	p.categoryid=node.categoryid;
	p.isparentflag=node.isparentflag;
	var rs=myRunSqlProcedure('grid_1',p);
	console.log(rs.rows);
	$('#myGrid1').datagrid('loadData',rs);
	$('#myGrid1').datagrid('selectRow',0);
}
function fnedit(index){
	addoredit='edit';
	$('#myWin1').window('open');
	var row=$('#myGrid1').datagrid('getSelected');
	$.each(row,function(key,value){
		mySetValue(key,value);
	});
	$('#categoryid').combogrid('setValue',row.categoryid);
	$('#categoryname').combogrid('setValue',row.categoryname);
	$('#bookid').textbox('textbox').focus();
}

function fnadd(){
	addoredit='add';
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
	$('#myGrid2').datagrid('loadData',[]);
	$('#mylabel7').html('0');
	$('#mylabel8').html('0');
	$('#mylabel9').html('0');
	fnFocus("bookid");
	var row1={};
	$.each(row1,function(key,value){
		mySetValue(key,'');
	});
	var row=$('#myGrid1').datagrid('getSelected');
	var index=$('#myGrid1').datagrid('getRowIndex',row);
	$('#myGrid1').datagrid('insertRow',{
		index:index+1,
		row:row1
	});
	$('#myGrid1').datagrid('scrollTo',index+1);
	$('#myGrid1').datagrid('selectRow',index+1);
	$('#myWin1').window('open');
}

function fndelete(id){
	var rows=$('#myGrid1').datagrid('getRows');
	var row=$('#myGrid1').datagrid('getSelected');
	var index=$('#myGrid1').datagrid('getRowIndex',row);
	var p={};
	p.database='mybookstore';
	p.tablename='mybookstore.books';
	p.keyfield='bookid';
	p.sortfield='';
	p.data=[];
	var row1={};
	row1.bookid=row.bookid;
	row1._action='delete';
	p.data.push(row1);
	rs=myRunSqlProcedure('sys_runEditRows', p); 
	$('#myGrid1').datagrid('deleteRow',index);
	if(index<rows.length){
		$('#myGrid1').datagrid('selectRow',index);
	}
	else {
		$('#myGrid1').datagrid('selectRow',index-1);
	}
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
function fnFocus(id){
	$("#"+id).next("span").find("input").focus();	
}

 
</script>	
</body>
</html>