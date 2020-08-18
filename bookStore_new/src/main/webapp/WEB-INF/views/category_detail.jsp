<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/3
  Time: 11:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="utf-8" />
    <title>分类详情</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>

    <script src="js/echarts.min.js"></script>
    <jsp:include page="/WEB-INF/views/include/header_1.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/include/search.jsp"></jsp:include>

    <style>
        .header
        {
            width:100%;
            height:36px;
            line-height: 36px;
            text-align:center;

            position:relative;
        }
        .header div:before,.header div:after
        {
            position:absolute;
            background:#ccc;
            content:"";
            height:1px;
            top:50%;
            width:570px;
        }
        .header div:before{left:10px;}
        .header div:after{right:10px;}
    </style>





</head>
<body onLoad="goPage(1,10);">
<!------------------------------head------------------------------>

<!------------------------------banner------------------------------>

<!-----------------address------------------------------->
<div style="height:30px;margin-top: 10px;margin-left: 10px">
    <h2>图书分类统计</h2>
</div>
<div style="border: 2px solid grey"></div>
<div style=" width: 95%;height: 300px;margin-left: 10px;margin-top: 10px" >
    <div id="mm" style="width: 600px;height: 300px;float:left; margin-left: 100px"></div>
    <div style="width: 300px;height: 300px;float:left; ">
        <h2 style="margin-left: 90px;margin-top: 30px">${category.categoryClassname}</h2>
        <br>
        <p style="margin-left: 90px">共找到111条</p>
        <br>



    </div>

    <script>
        var myChart1 = echarts.init(document.getElementById('mm'));

        option = {
            color: ['#3398DC'],
            title: {
                text: '该类别各评分占比柱状图',
                left:'left'

            },
            tooltip: {
                trigger: 'axis',
                axisPointer: {            // 坐标轴指示器，坐标轴触发有效
                    type: 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
                }
            },
            grid: {
                left: '3%',
                right: '4%',
                bottom: '15%',
                containLabel: true
            },
            xAxis: [
                {
                    type: 'category',
                    data: ['5', '4', '3', '2', '1'],
                    axisTick: {
                        alignWithLabel: true
                    }
                }
            ],
            yAxis: [
                {
                    type: 'value'
                }
            ],
            series: [
                {
                    name: '直接访问',
                    type: 'bar',
                    barWidth: '50%',
                    data: [10, 52, 200, 334, 390]
                }
            ]
        };
        myChart1.setOption(option);

    </script>

</div>
<div style="border: 1px solid gainsboro"></div>
<!-------------------current---------------------->
<div class="current">
    <div class="wrapper clearfix">
        <h3 class="fl">${category.categoryClassname}</h3>
        <div class="fr choice">
            <p class="default">排序方式</p>
            <ul class="select">
                <li><a href="/category_detail?category_id=${category.id}&i=1&limit=0"> 价格从低到高</a></li>
                <li><a href="/category_detail?category_id=${category.id}&i=2&limit=0">评分从高到低</a></li>
                <li><a href="/category_detail?category_id=${category.id}&i=3&limit=0">页数从低到高</a></li>
                <li><a href="/category_detail?category_id=${category.id}&i=4&limit=0">评论数从高到低</a></li>
                <li><a href="/category_detail?category_id=${category.id}&i=5&limit=0">新品上市</a></li>
                <li><a href="/category_detail?category_id=${category.id}&i=6&limit=0">销量从高到低</a></li>
            </ul>
        </div>
    </div>
</div>
<!----------------proList------------------------->
<ul class="proList wrapper clearfix" id="idDate" >
    <c:forEach items="${bookNewList}" var="booknew">
    <li>
       <%-- <a href="/showProduct?product_id=${booknew.id}">--%>

            <dl>
                <dt><a href="${booknew.image}"><img src="${booknew.image}" referrerpolicy="no-referrer"></a></dt>
                <dd><a href="/showProduct?product_id=${booknew.id}">${booknew.bookname}</a></dd>
                <dd>￥${booknew.price}</dd>
            </dl>
    </li>

    </c:forEach>

</ul>
<div id="addBootom"> </div>
<table width="60%" align="right">
    <tr><td><div id="barcon" name="barcon"></div></td></tr>
</table>
<div>
    <c:if test="${empty bookNewList}">
        <div class="nrt">
            <p>
                该分类下没有书籍哦
            </p>
        </div>
    </c:if>
