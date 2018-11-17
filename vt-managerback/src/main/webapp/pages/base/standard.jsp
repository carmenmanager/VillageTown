<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>收派标准</title>
<!-- 导入easyui的文件  ：5个-->
<script type="text/javascript" src="../../js/easyui/jquery.min.js"></script>
<script type="text/javascript" src="../../js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="../../js/easyui/locale/easyui-lang-zh_CN.js"></script>
<link rel="stylesheet" type="text/css" href="../../js/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="../../js/easyui/themes/default/easyui.css">

<script type="text/javascript" src="../../js/form.js"></script>
<script type="text/javascript" src="../../js/crud.js"></script>
</head>
<body>
   <!-- 搜索表单 -->
   <form id="searchForm">
   	    收派标准名称:<input type="text" name="name"/>
   	    最小重量:<input type="text" name="minWeight"/>
   	    最小长度:<input type="text" name="minLength"/>
   	    <a id="searchBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">搜索</a>  
   </form>
   
   <!-- 设计一个div，用于放工具条按钮 -->
   <div id="toolbar">
      <a id="addBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-add'">添加</a> 
      <a id="editBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">编辑</a> 
      <a id="deleteBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-remove'">删除</a> 
   </div>
   
   <!-- 列表 -->
   <table id="list"></table>
   
   <!-- 编辑窗口 -->
   <!-- 
   	modal:true:  遮罩效果
   	closed:true: 关闭窗口
    -->
   <div id="editWin" class="easyui-window" title="收派标准编辑窗口" style="width:400px;height:300px"   
        data-options="iconCls:'icon-save',modal:true,closed:true">   
    	
    	<form id="editForm" method="post">
    		 <%-- id隐藏域 --%>
    		 <input type="hidden" name="id">	
    		  <table style="width: 300px;">
    		     <tr>
    		       <td>收派标准名称：</td>
    		       <td><input type="text" name="name" class="easyui-validatebox" data-options="required:true,missingMessage:'请输入名称',validType:['length[4,12]'],invalidMessage:'名称必须在4-12个字符之间'"/></td>
    		     </tr>
    		     <tr>
    		       <td>最小重量：</td>
    		       <td><input type="text" name="minWeight" class="easyui-numberbox" data-options="required:true,missingMessage:'请输入数字'"/></td>
    		     </tr>
    		     <tr>
    		       <td>最大重量：</td>
    		       <td><input type="text" name="maxWeight" class="easyui-numberbox"/></td>
    		     </tr>
    		     <tr>
    		       <td>最小长度：</td>
    		       <td><input type="text" name="minLength" class="easyui-numberbox"/></td>
    		     </tr>
    		     <tr>
    		       <td>最大长度：</td>
    		       <td><input type="text" name="maxLength" class="easyui-numberbox"/></td>
    		     </tr>
    		     <tr>
    		       <td colspan="2">
    		       	<a id="saveBtn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-save'">保存</a> 
    		       </td>
    		     </tr>
    		  </table>
    	</form>
    	   
	</div>  
   
   
   <script type="text/javascript">
   		//定义每个模块的名称空间
   		var action = "standard";
   		
   		//定义每个模块的列（shift+alt+A）
   		var columns = [[
   	        {
   	        	field:"id",
   	        	title:"编号",
   	        	width:100
   	         } ,
	   	     {
	   	        	field:"name",
	   	        	title:"收派标准名称",
	   	        	width:200
	   	      } ,
	   	   	  {
	   	        	field:"minWeight",
	   	        	title:"最小重量",
	   	        	width:200
	   	      } ,
	   	     {
	   	        	field:"maxWeight",
	   	        	title:"最大重量",
	   	        	width:200
	   	      } ,
				  {
				        	field:"minLength",
				        	title:"最小长度",
				        	width:200
				      } ,
				   	{
	   	        	field:"maxLength",
	   	        	title:"最大长度",
	   	        	width:200
	   	       } 
   	]];
   </script>

</body>
</html>