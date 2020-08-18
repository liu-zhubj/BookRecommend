<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>后台</title>
    <!-- Bootstrap Styles-->
    <link href="../assets/css/bootstrap.css" rel="stylesheet" />
    <!-- FontAwesome Styles-->
    <link href="../assets/css/font-awesome.css" rel="stylesheet" />
    <!-- Morris Chart Styles-->

    <!-- Custom Styles-->
    <link href="../assets/css/custom-styles.css" rel="stylesheet" />
    <!-- Google Fonts-->
    <link href='https://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />
    <!-- TABLE STYLES-->
    <link href="../assets/js/dataTables/dataTables.bootstrap.css" rel="stylesheet" />
</head>
<body>
<div id="wrapper">
    <nav class="navbar navbar-default top-navbar" role="navigation">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".sidebar-collapse">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="listCategory">BOOKSTORE</a>
        </div>
    </nav>

    <!--/. NAV TOP  -->
    <nav class="navbar-default navbar-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="main-menu">

                <li>
                    <a class="active-menu" href="listCategory"><i class="fa fa-bars"></i> 分类管理</a>
                </li>
                <li>
                    <a href="listUser"><i class="fa fa-user"></i> 用户管理</a>
                </li>
                <li>
                    <a href="listOrder"><i class="fa fa-list-alt"></i> 订单管理</a>
                </li>
                <li>
                    <a href="listLink"><i class="fa fa-link"></i> 推荐链接管理</a>
                </li>
            </ul>
        </div>

    </nav>
    <!-- /. NAV SIDE  -->
    <div id="page-wrapper">
        <div id="page-inner">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="page-header">
                        分类管理
                        <small> - ${category.name} - id:${product.id} 产品管理</small>
                    </h1>
                </div>
            </div>

            <div class="row">
                <div class="col-md-3">
                    <a href="javascript:history.back()" class="btn btn-success">返回上一页</a>
                </div>
            </div>
            <br>

            <div class="row">
                <div class="col-md-6">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            编辑产品信息
                        </div>
                        <div class="panel-body">
                            <div class="row col-lg-12">
                                <form action="updateProduct" role="form">
                                    <div class="form-group">
                                        <input type="hidden" name="id" value="${product.id}">
                                        <label>图片url：</label>
                                        <input type="text" name="image" class="form-control" value="${product.image}">

                                        <label>书名：</label>
                                        <input type="text" name="bookname" class="form-control" value="${product.bookname}">
                                        <label>作者：</label>
                                        <input type="text" name="author"class="form-control" value="${product.author}">
                                        <label>价格：</label>
                                        <input type="text" name="price"class="form-control" value="${product.price}">
                                        <label>评分：</label>
                                        <input type="text" name="score"class="form-control" value="${product.score}">
                                        <label>页数：</label>
                                        <input type="text" name="pages"class="form-control" value="${product.pages}">
                                        <label>销量：</label>
                                        <input type="text" name="salenumber"class="form-control" value="${product.salenumber}">
                                        <label>库存：</label>
                                        <input type="text" name="storenumber"class="form-control" value="${product.storenumber}">
                                        <label>书籍详细信息：</label>
                                        <input type="text" name="bookinfo"class="form-control" value="${product.bookinfo}">
                                        <label>作者简介：</label>
                                        <input type="text" name="authorIntroduction"class="form-control" value="${product.authorIntroduction}">
                                        <label>标签：</label>
                                        <input type="text" name="label"class="form-control" value="${product.label}">

                                        <br>
                                        <input type="hidden" name="classId" value="${category.id}">
                                        <input type="submit" class="btn btn-default pull-right" value="确认修改">
                                    </div>
                                </form>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
<!-- /. WRAPPER  -->
<!-- /. WRAPPER  -->
<!-- JS Scripts-->
<!-- jQuery Js -->
<script src="../assets/js/jquery-1.10.2.js"></script>
<!-- Bootstrap Js -->
<script src="../assets/js/bootstrap.min.js"></script>
<!-- Metis Menu Js -->
<script src="../assets/js/jquery.metisMenu.js"></script>
<!-- DATA TABLE SCRIPTS -->
<script src="../assets/js/dataTables/jquery.dataTables.js"></script>
<script src="../assets/js/dataTables/dataTables.bootstrap.js"></script>
<script>
    $(document).ready(function () {
        $('#dataTables-example').dataTable();
    });
