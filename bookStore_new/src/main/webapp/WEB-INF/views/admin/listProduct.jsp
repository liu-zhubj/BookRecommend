<%--<%@ page language="java" contentType="text/html; charset=UTF-8"
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
            <a class="navbar-brand" href="listCategory">Tmall</a>
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
                        <small> - ${category.name} 产品管理</small>
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
                <div class="col-md-12">
                    <!-- Advanced Tables -->
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            产品管理表
                        </div>
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover" id="dataTables-example">
                                    <thead>
                                    <tr>
                                        <th>产品id</th>
                                        <th>产品名称</th>
                                        <th>作者</th>
                                        <th>出版社</th>
                                        <th>ISBN</th>
                                        <th>出版日期</th>
                                        <th>产品价格</th>
                                        <th>编辑产品</th>
                                        <th>查看详情</th>
                                        <th>删除产品</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${products}" var="p">
                                        <tr>
                                            <td>${p.id}</td>
                                            <td>${p.bookname}</td>
                                            <td>${p.author}</td>
                                            <td>${p.publicsource}</td>
                                            <td>${p.isbn}</td>
                                            <td>${p.date}</td>
                                            <td>${p.price}</td>
                                            <td><a href="editProduct?id=${p.id}&category_id=${category.id}"><span class="glyphicon glyphicon-edit"></span></a></td>
                                           &lt;%&ndash; <td><a href="editProductImage?product_id=${p.id}"><span class="glyphicon glyphicon-picture"></span></a></td>
                                          &ndash;%&gt;  <td><a href="adminBookInfo?product_id=${p.id}&category_id=${category.id}"><span class="glyphicon glyphicon-list"></span></a></td>
                                            <td><a href="deleteProduct?id=${p.id}&category_id=${category.id}"><span class="glyphicon glyphicon-trash"></span></a></td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>

                        </div>
                    </div>
                    <!--End Advanced Tables -->
                </div>
            </div>

            &lt;%&ndash; 产品增加表单 &ndash;%&gt;
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            增加产品
                        </div>
                        <div class="panel-body">
                            <form action="addProduct" role="form">
                                <input type="hidden" name="id" value="">
                                <label>输入图片url：</label>
                                <input type="text" class="form-control" name="image" placeholder="请在这里输入产品名称">
                                <label>书名：</label>
                                <input type="text" class="form-control" name="bookname" placeholder="请在这里输入产品名称">
                                <label>作者：</label>
                                <input type="text" class="form-control" name="author" placeholder="">
                                <label>价格：</label>
                                <input type="text" class="form-control" name="price" placeholder="">
                                <label>销量：</label>
                                <input type="text" class="form-control" name="salenumber" placeholder="">
                                <label>库存：</label>
                                <input type="text" class="form-control" name="sale" placeholder="">
                                <label>页数：</label>
                                <input type="text" class="form-control" name="storenumber" placeholder="">
                                <label>评分：</label>
                                <input type="text" class="form-control" name="score" placeholder="">
                                <label>作者简介：</label>
                                <input type="text" class="form-control" name="authorIntroduction" placeholder="">
                                <label>图书简介：</label>
                                <input type="text" class="form-control" name="bookinfo" placeholder="">
                                <label>出版社：</label>
                                <input type="text" class="form-control" name="publicsource" placeholder="">
                                <label>译者：</label>
                                <input type="text" class="form-control" name="translator" placeholder="">
                                <label>ISBN：</label>
                                <input type="text" class="form-control" name="ISBN" placeholder="">
                                <label>标签：</label>
                                <input type="text" class="form-control" name="label" placeholder="">
                                <input type="hidden" name="classId" value="${category.id}">
                                <input type="submit" class="btn btn-default pull-right" value="添加">
                            </form>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </div>
    <!-- /. PAGE WRAPPER  -->
</div>
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
</html>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <script src="../../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../js/xadmin.js"></script>
    <!--[if lt IE 9]>
    <script src="https://cdn.staticfile.org/html5shiv/r29/html5.min.js"></script>
    <script src="https://cdn.staticfile.org/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>

<body>
<div class="x-nav">
            <span class="layui-breadcrumb">
                <a href="">首页</a>
                <a href="">演示</a>
                <a>
                    <cite>导航元素</cite></a>
            </span>
    <a class="layui-btn layui-btn-small" style="line-height:1.6em;margin-top:3px;float:right" onclick="location.reload()" title="刷新">
        <i class="layui-icon layui-icon-refresh" style="line-height:30px"></i>
    </a>
