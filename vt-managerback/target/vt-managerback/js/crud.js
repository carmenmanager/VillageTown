$(function(){
   			//列表展示
   			$("#list").datagrid({
   				//抓取数据的url地址
   				url:"../../"+action+"/listByPage.action",
   				//columns: 展示列
   				  // field： 需要显示的后端字段
   				columns:columns,
   				//分页显示
   				pagination:true,
   				//绑定工具条：
   				toolbar:"#toolbar"
   			});
   			
   			//条件搜索
   			$("#searchBtn").click(function(){
   				//调用datagrid的load方法
   				/*
   				$("#list").datagrid("load",{
   					name:"eric"
   				});
   				*/
   				
   				/*
   				$("#list").datagrid("load",{
   					name:$("input[name=name]").val(),
   					minWeight:$("input[name=minWeight]").val(),
   					minLength:$("input[name=minLength]").val()
   				});
   				*/
   				
   				//一次性获取searchForm的所有输入参数
   				//把表单的所有参数序列为字符串：name=10&minWeight=100&minLength=200
   				//serialize(): 如果遇到中文，把中文进行url编码
   				//alert($("#searchForm").serialize());
   				
   				//decodeURIComponent(): 把url编码字符串进行反编码
   				//alert(decodeURIComponent($("#searchForm").serialize()));
   				
   				//datagrid组件的load方法不支持普通参数格式：name=10&minWeight=100&minLength=200
   				//$("#list").datagrid("load",decodeURIComponent($("#searchForm").serialize()));
   				
   				//datagrid组件的load方法只支持json参数格式：{name:10,minWeight:100}
   				//把普通参数格式转换为json格式
   				$("#list").datagrid("reload",getFormData("searchForm"));
   			});
   			
   			//打开编辑窗口
   			$("#addBtn").click(function(){
   				//清空表单数据
   				$("#editForm").form("clear");
   				
   				$("#editWin").window("open");
   			});
   			
   			//提交表单数据到后台
   			$("#saveBtn").click(function(){
   				//提交表单数据
   				$("#editForm").form("submit",{
   					//url:数据提交的url地址
					url:"../../"+action+"/save.action",
					//onSubmit: 提交前回调函数  返回值： true: 提交表单     false：不提交表单
					onSubmit:function(){
						//表单验证通过返回true，否则返回false
						return $("#editForm").form("validate");
					},
					//success: 提交成功后的回调函数
					success:function(data){  //data: 服务端返回的数据，是字符串类型
					
						//把字符串类型转换为json对象: eval()：内置js函数    {name:10}
						data = eval("("+data+")");
						
						//判断是否成功，提示内容
						if(data.success){
							
							//关闭窗口
							$("#editWin").window("close");
							
							//刷新datagrid
							$("#list").datagrid("reload");
							
							$.messager.alert('提示','保存成功！','info');
						}else{
							$.messager.alert('提示','保存失败！'+data.msg,'error');
						}
					}
   				});
   				
   			});
   			
   			//回显表单数据
   			$("#editBtn").click(function(){
   				//判断用户只能选择一个数据
   				// getSelections方法: 获取用户选中的行，返回row对象数组 
   				var rows = $("#list").datagrid("getSelections");
   				if(rows.length!=1){
   					$.messager.alert('提示','修改只能选择一个数据','warning');
   					return;
   				}
   				
   				//回显表单数据*
   				//1.获取选中的row的id
   				var id = rows[0].id;
   				
   				//2.填充表单数据* ：form组件的load
   				/*
   				$("#editForm").form("load",{
   					name:"eric"
   				});
   				*/
   				
   				//清空表单数据
   				$("#editForm").form("clear");
   				
   				//url: 任何后台的url，该url必须返回json格式：{name:"eric"}
   				$("#editForm").form("load","../../"+action+"/findById.action?uuid="+id);
   				
   				//3.打开窗口
   				$("#editWin").window("open");
   			});
   			
   			//删除数据
   			$("#deleteBtn").click(function(){
   				//判断至少选择一个
   				var rows = $("#list").datagrid("getSelections");
   				if(rows.length==0){
   					$.messager.alert('提示','删除至少选择一个数据','warning');
   					return;
   				}
   				
   				//删除提示
   				$.messager.confirm('提示', '您要删除数据吗？', function(r){  // r:点了确定true，点了取消false
   					if (r){
   					   
   						//获取需要删除的id（n个）:  1,2,3
   						var rows = $("#list").datagrid("getSelections");
   						//设计一个数组用于存储元素
   						var idArray = new Array();
   						//遍历rows
   						$(rows).each(function(i){
   							//push():往数组添加元素
   							idArray.push(rows[i].id);
   						});
   						//拼接字符串
   						//join: 把数组的每个元素逐一取出，使用，拼接，最后成为新的字符串返回
   						var ids = idArray.join(",");
   					    
   						//把ids传递给后台
   						$.post("../../"+action+"/delete.action",{ids:ids},function(data){
   						//判断是否成功，提示内容
   							if(data.success){
   								
   								//刷新datagrid
   								$("#list").datagrid("reload");
   								
   								$.messager.alert('提示','删除成功！','info');
   							}else{
   								$.messager.alert('提示','删除失败！'+data.msg,'error');
   							}
   						},"json");
   						
   					}
   				});
   			});
   		});