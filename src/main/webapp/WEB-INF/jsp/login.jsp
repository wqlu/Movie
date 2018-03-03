<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>管理员登录</title>
</head>
<body style="background-color: #F3F3F3">
<form id="indexform" name="indexForm" action="/index" method="post">
	<table border="0">
		<tr>
			<td>账号：</td>
			<td><input type="text" name="adminname"></td>
		</tr>
		<tr>
			<td>密码：</td>
			<td><input type="password" name="adminpassword">
			</td>
		</tr>
	</table>
	<br>
	<input id="login" type="submit" value="登录" style="color:#BC8F8F">
</form>


<script type="text/javascript">
    $("#login").click(function(){
        var adminname = $("[name=adminname]").val();
        var adminpassword = $("[name=adminpassword]").val();

        if(adminname!="admin" || adminpassword!="admin"){
            $.messager.alert('错误',"用户名密码不正确！");
            return ;
        }
        window.location.href="/index";
    });
</script>
</body>
</html>