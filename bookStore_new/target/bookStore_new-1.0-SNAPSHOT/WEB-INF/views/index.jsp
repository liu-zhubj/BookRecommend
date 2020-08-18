<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>


<%--
  Created by IntelliJ IDEA.
  User: Administrator
  Date: 2018/5/3 0003
  Time: 上午 9:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.util.ArrayList" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<jsp:useBean id="categoryService" class="service.CategoryClassServiceImpl" />
<jsp:include page="include/header_1.jsp"/>
<jsp:include page="include/top.jsp"/>
<jsp:include page="include/search.jsp"/>


<html>
<head>
    <meta charset="UTF-8">
    <meta name="author" content="order by dede58.com"/>
    <title>BOOKSROEM</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
    <link rel="stylesheet" type="text/css" href="css/index.css" />
</head>

<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.flexslider-min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    $(function() {
        $('#home_slider').flexslider({
            animation: 'slide',
            controlNav: true,
            directionNav: true,
            animationLoop: true,
            slideshow: true,
            slideshowSpeed:2000,
            useCSS: false
        });

    });
</script>

<body>
<%--<div class="head">
    <div class="wrapper clearfix">
        <div class="clearfix" id="top">

        </div>
        &lt;%&ndash;<div class="clearfix" id="top">
            <h1 class="fl"><a href="index.html"><img src="img/logo.png"/></a></h1>
            <div class="fr clearfix" id="top1">
                <p class="fl">

                    <c:if test="${empty sessionScope.user}">

                        <a href="/login_new" id="login">登录</a>
                        <a href="/register_new" id="reg">注册</a>
                    </c:if>
                    &lt;%&ndash; 如果用户成功登录，则显示如下： &ndash;%&gt;
                    <c:if test="${!empty sessionScope.user}">
                        <span style="color: black;">Hi，${sessionScope.user.name}</span>

                        <span><a href="/logout" style="color: black">退出</a></span>
                    </c:if>

                </p>
                <form action="#" method="get" class="fl">
                    <input type="text" placeholder="热门搜索：干花花瓶" />
                    <input type="button" />
                </form>
                <div class="btn fl clearfix">
                    <a href="/mine"><img src="img/grzx.png"/></a>
                    <a href="#" class="er1"><img src="img/ewm.png"/></a>
                    <a href="/cart"><img src="img/gwc.png"/></a>
                    <p><a href="#"><img src="img/smewm.png"/></a></p>
                </div>
            </div>
        </div>&ndash;%&gt;
        &lt;%&ndash;<ul class="clearfix" id="bott">
            <li><a href="/new">首页</a></li>
            <li>
                <a href="#">所有商品</a>
                <div class="sList">
                    <div class="wrapper  clearfix">
                        <a href="paint.html">
                            <dl>
                                <dt><img src="img/nav1.jpg"/></dt>
                                <dd>浓情欧式</dd>
                            </dl>
                        </a>
                        <a href="paint.html">
                            <dl>
                                <dt><img src="img/nav2.jpg"/></dt>
                                <dd>浪漫美式</dd>
                            </dl>
                        </a>
                        <a href="paint.html">
                            <dl>
                                <dt><img src="img/nav3.jpg"/></dt>
                                <dd>雅致中式</dd>
                            </dl>
                        </a>
                        <a href="paint.html">
                            <dl>
                                <dt><img src="img/nav6.jpg"/></dt>
                                <dd>简约现代</dd>
                            </dl>
                        </a>
                        <a href="paint.html">
                            <dl>
                                <dt><img src="img/nav7.jpg"/></dt>
                                <dd>创意装饰</dd>
                            </dl>
                        </a>
                    </div>
                </div>
            </li>
            <li>
                <a href="flowerDer.html">装饰摆件</a>
                <div class="sList2">
                    <div class="clearfix">
                        <a href="proList.html">干花花艺</a>
                        <a href="vase_proList.html">花瓶花器</a>
                    </div>
                </div>
            </li>
            <li>
                <a href="decoration.html">布艺软饰</a>
                <div class="sList2">
                    <div class="clearfix">
                        <a href="zbproList.html">桌布罩件</a>
                        <a href="bzproList.html">抱枕靠垫</a>
                    </div>
                </div>
            </li>
            <li><a href="paint.html">墙式壁挂</a></li>
            <li><a href="perfume.html">蜡艺香薰</a></li>
            <li><a href="idea.html">创意家居</a></li>
        </ul>&ndash;%&gt;
    </div>
