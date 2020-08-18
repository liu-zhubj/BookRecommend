<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/1
  Time: 14:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="include/header_1.jsp"/>
<jsp:include page="include/top.jsp"/>
<jsp:include page="include/search.jsp"/>
<html>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>最家</title>
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
        <a href="/mine">个人中心</a>
        <span>/</span>
        <a href="/myorder" class="on">我的订单</a>
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
                <h2 class="fl">我的订单</h2>
                <a href="#" class="fl">请谨防钓鱼链接或诈骗电话，了解更多&gt;</a>
            </div>


            <div class="dlist clearfix">
                <ul class="fl clearfix" id="wa">
                    <li <%--class="on"--%>><a href="#2" orderStatus="all">全部有效订单</a></li>

                    <li id="del"><span > <a hidden orderStatus="waitDelivery" href="#2l">待发货</a></span></li>
                    <li> <span><a hidden  orderStatus="waitPay" href="#2l">待支付</a></span></li>
                    <li> <span><a hidden  orderStatus="waitConfirm" href="#2" class="fin">待接收</a></span></li>
                    <li> <span><a hidden  orderStatus="waitReview" href="#2" class="fin">待评价</a></span></li>
                </ul>
               <%-- <form action="#" method="get" class="fr clearfix">
                    <input type="text" name="" id="" value="" placeholder="请输入商品名称、订单号" />
                    <input type="button" name="" id="" value="" />
                </form>--%>
            </div>
            <c:forEach items="${orders}" var="order">
                <table class="orderListItemTable"   oid="${order.id}">
                    <div class="dkuang"  >
                        <c:if test="${order.status=='waitPay' }">
                            <p class="one" style="color: #A10000;width:500px;float: left " orderStatus="${order.status}">待支付</p>
                            <p class="one" style="width:100px;float: right " orderStatus="${order.status}"><a href="/delete_orer?order_id=${order.id}" style="color: cornflowerblue">删除</a> </p>
                        </c:if>
                        <c:if test="${order.status=='waitDelivery' }">
                            <p class="one" style="color: #A10000;width:500px;float: left " orderStatus="${order.status}">待发货</p>
                            <p class="one" style="width:100px;float: right " orderStatus="${order.status}"><a href="/delete_orer?order_id=${order.id}" style="color: cornflowerblue">删除</a> </p>
                        </c:if>
                        <c:if test="${order.status=='waitConfirm' }">
                            <p class="one" orderStatus="${order.status}" style="color: #A10000;width:500px;float: left ">待接收</p>
                            <p class="one" style="width:100px;float: right " orderStatus="${order.status}"><a href="/delete_orer?order_id=${order.id}" style="color: cornflowerblue">删除</a> </p>
                        </c:if>
                        <c:if test="${order.status=='waitReview' }">

                                <p class="one" orderStatus="${order.status}" style="color: #A10000;width:500px;float: left ">待评价</p>
                            <p class="one" style="width:100px;float: right " orderStatus="${order.status}"><a href="/delete_orer?order_id=${order.id}" style="color: cornflowerblue">删除</a> </p>



                        </c:if>
                        <c:if test="${order.status=='finish' }">
                            <p class="one" orderStatus="${order.status}" style="color: #A10000">已完成</p>
                            <p class="one" style="width:100px;float: right " orderStatus="${order.status}"><a href="/delete_orer?order_id=${order.id}" style="color: cornflowerblue">删除</a> </p>

                        </c:if>
                        <div class="word clearfix">
                            <ul class="fl clearfix">
                                <li>${order.create_date}</li>
                                <li>${order.user_id}</li>
                                <li>订单号:${order.order_code}</li>
                                <li>在线支付</li>
                            </ul>
                            <p class="fr">订单金额：<span>${order.total}</span>元</p>
                        </div>
                        <c:forEach items="${order.orderItems}" var="o"  >
                            <div class="shohou clearfix">
                                <a href="#" class="fl"><img src="${o.bookNew.image}" referrerpolicy="no-referrer"/></a>
                                <p class="fl"><a href="/showProduct?product_id=${o.bookNew.id}">${o.bookNew.bookname}</a><a href="#">¥${o.bookNew.price}×${order.totalNumber}</a></p>
                                <p class="fr">

                                    <c:if test="${order.status=='waitPay' }">

                                        <a href="alipay?order_id=${order.id}&total=${order.total}" style="background-color: #A10000;color: white">待付款</a>
                                    </c:if>
                                    <c:if test="${order.status=='waitDelivery' }">
                                        <a  style="background-color: #A10000;color: white">待发货</a>
                                    </c:if>
                                    <c:if test="${order.status=='waitConfirm' }">
                                        <a href="confirmPay?order_id=${order.id}"style="background-color: #A10000;color: white">待接收</a>
                                    </c:if>
                                    <c:if test="${order.status=='waitReview' }">
                                       <%-- <c:forEach items="${o.}" var="i">--%>

                                        <a href="review?book_id=${o.bookNew.id}&order_id=${order.id}" style="background-color: #A10000;color: white">待评价</a>
                                    <%--    </c:forEach>--%>
                                    </c:if>
                                    <c:if test="${order.status=='finish' }">
                                        <a style="background-color: #A10000;color: white">完成</a>
                                    </c:if>
                                    <a href="/order_info?order_id=${order.id}&book_id=${o.bookNew.id}">订单详情</a>
                                </p>
                            </div>
                        </c:forEach>
                    </div>
                </table>
            </c:forEach>
            <div class="fenye clearfix">
                <a href="#"><img src="img/zuo.jpg"/></a>
                <a href="#">1</a>
                <a href="#"><img src="img/you.jpg"/></a>
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
