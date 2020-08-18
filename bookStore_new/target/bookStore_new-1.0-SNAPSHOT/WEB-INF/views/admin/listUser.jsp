<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="th" uri="http://www.springframework.org/tags/form" %>
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
    <script src="../../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../js/xadmin.js"></script>
    <script type="text/javascript" src="../../../js/jquery/2.0.0/jquery.min.js"></script>
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
                    <form class="layui-form layui-col-space5" action="/admin/searchUser">
                         <div class="layui-inline layui-show-xs-block">
                            <input type="text" name="s" placeholder="请输入用户名" autocomplete="off" class="layui-input"></div>
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
        var noList = new Array();
        // 获取选中的id
        $('tbody input:checked').each(function() {
            alert("ooooooo"+$(this).attr("value"));

                /*noList.push($(this).attr("userId"));*/

        });
        alert("abbbbb"+noList);
       /* $('tbody input').each(function(index, el) {
            if($(this).prop('checked')){
                alert("alalalalla");
                noList.push($(this).value);
            }
        });*/

        if (noList.length == 0) {
            layer.open({
                title: '提示',
                content: '请选择删除信息'
            });
            return false;
        }
        layer.confirm('确定要全部删除吗？'+noList, {
            time: 20000, //20s后自动关闭
            btn: ['确定', '取消'],
            yes: function (index) {
                layer.close(index);

                $.ajax({
                    type: 'POST',
                    url: '/admin/deleteAllUser',
                    data: {'noList': noList},
                    dataType: 'json',
                    success: function (data) {
                        if (data.state == "1") {
                            layer.msg('已删除!', {
                                icon: 1, time: 1000, end: function () {
                                    window.location.reload();
                                }
                            });
                        } else {
                            layer.msg('删除失败', {
                                icon: 1, time: 1000, end: function () {
                                    window.location.reload();
                                }
                            });
                        }
                    }
                });
            }
        });

       /* var ids = "";
        var params = "";

        // 获取选中的id
        $('tbody input').each(function() {
            if($(this).prop('checked')){
                alert($(this).parentNode+"  "+$(this).text()+"kkk");
                        var userId = $(this).val();
                        params += "&userId=" + userId;

                /!*ids.push($(this).val())*!/
            }
        });

        layer.confirm('确认要删除吗？'+params.toString(),function(index){
            //捉到所有被选中的，发异步进行删除
            params = params.substring(1);
            location.href = "deleteAllUser?" + params;
            //layer.msg('删除成功', {icon: 1});
           // $(".layui-form-checked").not('.header').parents('tr').remove();
        });*/
    }
</script>

                <div class="layui-card-body ">
                    <table class="layui-table layui-form" lay-data="{page:true,toolbar: '#toolbarDemo',id:'test'}" lay-filter="test">
                        <thead>
                        <tr>
                            <th lay-data="{type:'checkbox'}">ID</th>
                            <th lay-data="{field:'id', width:80, sort: true}">ID</th>
                            <th lay-data="{field:'username', width:120, sort: true}">用户名</th>
                            <th lay-data="{field:'email',minWidth: 170}">邮箱</th>
                            <th lay-data="{field:'sex', width:80}">性别</th>
                            <th lay-data="{field:'city',width: 80}">年龄</th>
                            <th lay-data="{field:'experience',width:150 }">电话</th>
                            <th lay-data="{field:'tool', minWidth:80}">操作</th></tr>
                        </thead>
                        <tbody>
                        <c:forEach items="${users}" var="u">
                            <tr>
                                <td ><input type="checkbox" name="noiddel" value="11" />1</td>
                                 <%-- <td lay-data="{type:'checkbox'}" userId="11">1</td>--%>
                                <td>${u.id}</td>
                                <td>${u.name}</td>
                                <td>${u.email}</td>
                                <td>${u.gender}</td>
                                <td>${u.age}</td>
                                <td>${u.phone}</td>
                                <td>
                                    <a title="编辑"  href="/admin/editUser?id=${u.id}">
                                        <i class="layui-icon">&#xe642;</i>
                                    </a>
                                    <a title="删除"  href="/admin/deleteUser?id=${u.id}">
                                        <i class="layui-icon">&#xe640;</i>
                                    </a>
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
<script>
    layui.use(['layer','jquery','table','form'],
    function() {
        var form = layui.form;
        var layer = layui.layer;
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