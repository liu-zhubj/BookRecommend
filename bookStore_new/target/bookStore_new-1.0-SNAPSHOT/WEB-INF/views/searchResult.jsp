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
    <title>查找</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>

    <script src="js/echarts.min.js"></script>
    <jsp:include page="/WEB-INF/views/include/header_1.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>
    <jsp:include page="/WEB-INF/views/include/search.jsp"></jsp:include>
<style>
    div.searchProducts {
        margin-top: 80px;
        padding-left: 5px;
        padding-right: 5px;
    }

    .filter {
        boder-top: 1px solid #e5e5e5;
        margin: 10px 0;
        padding: 5px;
        position: relative;
        z-index: 10;
        background: #faf9f9;
        color: #806f66;
    }

    .fSort:hover, a.fSort-cur, a.fType-cur {
        color: #FF0036;
        background-color: #F1EDEC;
    }

    .fSort {
        display: inline-block;
        margin-left: -1px;
        overflow: hidden;
        padding: 0 15px 0 5px;
        float: left;
        height: 22px;
        line-height: 20px;
        border: 1px solid #CCCCCC;
        z-index: 10;
    }
     .product {
         margin-top: 40px;
         margin-right: 20px;
         margin-bottom: 20px;
         width: 220px;
         height: 290px;
         position: relative;
         float: left;
         padding: 0;
         /*margin: 0 0 20px;*/
         line-height: 1.5;
         overflow: visible;
         z-index: 1;
     }

    .product-hover .product-iWrap, .product:hover .product-iWrap {
        height: auto;
        margin: -3px;
        border: 4px solid #ff0036;
        border-radius: 0;
        -webkit-transition: border-color .2s ease-in;
        -moz-transition: border-color .2s ease-in;
        -ms-transition: border-color .2s ease-in;
        -o-transition: border-color .2s ease-in;
        transition: border-color .2s ease-in;
    }

    .product:hover {
        overflow: visible;
        z-index: 3;
        background: #fff;
    }

    .product-iWrap {
        min-height: 98%;
        width: 210px;
        position: absolute;
        background-color: #fff;
        margin: 0;
        padding: 4px 4px 0;
        font-size: 12px;
        border: 1px solid #f5f5f5;
        border-radius: 3px;
    }

    .productImg-wrap a, .productImg-wrap img {
        max-width: 100%;
        max-height: 210px;
    }

    .productPrice {
        font-family: arial, verdana, sans-serif !important;
        color: #ff0036;
        font-size: 14px;
        height: 30px;
        line-height: 30px;
        margin: 0 0 5px;
        letter-spacing: normal;
        overflow: inherit !important;
        white-space: nowrap;
    }

    .productPrice em {
        float: left;
        font-family: arial;
        font-weight: 400;
        font-size: 20px;
        color: #ff0036;
    }

    .productPrice em b {
        margin-right: 2px;
        font-weight: 700;
        font-size: 14px;
        vertical-align: middle;
    }

    .productTitle {
        display: block;
        color: #666;
        height: 14px;
        line-height: 12px;
        margin-bottom: 3px;
        word-break: break-all;
        position: relative;
        overflow: hidden;

    }

    .productTitle a {
        color: #333;
        font-family: 微软雅黑;
        line-height: 14px;
        font-size: 12px;
    }

    .productStatus {
        position: relative;
        height: 33px;
        border: none;
        border-top: 1px solid #eee;
        margin-bottom: 0;
        color: #999;
        display: block;
        overflow: hidden;
    }

    .productStatus em {
        color: #b57c5b;
    }

    .productStatus a, .productStatus em {
        margin-top: -8px;
        font-family: arial;
        font-size: 12px;
        font-weight: 700;
    }

    em {
        font-style: normal;
    }

    .productStatus span {
        float: left;
        display: inline-block;
        border-right: 1px solid #eee;
        width: 39%;
        padding: 10px 1px;
        margin-right: 6px;
        line-height: 12px;
        text-align: left;
        white-space: nowrap;
    }

    .productStatus a {
        color: #38b;
    }

    .productStatus .ww-light {
        border-right: none;
        width: 11%;
        text-align: center;
    }

    .productStatus .ww-light a {
        background: url(/img/fore/ww-online.png) center center no-repeat !important;
        background-size: 16px !important;
        position: relative;
        width: 16px;
        height: 16px;
        margin-top: -3px;
        overflow: hidden;
        display: inline-block;
        vertical-align: text-bottom;
    }

