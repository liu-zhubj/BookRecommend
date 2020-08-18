<%@ page import="java.util.Date" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>

<%@include file="include/header_1.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/search.jsp" %>
<head lang="en">
    <meta charset="utf-8" />
    <title>干花花艺</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>

    <script src="js/echarts.min.js"></script>
</head>
<style>
    div.payedDiv{
        border: 1px solid #D4D4D4;
        max-width: 1013px;
        margin: 10px auto 20px auto;
    }
    div.payedTextDiv{
        height: 61px;
        background-color: #ECFFDC;
        padding: 17px 0px 0px 25px;
    }
    div.payedTextDiv span{
        font-weight: bold;
        font-size: 14px;
        margin-left: 10px;
    }
    div.payedAddressInfo{
        padding: 26px 35px;
    }
    div.payedAddressInfo li{
        background-image:url(/img/fore/li_dot.png);
        background-repeat: no-repeat;
        background-color: transparent;
        background-attachment: scroll;
        background-position: 0px 13px;
        list-style-type: none;
        color: #333333;
        padding-left: 15px;
        padding-top: 5px;
    }
    span.payedInfoPrice{
        color: #B10000;
        font-weight: bold;
        font-size: 14px;
        font-family: arial;
    }
    div.paedCheckLinkDiv{
        margin-left: 38px;
    }
    a.payedCheckLink{
        color: #2D8CBA;
    }
    a.payedCheckLink:hover{
        color: #2D8CBA;
        text-decoration: underline;
    }
    div.payedSeperateLine{
        border-top: 1px dotted #D4D4D4;
        margin: 0px 31px;
    }
    div.warningDiv{
        margin: 23px 45px;
        color:black;
    }
</style>
<body>
<div class="payedDiv">
    <div class="payedTextDiv">
        <img src="img/fore/paySuccess.png">
        <span>您已成功付款${historyList.size()}</span>

    </div>
    <div class="payedAddressInfo">
        <ul>
            <li>收货地址：${o.address} ${o.receiver} ${o.mobile }</li>
            <li>实付款：<span class="payedInfoPrice">
            ￥${param.total}
            </li>
            <li>预计<%=new Date()%>送达    </li>
        </ul>

        <%--<div class="paedCheckLinkDiv">
            您可以
            <a class="payedCheckLink" href="bought">查看已买到的宝贝</a>
            <a class="payedCheckLink" href="bought">查看我的订单</a>
        </div>--%>

    </div>

    <div class="payedSeperateLine">
    </div>

    <div class="warningDiv">
        <img src="img/fore/warning.png">
        <b>安全提醒：</b>下单后，<span class="redColor boldWord">用QQ给您发送链接办理退款的都是骗子！</span>不存在系统升级，订单异常等问题，谨防假冒客服电话诈骗！
    </div>

</div>
<!----------------proList------------------------->
<c:if test="${historyList.size()!=0}">
<h2 style="margin-left: 10px;margin-bottom: 10px">根据历史浏览记录推荐</h2>
<div style="border: 1px solid gainsboro">
</div>
</c:if>
<ul class="proList wrapper clearfix">
    <c:forEach items="${historyList}" var="booknew">
    <li>
        <a href="/showProduct?product_id=${booknew.id}">
        <%--<a href="${booknew.image}">--%>
            <dl>
                <dt><img src="${booknew.image}" referrerpolicy="no-referrer"></dt>
                <dd>${booknew.bookname}</dd>
                <dd>￥${booknew.price}</dd>
            </dl>
        </a>
    </li>
    </c:forEach>
</ul>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>

</body>
