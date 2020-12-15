<%--
  Created by IntelliJ IDEA.
  User: 95143
  Date: 2020/12/6
  Time: 18:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>轻小说列表</title>
    <link href="css/bootstrap.css" rel="stylesheet">
    <script src="js/jquery-3.5.1.js"></script>
    <script src="js/bootstrap.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
        .grid{
            border-collapse: collapse;
            border: 1px solid #a4cded;
            padding: 3px;
            margin: auto;
        }
        .left{
            float: left;
            width: 185px;
            margin-right: 6px;
        }
        .block{
            border: 1px solid #a4cded;
            margin-bottom: 5px;
        }
        .blocktitle{
            border: 0px;
            background-image: url(img/title_bg.gif);
            background-repeat: repeat-x;
            height: 27px;
        }
        .txt{
            background-image: url(img/title_l.gif);
            background-repeat: no-repeat;
            color: #0049A0;
            float: left;
            font-size: 13px;
            font-weight: bold;
            line-height: 20px;
            padding-bottom: 0px;
            padding-left: 16px;
            padding-right: 8px;
            padding-top: 7px;
        }
        .blockcontent {
            border: 0px;
            background: #ffffff;
            padding: 3px;
        }
        ul{
            list-style: none;
        }
        .ultops li {
            margin: 3px 4px;
            border-bottom: 1px dashed #d8e4ef;
            color: #1b74bc;
            white-space: nowrap;
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
<br>
<br>
<br>
<br>
<div class="container">
    <div class="row">
        <div class="col-md-3" style="margin-top: 50px;">
        <div class="block">
            <div class="blocktitle">
                <span class="txt">用户登录</span>
            </div>
            <div class="blockcontent">
                <div style="padding-left: 10px">
                    <ul class="ulrow">
                        <li>
                           欢迎回来，<strong> ${sessionScope.now.id}</strong>
                        </li>
                    </ul>
                    <ul style="width: 100%;overflow: hidden;padding: 0px;margin: 0px;">
                        <li style="width: 49%;float: left">
                            <a href="${pageContext.request.contextPath}/UserServlet?dowhat=logout">注销</a>
                        </li>
                    </ul>

            </div>
            </div>
            </div>
            <div class="block">
                <div class="blocktitle">
                    <span class="txt">轻小说大赏</span>
                </div>
                <div class="blockcontent">
                    <div style="padding-left: 10px">
                        <ul class="ultops">
                            <li>
                                这本轻小说真厉害 TOP10
                            </li>
                            <li>
                                <a href="${pageContext.request.contextPath}/BookServlet?dowhat=searchprice&year=2020">2020</a>
                                <a href="${pageContext.request.contextPath}/BookServlet?dowhat=searchprice&year=2019">2019</a>
                                <a href="${pageContext.request.contextPath}/BookServlet?dowhat=searchprice&year=2018">2018</a>
                                <a href="${pageContext.request.contextPath}/BookServlet?dowhat=searchprice&year=2017">2017</a>
                            </li>
                        </ul>

                    </div>
                </div>
            </div>
        </div>
    <div class="col-md-9">
    <div class="centerm">
        <table width="100%" align="center" class="grid">
            <caption>轻小说列表
            <c:if test="${sessionScope.now.power==1}">
            <a href="add.jsp">添加</a></caption>
            </c:if>
            ${sessionScope.tipre}
            <tbody>
            <tr>
                <td>
            <c:forEach items="${all}" var="hon">
                <div style="width: 373px;float: left;margin: 5px 0px 5px 5px">
                    <div style="width: 95px;float: left;">
                    <img src="${hon.cover}" border="0" width="90" height="127">
                    </div>
                    <div style="margin-top: 5px">
                        <b style="font-size: 13px">
                            ${hon.name}
                        </b>
                        <p style="margin-bottom: 5px;margin-top: -3px;">作者：${hon.author}</p>
                        <p style="margin-bottom: 5px;margin-top: -5px;">最后更新：${hon.date}</p>
                        <p style="margin-bottom: 0px;margin-top: -0px;">推荐指数：${hon.recommand}</p>
                        <c:if test="${sessionScope.now.power==1}">
                        <a href="${pageContext.request.contextPath}/BookServlet?dowhat=update&name=${hon.name}">修改</a>
                        <a href="${pageContext.request.contextPath}/BookServlet?dowhat=del&name=${hon.name}">删除</a>
                        </c:if>
                        <a href="${pageContext.request.contextPath}/BookServlet?dowhat=recommand&name=${hon.name}">推荐一下</a>
                    </div>
                </div>
            </c:forEach>
                </td>
            </tr>
            </tbody>
        </table>
    </div>
    </div>
    </div>
</div>
</body>
</html>
