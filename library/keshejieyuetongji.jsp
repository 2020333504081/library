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
	<script type="text/javascript" src="plugin/echarts521/echarts.min.js"></script>
</head>
<body class="easyui-layout" data-options="fit:true">
	<div id="toolbar1" class="easyui-panel" data-options="region:'north',split:false,height:31" style="background-color:#E0ECFF;"></div>
	<div id="picpanel" class="easyui-panel" data-options="region:'south',split:true,height:295">
	</div>
	<div id="gridpanel" class="easyui-panel" data-options="region:'center',border:false,doSize:true">
		<div class="easyui-layout" data-options="fit:true">
			<div class="easyui-panel" data-options="region:'west',split:false,width:860"><div id="myGrid1" class="easyui-datagrid"></div></div>
			<div id="bilvpanel" class="easyui-panel" data-options="region:'center',border:false,doSize:true"></div>
		</div>
		
	</div>
</body>
<script>
user=myGetCookie("user");
rowheight=40;
$(function(){	
	myButtonGroup('tbar1', 'toolbar1', '关闭/cmdclose/icon-cancel;', 2, 0, 0, 66, -2);
	myTabs('myTab','picpanel','下钻柱状图;嵌套环形图;漏斗图',0,0,0,0,'');
	myNumberField('sumbook','bilvpanel','馆藏总数',210,0*rowheight+10,5,30,200);
	myNumberField('sumreader','bilvpanel','读者总数',210,1*rowheight+10,5,30,200);
	myNumberField('sumborrow','bilvpanel','借阅总册数',210,2*rowheight+10,5,30,200);
	myNumberField('sumbreader','bilvpanel','借阅总人数',210,3*rowheight+10,5,30,200);
	myNumberField('avgborrow','bilvpanel','借阅率(借阅总册数/借阅总人数)',210,4*rowheight+10,5,30,200);
	myNumberField('avgreader','bilvpanel','到馆率(借阅总人数/读者总数)',210,5*rowheight+10,5,30,200);
	myNumberField('avgbook','bilvpanel','流通率(借阅总册数/馆藏总数)',210,6*rowheight+10,5,30,200);
	var p={};
	var rs=myRunSqlProcedure('test13',p).rows;
	$('#sumbook').textbox('setValue',rs[0].n1);
	$('#sumreader').textbox('setValue',rs[0].n2);
	$('#sumborrow').textbox('setValue',rs[0].n3);
	$('#sumbreader').textbox('setValue',rs[0].n7);
	$('#avgborrow').textbox('setValue',rs[0].n4);
	$('#avgreader').textbox('setValue',rs[0].n5);
	$('#avgbook').textbox('setValue',rs[0].n6);
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

	fnLoadGridData();
	fnDrawChart1();
	fnDrawChart2();
	fnDrawFunnel();
});
function fnLoadGridData(){
	var p={};
	p.sign='全部';
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
function fnDrawChart1(){
	var p={};
	rows=myRunSqlProcedure('test14', p).rows;
	xdata=[];
	data=[];
	ydata=[];
	for(var i=0;i<rows.length;i++){
			data.push(rows[i].account);
			var d={};
			d.value=rows[i].n;
			d.groupId= rows[i].account;
			xdata.push(d);
	}
	console.log(xdata);
	for(var i=0;i<xdata.length;i++){
		var p={};
		p.account=xdata[i].groupId;
		rows1=myRunSqlProcedure('test15', p).rows;
		var y={};
		y.dataGroupId=xdata[i].groupId;
		y.data=[];
		
		for(var j=0;j<rows1.length;j++){
			var x=[];
			x.push(rows1[j].bookname);
			x.push(rows1[j].n);
			y.data.push(x);
		}
		ydata.push(y);
		
	}

var chartDom = document.getElementById('myTab1');
var myChart = echarts.init(chartDom);
var option;

option = {
  xAxis: {
    data: data
  },
  yAxis: {},
  dataGroupId: '',
  animationDurationUpdate: 500,
  series: {
    type: 'bar',
    id: 'sales',
    data: xdata,
    universalTransition: {
      enabled: true,
      divideShape: 'clone'
    }
  }
};
const drilldownData = ydata;
myChart.on('click', function (event) {
  if (event.data) {
    var subData = drilldownData.find(function (data) {
      return data.dataGroupId === event.data.groupId;
    });
    if (!subData) {
      return;
    }
    myChart.setOption({
      xAxis: {
        data: subData.data.map(function (item) {
          return item[0];
        })
      },
      series: {
        type: 'bar',
        id: 'sales',
        dataGroupId: subData.dataGroupId,
        data: subData.data.map(function (item) {
          return item[1];
        }),
        universalTransition: {
          enabled: true,
          divideShape: 'clone'
        }
      },
      graphic: [
        {
          type: 'text',
          left: 50,
          top: 20,
          style: {
            text: 'Back',
            fontSize: 18
          },
          onclick: function () {
            myChart.setOption(option);
          }
        }
      ]
    });
  }
});

option && myChart.setOption(option);

}
 
 
function fnDrawChart2(){
var p={};
var rs=myRunSqlProcedure('test14',p).rows;
var p={};
var rs1=myRunSqlProcedure('test16',p).rows;
var xdata=[];
var ydata=[];
var zdata=[];
for(var i=0;i<rs.length;i++){
	xdata.push(rs[i].account);
	var d={};
	d.value=rs[i].n;
	d.name=rs[i].account;
	ydata.push(d);
}
for(var i=0;i<rs1.length;i++){
	xdata.push(rs1[i].bookname);
	var d={};
	d.value=rs1[i].n;
	d.name=rs1[i].bookname;
	zdata.push(d);
}
var chartDom = document.getElementById('myTab2');
var myChart = echarts.init(chartDom);
var option;

option = {
  tooltip: {
    trigger: 'item',
    formatter: '{a} <br/>{b}: {c} ({d}%)'
  },
  legend: {
    data: xdata
  },
  series: [
    {
      name: 'Access From',
      type: 'pie',
      selectedMode: 'single',
      radius: [0, '30%'],
      label: {
        position: 'inner',
        fontSize: 14
      },
      labelLine: {
        show: false
      },
      data: ydata
    },
    {
      name: 'Access From',
      type: 'pie',
      radius: ['45%', '60%'],
      labelLine: {
        length: 30
      },
      label: {
        formatter: '{a|{a}}{abg|}\n{hr|}\n  {b|{b}：}{c}  {per|{d}%}  ',
        backgroundColor: '#F6F8FC',
        borderColor: '#8C8D8E',
        borderWidth: 1,
        borderRadius: 4,
        rich: {
          a: {
            color: '#6E7079',
            lineHeight: 22,
            align: 'center'
          },
          hr: {
            borderColor: '#8C8D8E',
            width: '100%',
            borderWidth: 1,
            height: 0
          },
          b: {
            color: '#4C5058',
            fontSize: 14,
            fontWeight: 'bold',
            lineHeight: 33
          },
          per: {
            color: '#fff',
            backgroundColor: '#4C5058',
            padding: [3, 4],
            borderRadius: 4
          }
        }
      },
      data: zdata
    }
  ]
};

option && myChart.setOption(option);
}

function fnDrawFunnel(){
	var p={};
	rows=myRunSqlProcedure('test16', p).rows;
	var xtitle=[];
	var xdata=[];
	for (var i=0; i<rows.length; i++){
		var obj={};
		obj.value=parseInt(rows[i].n);
		obj.name=rows[i].bookname;
		xtitle.push(rows[i].bookname);
		xdata.push(obj);
	}


	var chartDom1 = document.getElementById('myTab3');
	 var myChart1 = echarts.init(chartDom1);
	 var option1;

	 option1 = {
	   title: {
	     text: '借出的书的数量'
	   },
	   tooltip: {
	     trigger: 'item',
	     formatter: '{a} <br/>{b} : {c}%'
	   },
	   toolbox: {
	     feature: {
	       dataView: { readOnly: false },
	       restore: {},
	       saveAsImage: {}
	     }
	   },
	   legend: {
		   top:20,
	     data:xtitle
	   },
	   series: [
	     {
	       name: 'Funnel',
	       type: 'funnel',
	       left: '10%',
	       top: 60,
	       bottom: 60,
	       width: '80%',
	       min: 0,
	       max: 100,
	       minSize: '0%',
	       maxSize: '100%',
	       sort: 'descending',
	       gap: 2,
	       label: {
	         show: true,
	         position: 'inside'
	       },
	       labelLine: {
	         length: 10,
	         lineStyle: {
	           width: 1,
	           type: 'solid'
	         }
	       },
	       itemStyle: {
	         borderColor: '#fff',
	         borderWidth: 1
	       },
	       emphasis: {
	         label: {
	           fontSize: 20
	         }
	       },
	       data: xdata
	     }
	   ]
	 };

	 option1 && myChart1.setOption(option1);


}

</script>	
</body>
</html>