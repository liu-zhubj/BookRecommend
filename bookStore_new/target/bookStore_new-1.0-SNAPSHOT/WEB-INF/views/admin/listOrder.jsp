<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/26
  Time: 16:49
  To change this template use File | Settings | File Templates.
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
    <script src="js/jquery/2.0.0/jquery.min.js"></script>
    <script src="js/bootstrap/3.3.6/bootstrap.min.js"></script>
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
                    <form class="layui-form layui-col-space5" action="/admin/searchOrder">
                         <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="s" placeholder="请输入" autocomplete="off" class="layui-input"></div>
                        <div class="layui-inline layui-show-xs-block">
                            <button class="layui-btn" type="submit">
                                <i class="layui-icon">&#xe615;</i></button>
                        </div>
                    </form>
                </div>

                <div class="layui-card-header">
                   <%-- <button class="layui-btn layui-btn-danger" onclick="delAll()"><i class="layui-icon"></i>批量删除</button>--%>
                    <button class="layui-btn"<%--onclick="xadmin.open('添加用户','/add')"--%>><i class="layui-icon"></i><a href="/admin/add" >添加</a></button>
                </div>
                <script>
                    function delAll (argument) {
                        var ids = "";

                        // 获取选中的id
                        $('input[name="du1"]').each(function () {
                            var ooo=this.checked;
                            alert(ooo+"   pp");
                            if (this.checked==true) {
                                alert("lalala"+$(this).val());
                                ids += $(this).val() + "$";
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
                            <th lay-data="{type:'checkbox'}">ID</th>
                            <%--    <th> <input type="checkbox" name="du1" value="" style="border: 1px solid"></th>--%>
                            <th lay-data="{field:'id', width:80, sort: true}">ID</th>
                            <th lay-data="{field:'username', width:120, sort: true}">订单号</th>
                            <th lay-data="{field:'email', minWidth: 60}">订单金额</th>
                            <th lay-data="{field:'sex', width:70}">收货人</th>
                            <th lay-data="{field:'city', width: 70}">收货地址</th>
                            <th lay-data="{field:'experience' }">订单状态</th>
                            <th lay-data="{field:'a' }">创建时间</th>
                            <th lay-data="{field:'ab'}">支付时间</th>
                            <th lay-data="{field:'c' }">发货时间</th>
                            <th lay-data="{field:'d' }">确认收货时间</th>
                            <th lay-data="{field:'tool', width:80}">操作</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${orders}" var="o">
                            <tr>

                                <td lay-data="{type:'checkbox'}" value="${o.id}">ID</td>
                                <td>${o.id}</td>
                                <td>${o.order_code}</td>
                                <td>${o.total}</td>
                                <td>${o.receiver}</td>
                                <td>${o.address}</td>
                                <td>${o.status}</td>
                                <td>${o.create_date}</td>
                                <td>${o.pay_date}</td>
                                <td>${o.delivery_date}</td>
                                <td>${o.confirm_date}</td>
                                <td>
                                    <c:if test="${o.status=='waitDelivery'}">
                                        <a href="orderDelivery?order_id=${o.id}">
                                            <button class="btn btn-primary btn-xs">发货</button>
                                        </a>
                                    </c:if>
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