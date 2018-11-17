<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>广东宜居集团特色小镇管理平台 首页</title>
		<link href="favicon.ico" rel="icon" type="image/x-icon" />
		<script type="text/javascript" src="js/easyui/jquery.min.js"></script>
		<script type="text/javascript" src="js/easyui/jquery.easyui.min.js"></script>
		<script type="text/javascript" src="js/easyui/locale/easyui-lang-zh_CN.js"></script>
		<link rel="stylesheet" type="text/css" href="js/easyui/themes/icon.css">
		<link id="easyuiTheme" rel="stylesheet" type="text/css" href="js/easyui/themes/default/easyui.css">
		
		<!-- 导入ztree的文件 -->
		<script type="text/javascript" src="js/ztree/js/jquery.ztree.all.min.js"></script>
		<link rel="stylesheet" type="text/css" href="js/ztree/css/metroStyle/metroStyle.css">		
		
		<script type="text/javascript">
			$(function() {
				
				//加载ztree的树
				//1.定义setting变量
				var setting = {
						data: {
							//启用简单数据格式
							simpleData: {
								enable: true
							}
						}
				};
				
				//2.准备json数据（简单数据格式）
				//2.1 读取data/menu.json文件的数据，作为树节点数据
				$.post("data/menu.json",function(data){
					//2.2 使用init方法加载树
					$.fn.zTree.init($("#sysMenu"), setting, data);
				},"json");
				
				
				// 页面加载后 右下角 弹出窗口
				window.setTimeout(function(){
					$.messager.show({
						title:"消息提示",
						msg:'欢迎登录，超级管理员！ <a href="javascript:void" onclick="top.showAbout();">联系管理员</a>',
						timeout:5000
					});
				},3000);
				
				$("#btnCancel").click(function(){
					$('#editPwdWindow').window('close');
				});
				
				$("#btnEp").click(function(){
					alert("修改密码");
				});
				
				// 设置全局变量 保存当前正在右键的tabs 标题 
				var currentRightTitle  ;
			});
			
			//单击树的函数
			/*
			  event：事件对象
			  treeId： ul元素的id
			  treeNode： 节点对象
			*/
			function clickTree(event,treeId,treeNode){
				//获取点击了哪个节点
				//alert(treeId);
				alert(treeNode.id+"==="+treeNode.name);
			}
			
			/*******顶部特效 *******/
			/**
			 * 更换EasyUI主题的方法
			 * @param themeName
			 * 主题名称
			 */
			changeTheme = function(themeName) {
				var $easyuiTheme = $('#easyuiTheme');
				var url = $easyuiTheme.attr('href');
				var href = url.substring(0, url.indexOf('themes')) + 'themes/'
						+ themeName + '/easyui.css';
				$easyuiTheme.attr('href', href);
				var $iframe = $('iframe');
				if ($iframe.length > 0) {
					for ( var i = 0; i < $iframe.length; i++) {
						var ifr = $iframe[i];
						$(ifr).contents().find('#easyuiTheme').attr('href', href);
					}
				}
			};
			// 退出登录
			function logoutFun() {
				$.messager
				.confirm('系统提示','您确定要退出本次登录吗?',function(isConfirm) {
					if (isConfirm) {
						location.href = './login.jsp';
					}
				});
			}
			// 修改密码
			function editPassword() {
				$('#editPwdWindow').window('open');
			}
			// 版权信息
			function showAbout(){
				$.messager.alert("广东宜居集团特色小镇管理平台v1.0","设计: 黄文广<br/> 管理员邮箱: hwgguang@163.com <br/>");
			}
		</script>
	</head>

	<body class="easyui-layout">
		<div data-options="region:'north',border:false" style="height:70px;padding:10px;">
			<div>
				<img src="./images/logo.png" border="0">
			</div>
			<div id="sessionInfoDiv" style="position: absolute;right: 5px;top:10px;">
				[<strong>超级管理员</strong>]，欢迎你！您使用[<strong>192.168.1.100</strong>]IP登录！
			</div>
			<div style="position: absolute; right: 5px; bottom: 10px; ">
				<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_pfMenu',iconCls:'icon-ok'">更换皮肤</a>
				<a href="javascript:void(0);" class="easyui-menubutton" data-options="menu:'#layout_north_kzmbMenu',iconCls:'icon-help'">控制面板</a>
			</div>
			<div id="layout_north_pfMenu" style="width: 120px; display: none;">
				<div onclick="changeTheme('default');">default</div>
				<div onclick="changeTheme('gray');">gray</div>
				<div onclick="changeTheme('black');">black</div>
				<div onclick="changeTheme('bootstrap');">bootstrap</div>
				<div onclick="changeTheme('metro');">metro</div>
			</div>
			<div id="layout_north_kzmbMenu" style="width: 100px; display: none;">
				<div onclick="editPassword();">修改密码</div>
				<div onclick="showAbout();">联系管理员</div>
				<div class="menu-sep"></div>
				<div onclick="logoutFun();">退出系统</div>
			</div>
		</div>
		<div data-options="region:'west',split:true,title:'菜单导航'" style="width:200px">
			<!-- 加载菜单树 -->
			<ul id="sysMenu" class="ztree"></ul>
		</div>
		<div data-options="region:'center'">
			<div id="tabs" fit="true" class="easyui-tabs" border="false">
				<div title="消息中心" id="subWarp" style="width:100%;height:100%;overflow:hidden">
					消息中心
				</div>
			</div>
		</div>
		<div data-options="region:'south',border:false" style="height:50px;padding:10px;">
			<table style="width: 100%;">
				<tbody>
					<tr>
						<td style="width: 400px;">
							<div style="color: #999; font-size: 8pt;">
								广东宜居集团特色小镇管理平台 | 技术支持 <a href="http://special.zhaopin.com/2018/gz/11220/gdyj070257/">宜居集团技术部</a>
							</div>
						</td>
						<td style="width: *;" class="co1"><span id="online" style="background: url(./images/online.png) no-repeat left;padding-left:18px;margin-left:3px;font-size:8pt;color:#005590;">在线人数:1</span>
						</td>
					</tr>
				</tbody>
			</table>
		</div>

		<!--修改密码窗口-->
		<div id="editPwdWindow" class="easyui-window" title="修改密码" collapsible="false" minimizable="false" modal="true" closed="true" resizable="false" maximizable="false" icon="icon-save" style="width: 300px; height: 160px; padding: 5px;
        background: #fafafa">
			<div class="easyui-layout" fit="true">
				<div region="center" border="false" style="padding: 10px; background: #fff; border: 1px solid #ccc;">
					<table cellpadding=3>
						<tr>
							<td>新密码：</td>
							<td>
								<input id="txtNewPass" type="Password" class="txt01" />
							</td>
						</tr>
						<tr>
							<td>确认密码：</td>
							<td>
								<input id="txtRePass" type="Password" class="txt01" />
							</td>
						</tr>
					</table>
				</div>
				<div region="south" border="false" style="text-align: right; height: 30px; line-height: 30px;">
					<a id="btnEp" class="easyui-linkbutton" icon="icon-ok" href="javascript:void(0)">确定</a>
					<a id="btnCancel" class="easyui-linkbutton" icon="icon-cancel" href="javascript:void(0)">取消</a>
				</div>
			</div>
		</div>

		<div id="mm" class="easyui-menu" style="width:120px;">
			<div data-options="name:'Close'">关闭当前窗口</div>
			<div data-options="name:'CloseOthers'">关闭其它窗口</div>
			<div class="menu-sep"></div>
			<div data-options="iconCls:'icon-cancel',name:'CloseAll'">关闭全部窗口</div>
		</div>

	</body>

</html>