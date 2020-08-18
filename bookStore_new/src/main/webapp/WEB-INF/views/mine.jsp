<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/1
  Time: 13:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="include/header_1.jsp"/>
<jsp:include page="include/top.jsp"/>
<jsp:include page="include/search.jsp"/>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygxin.css" />
</head>
<body>
<!------------------------------head------------------------------>
<div class="head ding" hidden>
    <div class="wrapper clearfix" hidden>

    </div>
</div>
<!------------------------------idea------------------------------>
<div class="address mt" id="add">
    <div class="wrapper clearfix">
        <a href="/home" class="fl">首页</a>
        <span>/</span>
        <a href="/mine" class="on">个人中心</a>
    </div>
</div>

<!------------------------------Bott------------------------------>
<div class="Bott">
    <div class="wrapper clearfix">
        <div class="zuo fl">
            <h3>
                <a href="#"><img src="img/tx.png"/></a>
                <p class="clearfix"><span class="fl">${user.name}</span><span class="/lofo"><a href="">[退出登录]</a></span></p>
            </h3>
            <div>
                <h4>我的交易</h4>
                <ul>
                    <li><a href="/cart">我的购物车</a></li>
                    <li><a href="/myorder">我的订单</a></li>
                    <%--<li><a href="myprod.html">评价晒单</a></li>--%>
                </ul>
                <h4>个人中心</h4>
                <ul>
                    <li  class="on"><a href="/mine">我的中心</a></li>
                    <li><a href="/adress">地址管理</a></li>
                </ul>
                <h4>账户管理</h4>
                <ul>
                    <li><a href="/mine_message">个人信息</a></li>
                    <li><a href="/update_p">修改密码</a></li>
                </ul>
            </div>
        </div>
        <div class="you fl">
            <div class="tx clearfix">
                <div class="fl clearfix">
                    <a href="#" class="fl"><img src="img/tx.png"/></a>
                    <p class="fl"><span>${user.name}</span><a href="/mine_message">修改个人信息></a></p>
                </div>
                <div class="fr">绑定邮箱：12****4@**.com</div>
            </div>
            <div class="bott">
                <div class="clearfix">
                    <a href="#" class="fl"><img src="img/gxin1.jpg"/></a>
                    <p class="fl"><span>待支付的订单：<strong>${pay}</strong></span>
                        <a href="/myorder">查看待支付订单></a>
                    </p>
                </div>
                <div class="clearfix">
                    <a href="#" class="fl"><img src="img/gxin2.jpg"/></a>
                    <p class="fl"><span>待收货的订单：<strong>${confirm}</strong></span>
                        <a href="/myorder">查看待收货订单></a>
                    </p>
                </div>
                <div class="clearfix">
                    <a href="#" class="fl"><img src="img/gxin3.jpg"/></a>
                    <p class="fl"><span>待评价的订单：<strong>${review}</strong></span>
                        <a href="/myorder">查看待评价订单></a>
                    </p>
                </div>
                <div class="clearfix">
                    <a href="#" class="fl"><img src="img/gxin4.jpg"/></a>
                    <p class="fl"><span>待发货的订单：<strong>${deliver}</strong></span>
                        <a href="/myorder">查看待发货订单></a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>



<!--返回顶部-->
<div class="gotop">
    <a href="/cart">
        <dl>
            <dt><img src="img/gt1.png"/></dt>
            <dd>去购<br />物车</dd>
        </dl>
    </a>
    <a href="#" class="dh">
        <dl>
            <dt><img src="img/gt2.png"/></dt>
            <dd>联系<br />客服</dd>
        </dl>
    </a>
    <a href="/mine">
        <dl>
            <dt><img src="img/gt3.png"/></dt>
            <dd>个人<br />中心</dd>
        </dl>
    </a>
    <a href="#" class="toptop" style="display: none">
        <dl>
            <dt><img src="img/gt4.png"/></dt>
            <dd>返回<br />顶部</dd>
        </dl>
    </a>
    <p>400-800-8200</p>
</div>
<div class="footer">

    <p class="dibu">WELCOME TO<br />BOOKSTORE</p>
</div>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>