</div>
<div class="layui-fluid">
    <div class="layui-row layui-col-space15">
        <div class="layui-col-md12">
            <div class="layui-card">
                <div class="layui-card-body ">
                    <form class="layui-form layui-col-space5" action="/admin/searchBook">

                        <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="s" placeholder="请输入" autocomplete="off" class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" type="submit">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>

                <div class="layui-card-header">
                    <%--<button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
                    <button class="layui-btn"&lt;%&ndash;onclick="xadmin.open('添加用户','/add')"&ndash;%&gt;><i class="layui-icon"></i><a href="/admin/addProductRdirtByC?categoryClass_id=${categoryClass.id}">添加</a></button>
                </div>
                <script>
                    function delAll (argument) {
                        var ids = [];

                        // 获取选中的id
                        $('tbody input').each(function(index, el) {
                            if($(this).prop('checked')){
                                ids.push($(this).nextNode().val())
                            }
                        });

                        layer.confirm('确认要删除吗？'+ids.toString(),function(index){
                            //捉到所有被选中的，发异步进行删除
                            layer.msg('删除成功', {icon: 1});
                            $(".layui-form-checked").not('.header').parents('tr').remove();
                        });
                    }
                </script>

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-data="{page:true,toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox'}" value="" >ID</th>
                            <th lay-data="{field:'id', width:80, sort: true}">ID</th>
                            <th lay-data="{field:'username', width:120, sort: true}">书名</th>
                            <th lay-data="{field:'email',minWidth: 170}">作者</th>
                            <th lay-data="{field:'sex', width:80}">价格</th>
                            <th lay-data="{field:'city',width: 80}">ISBN</th>
                            <th lay-data="{field:'experience',width:150 }">出版社</th>
                            <th lay-data="{field:'experience',width:150 }">出版日期</th>
                            <th lay-data="{field:'experience',width:150 }">评分</th>
                            <th lay-data="{field:'tool', minWidth:80}">操作</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${products}" var="book">
                            <tr>
                                <td lay-data="{type:'checkbox'}" value="${book.id}">ID</td>
                                <td>${book.id}</td>
                                <td>${book.bookname}</td>
                                <td>${book.author}</td>
                                <td>${book.price}</td>
                                <td>${book.isbn}</td>
                                <td>${book.publicsource}</td>
                                <td>${book.date}</td>
                                <td>${book.score}</td>
                                <td>
                                    <a title="编辑"  href="editProduct?id=${book.id}&category_id=${categoryClass.id}">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a title="查看详情"  href="adminBookInfo?product_id=${book.id}">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>


                                    <c:choose>

                                        <c:when test="${categoryClass!= null}">
                                            <a title="删除"  href="deleteProduct?id=${book.id}&category_id=${categoryClass.id}">
                                                <i class="layui-icon">&#xe640;</i>
                                            </a>
                                        </c:when>
                                        <c:otherwise>
                                            <a title="删除"  href="deleteProduct?id=${book.id}&category_id=0">
                                                <i class="layui-icon">&#xe640;</i>
                                            </a>
                                        </c:otherwise>

                                    </c:choose>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script type="text/html" id="toolbarDemo">
    <div class = "layui-btn-container" >
        <button class = "layui-btn layui-btn-sm" lay-event = "getCheckData" > 获取选中行数据 </button>
        <button class="layui-btn layui-btn-sm" lay-event="getCheckLength">获取选中数目</button >
        <button class = "layui-btn layui-btn-sm" lay-event = "isAll" > 验证是否全选</button>
    </div >
</script>
<script type="text/html" id="switchTpl">
    <!-- 这里的checked的状态只是演示 -->
    <input type = "checkbox" name = "sex" value = "{{d.id}}" lay-skin = "switch"lay-text = "女|男" lay-filter = "sexDemo" {{ d.id == 10003 ? 'checked': ''}} >
</script>
<script>layui.use('laydate',
    function() {
        var laydate = layui.laydate;

        //执行一个laydate实例
        laydate.render({
            elem: '#start' //指定元素
        });

        //执行一个laydate实例
        laydate.render({
            elem: '#end' //指定元素
        });

    });</script>
<script>layui.use('table',
    function() {
        var table = layui.table;

        //监听单元格编辑
        table.on('edit(test)',
            function(obj) {
                var value = obj.value //得到修改后的值
                    ,
                    data = obj.data //得到所在行所有键值
                    ,
                    field = obj.field; //得到字段
                layer.msg('[ID: ' + data.id + '] ' + field + ' 字段更改为：' + value);
            });

        //头工具栏事件
        table.on('toolbar(test)',
            function(obj) {
                var checkStatus = table.checkStatus(obj.config.id);
                switch (obj.event) {
                    case 'getCheckData':
                        var data = checkStatus.data;
                        layer.alert(JSON.stringify(data));
                        break;
                    case 'getCheckLength':
                        var data = checkStatus.data;
                        layer.msg('选中了：' + data.length + ' 个');
                        break;
                    case 'isAll':
                        layer.msg(checkStatus.isAll ? '全选': '未全选');
                        break;
                };
            });
    });</script>
<script>var _hmt = _hmt || []; (function() {
    var hm = document.createElement("script");
    hm.src = "https://hm.baidu.com/hm.js?b393d153aeb26b46e9431fabaf0f6190";
    var s = document.getElementsByTagName("script")[0];
    s.parentNode.insertBefore(hm, s);
})();</script>

</html>
