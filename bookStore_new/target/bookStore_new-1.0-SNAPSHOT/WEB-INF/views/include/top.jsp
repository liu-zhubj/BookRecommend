<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>--%>
<%@ page language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>


<%-- 顶部导航栏 --%>
<style>
    .workArea {

        width: 100%;
        /*margin: 0 auto;*/
    }
    .sss{
        color: white;
    }

    #site-nav {

        background-color:#4D4D4D;
        height: 32px;
        /* 顶部导航栏下面的灰色横线 */
        border-bottom: 1px solid #2b542c;
    }

    #site-nav span {
        padding-left: 20px;
        line-height: 32px;

    }
    .pull-right {
        float: right !important;
    }
    .glyphicon {
        position: relative;
        top: 1px;
        display: inline-block;
        font-family: 'Glyphicons Halflings' ;
        font-style: normal;
        font-weight: normal;
        line-height: 1;

        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale;
    }
    .glyphicon-shopping-cart:before {
        content: "\e116";
    }
    .redColor {
        color: #FF0036;
    }


</style>
<nav id="site-nav" role="navigation">
    <div class="workArea" style="color: white">

        <%-- 导航栏左半部分
         如果取不到用户信息则显示如下： --%>
        <c:if test="${empty sessionScope.user}">
            <span class="sss">欢迎来BOOKSTORM</span>
            <span class="sss"><a href="/login_new" style="color: white;">请登录</a></span>
            <span class="sss"><a href="/register_new" style="color: white;">免费注册</a></span>
        </c:if>
        <%-- 如果用户成功登录，则显示如下： --%>
        <c:if test="${!empty sessionScope.user}">
            <span class="sss" style="color: white;">Hi，${sessionScope.user.name}</span>
            <span  class="sss" ><a href="/logout" style="color: white">退出</a></span>
            <span  class="sss" ><a href="/home" style="color: white">首页</a></span>
        </c:if>



    </div>
</nav>