</div>--%>


<!-- start banner_y -->

<!-------------------------banner--------------------------->
<div class="block_home_slider" >
    <div class="banner_y center" style="position: relative;border: 3px solid red">
        <div class="nav">
            <ul>

                <c:forEach items="${categories}" var="c">
                    <li>
                        <a href="">${c.name}</a>
                        <c:set var="cc" value="${c.id}" scope="session"></c:set>
                        <%
                            Integer category_id= (Integer) pageContext.findAttribute("cc");
                            String URL="jdbc:mysql://127.0.0.1:3306/bookstorm?useUnicode=true&amp;characterEncoding=utf-8";
                            String USER="root";
                            String PASSWORD="root";
                            //1.加载驱动程序
                            Class.forName("com.mysql.jdbc.Driver");
                            //2.获得数据库链接
                            Connection conn=DriverManager.getConnection(URL, USER, PASSWORD);
                            //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
                            Statement st=conn.createStatement();
                            ResultSet rs=st.executeQuery("select * from category_class where category_id="+category_id);
                        %>
                        <div class="pop">
                            <div class="left fl">
                                <% while(rs.next())
                                {
                                %>
                                <div>
                                    <div class="xuangou_left fl">

                                        <a href="/category_detail?category_id=<%=rs.getInt("id")%>&i=0&limit=0">
                                            <div class="img fl"></div>

                                            <span class="fl">


                                         <%=rs.getString("category_className")
                                         %>   </span>
                                            <div class="clear"></div>
                                        </a>
                                    </div>
                                    <div class="xuangou_right fr"><a href="/category_detail?category_id=<%=rs.getInt("id")%>&i=0">查看</a></div>
                                    <div class="clear"></div>
                                </div>
                                <%
                                    }
                                %>
                            </div>
                            <div class="clear"></div>
                        </div>


                    </li>
                </c:forEach>

            </ul>
        </div>

    </div>


</div>





<div class="news">
    <div class="wrapper">
        <h2 style="margin-top: -20px">新书速递 </h2>
        <div style="border:1px solid gainsboro"></div>

        <ul class="proList wrapper clearfix">
<c:forEach items="${listNew}" var="bookBynew">
            <li>
                <a href="/showProduct?product_id=${bookBynew.id}">
               <%-- <a href="${bookBynew.image}">--%>
                    <dl>
                        <dt><img src="${bookBynew.image}" referrerpolicy="no-referrer"></dt>
                        <dd>${bookBynew.bookname}</dd>
                        <dd>￥${bookBynew.price}</dd>
                    </dl>
                </a>
            </li>
</c:forEach>
        </ul>
    </div>
</div>




<div class="news">
    <div class="wrapper">
        <h2 style="margin-top: -20px">热门书籍 </h2>
        <div style="border:1px solid gainsboro"></div>

        <ul class="proList wrapper clearfix">
            <c:forEach items="${listSale}" var="bookBynew">
                <li>
                    <a href="/showProduct?product_id=${bookBynew.id}">
                       <%-- <a href="${bookBynew.image}">--%>
                        <dl>
                            <dt><img src="${bookBynew.image}" referrerpolicy="no-referrer"></dt>
                            <dd>${bookBynew.bookname}</dd>
                            <dd>￥${bookBynew.price}</dd>
                        </dl>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>

<div class="news">
    <div class="wrapper">
<c:if test="${listByU!=null}">
        <h2 style="margin-top: -20px;color: black">猜你喜欢 </h2>
        <div style="border:1px solid gainsboro"></div>
</c:if>

        <ul class="proList wrapper clearfix">
            <c:forEach items="${listByU}" var="u">
                <li>
                        <a href="/showProduct?product_id=${u.id}">
                   <%-- <a href="${u.image}">--%>
                        <dl>
                            <dt><img src="${u.image}" referrerpolicy="no-referrer"></dt>
                            <dd>${u.bookname}</dd>
                            <dd>￥${u.price}</dd>
                        </dl>
                    </a>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<!------------------------------ad------------------------------>
<a href="#" class="ad"><img src="img/ib1.jpg"/></a>
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
<!-------------------login-------------------------->
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
</body>
</html>


<%--
<%@include file="include/footer.jsp" %>--%>
