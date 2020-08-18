<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="include/header_1.jsp" %>
<%--<%@include file="include/top.jsp" %>--%>
<%@include file="include/search.jsp" %>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>个人信息</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/myorder.css" />
</head>
<body>
<!------------------------------head------------------------------>
 <!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix">
        <a href="/home" class="fl">首页</a>
        <span>/</span>
        <a href="/myorder" class="on">我的订单</a>
        <span>/</span>
        <a href="#" class="on">订单详情</a>
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
            <div class="my clearfix">
                <h2  style="font-family: 华文楷体;color: red">订单详情</h2>
                <h3  style="font-family: 华文楷体">订单号：<span>${order.order_code}</span></h3>
            </div>
            <div class="orderList" style="font-family: 华文楷体">
                <div class="orderList1">
                    <c:if test="${order.status=='waitPay' }">
                        <h3>待支付</h3>
                    </c:if>
                    <c:if test="${order.status=='waitDelivery' }">
                    <h3>待发货</h3>
                    </c:if>
                    <c:if test="${order.status=='waitArive' }">
                        <h3>待接收</h3>
                    </c:if>
                    <c:if test="${order.status=='waitComment' }">
                            <h3>待评价</h3>
                    </c:if>
                    <c:if test="${order.status=='finish' }">
                                <h3>已完成</h3>
                    </c:if>
                    <div class="clearfix">
                        <a href="${book.image}" class="fl">
                            <img src="${book.image}" style="width: 160px;height: 200px" referrerpolicy="no-referrer">
                        </a>
                        <p class="fl">
                            <a href="#">书名：${book.bookname}</a>
                            <a href="#">价格：¥${book.price}×1</a>
                            <br>
                            <a>作者：${book.author}</a>
                            <br>
                            <a>ISBN：${book.isbn}</a>
                            <br>
                            <a>出版社：${book.publicsource}</a>
                            <br>
                            <a>出版日期：${book.date}</a>
                        </p>
                        <p class="fl"><a href="#">${book.bookinfo}</a></p>

                    </div>
                </div>
                <div class="orderList1">
                    <h3>收货信息</h3>
                    <p>姓 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名：<span>${user.name}</span></p>
                    <p>联系电话：<span>${user.phone}</span></p>
                    <p>收货地址：<span>${order.address}</span></p>
                </div>
                <div class="orderList1">
                    <h3>支付方式及送货时间</h3>
                    <p>支付方式：<span>在线支付</span></p>
                    <p>送货时间：<span>不限送货时间</span></p>
                </div>
                <div class="orderList1 hei">
                    <h3><strong>商品单价：</strong><span>${book.price}</span></h3>
                    <p><strong>运费：</strong><span>¥0</span></p>
                    <p><strong>订单金额：</strong><span>${order.total}</span></p>
                    <p><strong>实付金额：</strong><span>${order.total}</span></p>
                </div>

            </div>


        </div>
    </div>
</div>
<

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
<!--footer-->
<div class="footer">
    <div class="top">
        <div class="wrapper">
            <div class="clearfix">
                <a href="#2" class="fl"><img src="img/foot1.png"/></a>
                <span class="fl">7天无理由退货</span>
            </div>
            <div class="clearfix">
                <a href="#2" class="fl"><img src="img/foot2.png"/></a>
                <span class="fl">15天免费换货</span>
            </div>
            <div class="clearfix">
                <a href="#2" class="fl"><img src="img/foot3.png"/></a>
                <span class="fl">满599包邮</span>
            </div>
            <div class="clearfix">
                <a href="#2" class="fl"><img src="img/foot4.png"/></a>
                <span class="fl">手机特色服务</span>
            </div>
        </div>
    </div>
    <p class="dibu">WELCOME TO<br />BOOKSTORE</p>
</div>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>
</body>
</html>
