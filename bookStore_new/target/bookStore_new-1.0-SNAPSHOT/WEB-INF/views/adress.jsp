<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/1
  Time: 14:56
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
    <title>最家</title>
    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/mygxin.css" />
    <link rel="stylesheet" type="text/css" href="css/style1.css" />

    <style>
        table{
           margin-top: 40px;

        }
        td{
            width: 150px;
            height: 60px;
            text-align: center;
        }

        thead{
            border: 2px solid grey;
        }
    </style>
</head>
<body>
<!------------------------------head------------------------------>
<%--<div class="head ding">
    <div class="wrapper clearfix">
        <div class="clearfix" id="top">
            <h1 class="fl"><a href="index.html"><img src="img/logo.png"/></a></h1>
            <div class="fr clearfix" id="top1">
                <p class="fl">
                    <a href="login.html" id="login">登录</a>
                    <a href="reg.html" id="reg">注册</a>
                </p>
                <form action="#" method="get" class="fl">
                    <input type="text" placeholder="搜索" />
                    <input type="button" />
                </form>
                <div class="btn fl clearfix">
                    <a href="mygxin.html"><img src="img/grzx.png"/></a>
                    <a href="#" class="er1"><img src="img/ewm.png"/></a>
                    <a href="cart.html"><img src="img/gwc.png"/></a>
                    <p><a href="#"><img src="img/smewm.png"/></a></p>
                </div>
            </div>
        </div>
        <ul class="clearfix" id="bott">
            <li><a href="index.html">首页</a></li>
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
        </ul>
    </div>
</div>--%>
<!------------------------------idea------------------------------>
<div class="address mt">
    <div class="wrapper clearfix">
        <a href="/home" class="fl">首页</a>
        <span>/</span>
        <a href="/mine">个人中心</a>
        <span>/</span>
        <a href="address.html" class="on">地址管理</a>
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
            <h2> 收货地址
                <a href="#2" id="addxad" style="font-size: 15px;color: #A10000">新增收货地址</a>
            </h2>
           <%-- <span><a href="#2" id="addxad">新增收货地址</a></span>--%>
            <table >
                <thead >
                <td>序号</td>
                <td>省份</td>
                <td>城市</td>
                <td>地区</td>
                <td>姓名</td>
                <td>电话</td>
                <td>操作</td>
                </thead>
                <tr >
                    <td style=" height: 30px;"></td>
                </tr>
<c:forEach var="adr" items="${listAd}">
                <tr style=" border: 1px solid red;">
                    <td class="xuhao">${adr.id}</td>
                    <td class="p" >${adr.province}</td>
                    <td class="c">${adr.city}</td>
                    <td class="a">${adr.address}</td>
                    <td class="n">${adr.name}</td>
                    <td class="t">${adr.phone}</td>
                    <td>
                        <a style="color: #A10000"  href="/update_add-new?adr_id=${adr.id}">修改</a>/
                        <a style="color: #A10000" href="/delete_address?adr_id=${adr.id}">删除</a>
                    </td>
                </tr>
</c:forEach>
            </table>

        </div>
    </div>
</div>

<!--编辑弹框-->
<!--遮罩-->
<div class="mask"></div>
<div class="adddz">
    <form action="/add_address">
        <input type="text" name="name" placeholder="姓名" class="on" />
        <input type="text" name="phone" placeholder="手机号" />
       <%-- <input type="text" name="phone" placeholder="您选择的是" id="addr-show" />--%>
        <div hidden> <input hidden type="text" name="province" id="addr-pro"  placeholder="您选择的是"/></div>
        <div hidden> <input hidden type="text" name="city" id="addr-city" placeholder="您选择的是"/></div>
        <div hidden><input hidden type="text" name="district" id="addr-dis" placeholder="您选择的是"/></div>
        <div class="city">
            <p onclick="showProv()">点击选择省市区</p>
            <select id="prov" onclick="showCity(this)" >
                <option  >=请选择省份=</option>
            </select>
            <select id="city"    onclick="showCountry(this)">
                <option  >=请选择城市=</option>
            </select>
            <select id="country"     onclick="selecCountry(this)">
                <option >=请选择县区=</option>
            </select>
            <button type="button" onClick="showAddr()" id="button-show" >确定</button>

        </div>
        <input type="text" name="address" placeholder="详细地址"></input>
        <div class="bc">
            <input type="submit" value="保存" />
            <input type="button" value="取消" />
        </div>
    </form>

</div>
<%--<div class="readd">
    <form action="#" method="get">
        <input type="text"  class="on" value="六六六" />
        <input type="text"  class="n1"value="157****0022" />
        <div class="city">
            <select name="">
                <option value="省份/自治区">河北省</option>
            </select>
            <select>
                <option value="城市/地区">唐山市</option>
            </select>
            <select>
                <option value="区/县">路北区</option>
            </select>
            <select>
                <option value="配送区域">火炬路</option>
            </select>
        </div>
        <textarea name="" rows="" cols="" placeholder="详细地址">高新产业园</textarea>
        <input type="text" placeholder="邮政编码" value="063000"/>
        <div class="bc">
            <input type="button" value="保存" />
            <input type="button" value="取消" />
        </div>
    </form>
</div>--%>
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

<script src="js/city.js" type="text/javascript" charset="utf-8"></script>
<script src="js/method.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery-1.12.4.min.js" type="text/javascript" charset="utf-8"></script>
<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/user.js" type="text/javascript" charset="utf-8"></script>

</body>
</html>

