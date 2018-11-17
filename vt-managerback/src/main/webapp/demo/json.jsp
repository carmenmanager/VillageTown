<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>json对象操作</title>
</head>
<body>

<script type="text/javascript">
	 //定义json对象
	 var json = {name:10};
	 
	 //读取name属性
	 //alert(json.name);
	 alert(json["name"]);
	 
	 //给json对象添加age属性，值18
	 //json.age = 18;
	 json["age"] = 18;
	 
	 //读取age属性
	 //alert(json.age);
	 alert(json["age"]);
</script>

</body>
</html>