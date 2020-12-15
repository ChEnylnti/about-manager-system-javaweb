<%--
  Created by IntelliJ IDEA.
  User: 95143
  Date: 2020/12/5
  Time: 15:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>轻小说文库欢迎您</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .top-banner{
            background: #00a0d8;
            height: 86px;
            text-align: center;
            margin-bottom: 20px;
        }
        .title-line{
            width: 980px;
            height: 28px;
            margin: 0 auto;
            border-bottom: 1px solid #ddd;
            margin-bottom: 50px;
            text-align: center;
        }
        .tit{
            height: 56px;
            line-height: 56px;
            margin: 0 auto;
            padding: 0 20px;
            font-size: 40px;
            background: #fff;
            text-align: center;
        }
        .zhu{
            color: #555;
            display: inline-block;
            height: 36px;
            border: 1px solid #ccc;
            border-radius: 2px;
            width: 184px;
            line-height: 38px;
            font-size: 14px;
            text-align: center;
        }
        .box{
            box-sizing: border-box;
            width: 30%;
            border: 1px solid #ddd;
            border-radius: 2px;
            color: #aaa;
            font-size: 14px;
            padding: 10px;
            height: 40px;
            vertical-align: middle;
            border-radius: 4px;
        }
    </style>
</head>
<body>
<c:if test="${sessionScope.now!=null}">
    <jsp:forward page="controller.jsp"></jsp:forward>
</c:if>
<div class="container-fluid">
    <div class="top-banner">
        <img src="img/title.png">
    </div>
</div>
<div class="title-line">
    <span class="h3 tit">登录</span>
</div>
<div class="container">
    <div class="text-center">
        <form action="${pageContext.request.contextPath}/UserServlet?dowhat=login" method="post" onsubmit="return check()" name="form">
            <span class="h3">id</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="text" name="id" placeholder="输入你的用户名" class="box" id="id">
            <br />
            <span style="color: #f66495;">
                ${sessionScope.erroi}
            </span>
            <br />
            <span class="h3">密码</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input type="password" name="password" placeholder="请输入你的密码" class="box" id="password"/>
            <br />
            <span id="tip" style="color: #f66495;">
                ${sessionScope.errop}
            </span>
            <br>
            <input type="radio" name="autologin" value="${60*60*24*31}" />记住我
            <br />
            <input type="submit" value="登录" class="zhu" style="color: #00A0D8"/>
            <a href="logon.jsp" class="zhu">注册</a>
        </form>
    </div>
</div>
<div style="justify-content: space-between;display:flex;">
    <div class="bottom-left" style="display: inline;">
        <img src="img/left1.png" id="left">
    </div>
    <div class="bottom-right" style="display: inline;">
        <img src="img/right1.png" id="right">
    </div>
</div>

</body>
<script type="text/jscript">
        function check(){
		var id = document.getElementById("id");
		if(id.value == ""){
			alert("用户名不能为空！");
		    return false;
		}
		var password=document.getElementById("password");
		if(password.value==""){
			alert("密码不能为空！");
			return false;
		}
		return true;
		}
		window.onload=function(){
			var target=document.getElementById("password");
			target.onfocus=function(){
				document.getElementById("left").src="img/left2.png";
				document.getElementById("right").src="img/right2.png";

			}
			target.onblur=function(){
				document.getElementById("left").src="img/left1.png";
				document.getElementById("right").src="img/right1.png";
				if(target.value==""){
				document.getElementById("tip").innerHTML="喵，你还没输入密码么？";
				}else{
				document.getElementById("tip").innerHTML="";
				}
			}
		}
	</script>
</html>