</style>
</head>
<body>
<c:set var="vaaa" scope="session" value="${keywords}"></c:set>
<script>
    var pageIndex=0;
    var v=0;
    $(document).ready(function () {
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

            if (scrollTop>= docHeight - windowHeight) {
//这里可以写判断逻辑
                pageIndex++;
                GetList();
            }

        });

    });
    function GetList() {
        var x=document.getElementById("vaaaa");
        var v=x.innerHTML;
        $.ajax({
            type: "POST",
            url: "/searchProduct1",
            data:{
                keyword:v,
                limit:pageIndex
            },
            scriptCharset: 'utf-8',
            dataType: "json",
            contentType: "application/x-www-form-urlencoded;charset=UTF-8",
            success: function (jsonList) {
                jsonList=eval(jsonList);

                var listLength = jsonList.length;
                if (listLength == 0) {
                    //alert(pageIndex);
                    pageIndex--;
                } else  {
                    for (var i = 0; i < listLength; i++) {
                        /*ar jsonForeach = jsonList[i];
                        var jsonObjForeach = JSON.parse(JSON.stringify(jsonForeach));*/
                        $("#bookLieBiao").append(' <div class="product">\n' +
                            '                <div class="product-iWrap">\n' +
                            '                    <div class="productImg-wrap">\n' +
                            '                       <%-- <a class="productImg" href="/showProduct?product_id=${p.id}">--%>\n' +
                            '                        <a href="'+jsonList[i].image+'">\n' +
                            '                            <img src="'+jsonList[i].image+'" referrerpolicy="no-referrer">\n' +
                            '                        </a>\n' +
                            '                    </div>\n' +
                            '                    <div style="clear: both;"></div>\n' +
                            '                    <p class="productPrice">\n' +
                            '                        <em title="'+jsonList[i].price+'">\n' +
                            '                            <b>￥</b>'+jsonList[i].price+'\n' +
                            '                        </em>\n' +
                            '                    </p>\n' +
                            '                    <div style="clear: both;"></div>\n' +
                            '                    <p class="productTitle">\n' +
                            '                        <a href="/showProduct?product_id='+jsonList[i].id+'">'+jsonList[i].bookname+'</a>\n' +
                            '                    </p>\n' +
                            '                    <p class="productStatus">\n' +
                            '                        <span>销量<em>'+jsonList[i].salenumber+'</em></span>\n' +
                            '                        <span>评价<a href="#nowhere">'+jsonList[i].numberOfPeople+'</a></span>\n' +
                            '                        <span class="ww-light"><a></a></span>\n' +
                            '                    </p>\n' +
                            '                </div>\n' +
                            '            </div>');
                        /*<li>\n' +
                            '
                            '\n' +
                            '            <dl>\n' +
                            '                <dt><a href="'+jsonList[i].image+'"><img src="'+jsonList[i].image+'" referrerpolicy="no-referrer"></a></dt>\n' +
                            '                <dd><a href="/showProduct?product_id='+jsonList[i].id+'">'+jsonList[i].bookname+'</a></dd>\n' +
                            '                <dd>￥'+jsonList[i].price+'</dd>\n' +
                            '            </dl>\n' +
                            '    </li>');*/
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
<p hidden  id="vaaaa">${keywords}</p>
<div class="workArea">
    <div class="searchProducts">
       <%-- <div class="filter">
            <a class="fSort"
               <c:if test="${'all'==param.sort||empty param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=all&keyword=${param.keyword}">综合</a>
            <a class="fSort"
               <c:if test="${'reviewCount'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=reviewCount&keyword=${param.keyword}">人气</a>
            <a class="fSort"
               <c:if test="${'date'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=date&keyword=${param.keyword}">新品</a>
            <a class="fSort"
               <c:if test="${'sale'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=sale&keyword=${param.keyword}">销量</a>
            <a class="fSort"
               <c:if test="${'price'==param.sort}">class="fSort-cur"</c:if>
               href="/sortProduct?sort=price&keyword=${param.keyword}">价格</a>
        </div>--%>
        <div class="filter" style="font-size: 15px">${keywords}</div>
        <div style="clear: both;"></div>
<div id="bookLieBiao">
        <c:forEach items="${products}" var="p">
            <div class="product">
                <div class="product-iWrap">
                    <div class="productImg-wrap">
                       <%-- <a class="productImg" href="/showProduct?product_id=${p.id}">--%>
                        <a href="${p.image}">
                            <img src="${p.image}" referrerpolicy="no-referrer">
                        </a>
                    </div>
                    <div style="clear: both;"></div>
                    <p class="productPrice">
                        <em title="${p.price}">
                            <b>￥</b>${p.price}
                        </em>
                    </p>
                    <div style="clear: both;"></div>
                    <p class="productTitle">
                        <a href="/showProduct?product_id=${p.id}">${p.bookname}</a>
                    </p>
                    <p class="productStatus">
                        <span>销量<em>${p.salenumber}</em></span>
                        <span>评价<a href="#nowhere">${p.numberOfPeople}</a></span>
                        <span class="ww-light"><a></a></span>
                    </p>
                </div>
            </div>
        </c:forEach>
</div>

        <style>
            .nrt {
                background: url(/img/fore/no-product.png) 35px center no-repeat #fff8f6;
                color: #595959;
                margin-bottom: 10px;
                padding: 20px 0 20px 123px;
                line-height: 27px;
                font-size: 14px;
                border: 1px solid #F7EAE7;
                margin-top: 25px;
            }
        </style>

        <c:if test="${empty products}">
            <div class="nrt">
                <p>
                    没找到与
                    <em>" ${param.keyword} "</em>
                    相关的商品哦。
                </p>
            </div>
        </c:if>
        <div style="clear:both"></div>
    </div>
</div>
</body>
</html>