</script>
<!-- Custom Js -->
<script src="../assets/js/custom-scripts.js"></script>
</body>
</html>
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>后台管理</title>
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta name="viewport" content="width=device-width,user-scalable=yes, minimum-scale=0.4, initial-scale=0.8,target-densitydpi=low-dpi" />
    <link rel="stylesheet" href="../../../css/font.css">
    <link rel="stylesheet" href="../../../css/xadmin.css">
    <script type="text/javascript" src="../../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body style="background-color: white">
<div class="x-nav">
          <span class="layui-breadcrumb">
            <a href="">首页</a>
            <a href="">演示</a>
            <a>
              <cite>导航元素</cite></a>
          </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i></a>
</div>
<div>
    <h2 style="font-family: 华文楷体;margin-left: 20px;margin-top: 10px">编辑图书</h2>
</div>

        <form action="/admin/updateProduct">
            <input hidden name="id" value="${product.id}">
            <div class="layui-form-item">

                <label  class="layui-form-label">
                    图片url
                </label>
                <div class="layui-input-inline">
                    <input type="text" hidden name="image" class="layui-input" value="${product.image}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">

                </label>
                <div class="layui-input-inline">
                    <img src="${product.image}" style="width: 40px;height: 70px" referrerpolicy="no-referrer">
                </div>

            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    图书名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="bookname" class="layui-input" value="${product.bookname}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    作者
                </label>
                <div class="layui-input-inline">
                    <input type="text"  name="author" class="layui-input" value="${product.author}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    价格
                </label>
                <div class="layui-input-inline">
                    <input type="text"  name="price" class="layui-input" value="${product.price}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    ISBN
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="isbn" class="layui-input" value="${product.isbn}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    出版社
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="publicsource" class="layui-input" value="${product.publicsource}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    出版日期
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="date" class="layui-input" value="${product.date}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    评分
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="score" class="layui-input" value="${product.score}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    页数
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="pages" class="layui-input" value="${product.pages}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    销量
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="salenumber" class="layui-input" value="${product.salenumber}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    库存
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="storenumber" class="layui-input" value="${product.storenumber}">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    作者简介
                </label>
                <div class="layui-input-inline">
                    <textarea type="text"  name="authorIntroduction" style="width: 200px;height: 60px;background-color: white" >${product.authorIntroduction}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    图书简介
                </label>
                <div class="layui-input-inline">
                    <textarea type="text"  name="bookinfo" style="width:200px;height: 60px;background-color: white" >${product.bookinfo}</textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    标签
                </label>
                <div class="layui-input-inline">
                    <textarea type="text"  name="label" style="width:200px;height: 60px;background-color: white">${product.label}</textarea>
                </div>
            </div>

            <c:choose>

                <c:when test="${category!= null}">
                    <input hidden name="classId" value="${category.id}">
                    <input hidden name="category_classId" value="${category.id}">
                </c:when>
                <c:otherwise>
                    <div class="layui-form-item">
                        <label  class="layui-form-label">
                            选择所属分类
                        </label>
                        <div >
                            <select name="classId" style="height: 35px;background-color: red">
                                    <%--  <option value="${categoryclass.categoryId}"  selected>选择所属分类</option>--%>
                                <c:forEach items="${categoryClasses}" var="c11">
                                    <option value="${c11.id}">${c11.categoryClassname}</option>
                                </c:forEach>
                            </select>
                            <input hidden name="category_classId" value="0">
                        </div>
                    </div>
                </c:otherwise>

            </c:choose>
            <input hidden name="translator" value="${product.translator}">
            <input hidden name="currentPrice" value="${product.currentPrice}">
            <input hidden name="numberOfPeople" value="${product.numberOfPeople}">
            <input hidden name="catalog" value="${product.catalog}">

            <div class="layui-form-item">
                <button  class="layui-btn" type="submit">
                    修改
                </button>
            </div>
        </form>

<%--<script>layui.use(['form', 'layer'],
    function() {
        $ = layui.jquery;
        var form = layui.form,
            layer = layui.layer;

        //自定义验证规则
        form.verify({
            nikename: function(value) {
                if (value.length < 5) {
                    return '昵称至少得5个字符啊';
                }
            },
            pass: [/(.+){6,12}$/, '密码必须6到12位'],
            repass: function(value) {
                if ($('#L_pass').val() != $('#L_repass').val()) {
                    return '两次密码不一致';
                }
            }
        });

        //监听提交
        form.on('submit(add)',
            function(data) {
                console.log(data);
                //发异步，把数据提交给php
                layer.alert("增加成功", {
                        icon: 6
                    },
                    function() {
                        //关闭当前frame
                        xadmin.close();

                        // 可以对父窗口进行刷新
                        xadmin.father_reload();
                    });
                return false;
            });

    });</script>--%>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>
</body>

</html>