</div>
<script>
    var pageIndex=0;
    $(document).ready(function () {
        $('#dataTables-example').dataTable();

        var BOTTOM_OFFSET = 0;
        $(window).scroll(function() {

            var $currentWindow = $(window);
//当前窗口的高度
            var windowHeight = $currentWindow.height();
//当前滚动条从上往下滚动的距离
            var scrollTop = $currentWindow.scrollTop();
//当前文档的高度
            var docHeight = $(document).height();
//当 滚动条距底部的距离 + 滚动条滚动的距离 >= 文档的高度 - 窗口的高度
//换句话说：（滚动条滚动的距离 + 窗口的高度 = 文档的高度） 这个是基本的公式

            if (scrollTop+0.5>= docHeight - windowHeight) {
//这里可以写判断逻辑
                pageIndex++;
                GetList();
            }

        });

    });
    function GetList() {

        $.ajax({
            type: "POST",
            url: "/category_detailn",
            data:{
                category_id:${category.id},
                limit:pageIndex},
            scriptCharset: 'utf-8',
            dataType: "json",
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            success: function (jsonList) {
                jsonList=eval(jsonList);

                var listLength = jsonList.length;
                if (listLength == 0) {
                    //alert(pageIndex);
                    pageIndex--;
                    $("#addBootom").append(
                        '<div class="header">\n' +
                        ' <div>我是有底线的</div>\n' +
                        ' </div>');
                } else  {
                    for (var i = 0; i < listLength; i++) {
                        /*ar jsonForeach = jsonList[i];
                        var jsonObjForeach = JSON.parse(JSON.stringify(jsonForeach));*/
                        $("#idDate").append(' <li>\n' +
                            '       <%-- <a href="/showProduct?product_id=${booknew.id}">--%>\n' +
                            '\n' +
                            '            <dl>\n' +
                            '                <dt><a href="'+jsonList[i].image+'"><img src="'+jsonList[i].image+'" referrerpolicy="no-referrer"></a></dt>\n' +
                            '                <dd><a href="/showProduct?product_id='+jsonList[i].id+'">'+jsonList[i].bookname+'</a></dd>\n' +
                            '                <dd>￥'+jsonList[i].price+'</dd>\n' +
                            '            </dl>\n' +
                            '    </li>');
                    }
                }

            },
            error:function (json) {
                //发异步，把数据提交给php
              alert("增加失败111", {icon: 5},function () {
                });
            }
        });
    }
</script>
<!----------------mask------------------->
<div class="mask"></div>
<!-------------------mask内容------------------->
<div class="proDets">
    <img class="off" src="img/temp/off.jpg" />
    <div class="tit clearfix">
        <h4 class="fl">【最家】非洲菊仿真花干花</h4>
        <span class="fr">￥17.90</span>
    </div>
    <div class="proCon clearfix">
        <div class="proImg fl">
            <img class="list" src="img/temp/proDet.jpg"  />
            <div class="smallImg clearfix">
                <img src="img/temp/proDet01.jpg" data-src="img/temp/proDet01_big.jpg">
                <img src="img/temp/proDet02.jpg" data-src="img/temp/proDet02_big.jpg">
                <img src="img/temp/proDet03.jpg" data-src="img/temp/proDet03_big.jpg">
                <img src="img/temp/proDet04.jpg" data-src="img/temp/proDet04_big.jpg">
            </div>
        </div>
        <div class="fr">
            <div class="proIntro">
                <p>颜色分类</p>
                <div class="smallImg clearfix categ">
                    <p class="fl"><img src="img/temp/prosmall01.jpg" alt="白瓷花瓶+20支快乐花" data-src="img/temp/proBig01.jpg"></p>
                    <p class="fl"><img src="img/temp/prosmall02.jpg" alt="白瓷花瓶+20支兔尾巴草" data-src="img/temp/proBig02.jpg"></p>
                    <p class="fl"><img src="img/temp/prosmall03.jpg" alt="20支快乐花" data-src="img/temp/proBig03.jpg"></p>
                    <p class="fl"><img src="img/temp/prosmall04.jpg" alt="20支兔尾巴草" data-src="img/temp/proBig04.jpg"></p>
                </div>
                <p>数量&nbsp;&nbsp;库存<span>2096</span>件</p>
                <div class="num clearfix">
                    <img class="fl sub" src="img/temp/sub.jpg">
                    <span class="fl" contentEditable="true">1</span>
                    <img class="fl add" src="img/temp/add.jpg">
                    <p class="please fl">请选择商品属性!</p>
                </div>
            </div>
            <div class="btns clearfix">
                <a href="#2"><p class="buy fl">立即购买</p></a>
                <a href="#2"><p class="cart fr">加入购物车</p></a>
            </div>
        </div>
    </div>
    <a class="more" href="proDetail.html">查看更多细节</a>
</div>
<!--返回顶部-->
<div class="gotop">
    <a href="/cart">
        <dl class="goCart">
            <dt><img src="img/gt1.png"/></dt>
            <dd>去购<br />物车</dd>
            <span><%=session.getAttribute("cartTotalItemNumber")%></span>
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
    <a href="#" class="toptop" style="display: none;">
        <dl>
            <dt><img src="img/gt4.png"/></dt>
            <dd>返回<br />顶部</dd>
        </dl>
    </a>
    <p>400-800-8200</p>
</div>
<div class="msk"></div>
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
    <p class="dibu">WELCOME TO<br />
        BOOKSTORE</p>
</div>

<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
<script src="assets/js/dataTables/jquery.dataTables.js"></script>
<script src="assets/js/dataTables/dataTables.bootstrap.js"></script>
</body>
</html>
