<%--
  Created by IntelliJ IDEA.
  User: 95143
  Date: 2020/12/5
  Time: 19:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <meta charset="utf-8" />
    <title>更新书籍</title>
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
<nav class="navbar navbar-inverse navbar-fixed-top">
    <div class="container-fluid">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="controller.jsp">首页</a>
        </div>

        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="BookServlet?dowhat=getall">轻小说列表<span class="sr-only"></span></a></li>
                <li><a href="BookServlet?dowhat=searchhot">热门轻小说</a></li>
                <li><a href="BookServlet?dowhat=searchdate">最近更新</a></li>
            </ul>
            <form class="navbar-form navbar-left" action="${pageContext.request.contextPath}/BookServlet?dowhat=search" method="post">
                <div class="form-group">
                    <select id="group" value="1" class="form-control" name="by">
                        <option value="1">搜书名</option>
                        <option value="2">搜作者</option>
                    </select>
                    <input type="text" class="form-control" placeholder="搜索你想看的小说吧" name="search">
                </div>
                <button type="submit" class="btn btn-default">搜索</button>
            </form>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>
<br><br>
<div class="container-fluid">
    <div class="top-banner">
        <img src="img/title.png">
    </div>
</div>
<div class="title-line">
    <span class="h3 tit">修改书籍信息</span>
</div>
<div class="container">
    <div class="text-center">
        <form action="${pageContext.request.contextPath}/BookServlet?dowhat=update" method="post" onsubmit="return check()" name="form">
            <span class="h3">书名</span>&nbsp;&nbsp;&nbsp;&nbsp;
            <input value="${sessionScope.all.name}" type="text" id="name" placeholder="输入书的名字" class="box" id="password" name="name" readonly="true"/>
            <br />
            <br />
            <br />
            <span class="h3">封面</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input value="${sessionScope.all.cover}" type="text" id="cover" placeholder="输入封面地址" class="box" name="cover">
            <br>
            <br />
            <br />
            <span class="h3">作者</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input value="${sessionScope.all.author}" type="text" id="author" placeholder="输入作者" class="box" name="author">
            <br>
            <br />
            <br />
            <span class="h3">热度</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input value="${sessionScope.all.heat}" type="text" id="heat" placeholder="输入热度" class="box" name="heat">
            <br>
            <br />
            <br />
            <span class="h3">更新日期</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input value="${sessionScope.all.date}" type="date" id="date" class="box" name="date">
            <br>
            <br />
            <br />
            <span class="h3">这本轻小说真厉害</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <input value="${sessionScope.all.price}" type="text" id="price" placeholder="输入年份" class="box" name="price">
            <br>
            <br />
            <br />
            <input type="submit" value="修改" class="zhu"/>
            <br />
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
		var name = document.getElementById("name");
		if(name.value == ""){
			alert("书名不能为空！");
		    return false;
		}
		var password=document.getElementById("password");
		if(password.value==""){
			alert("作者不能为空！");
			return false;
		}
		var date = document.getElementById("date");
		if(date.value == ""){
			alert("日期不能为空！");
		    return false;
		}
		return true;
		}
	</script>
</html>
