<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/27
  Time: 13:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html class="x-admin-sm">

<head>
    <meta charset="UTF-8">
    <title>后台管理-添加图书</title>
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
    <h2 style="font-family: 华文楷体;margin-left: 20px;margin-top: 10px">添加图书</h2>
</div>

        <form  action="/admin/addProductByCategory">
            <div class="layui-form-item">

                <label  class="layui-form-label">
                    图片url
                </label>
                <div class="layui-input-inline">
                    <input type="text" hidden name="image" class="layui-input" >
                </div>
            </div>
            <%--<div class="layui-form-item">
                <label  class="layui-form-label">

                </label>
                <div class="layui-input-inline">
                    <img src="${product.image}" style="width: 40px;height: 70px">
                </div>

            </div>--%>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    图书名
                </label>
                <div class="layui-input-inline">
                    <input type="text" id="name" name="bookname" class="layui-input"  >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    作者
                </label>
                <div class="layui-input-inline">
                    <input type="text"  name="author" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    价格
                </label>
                <div class="layui-input-inline">
                    <input type="text"  name="price" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    ISBN
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="isbn" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    出版社
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="publicsource" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    出版日期
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="date" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    评分
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="score" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    页数
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="pages" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    销量
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="salenumber" class="layui-input">
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    库存
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="storenumber" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    译者
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="translator" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    当前价格
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="currentPrice" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                 目录
                </label>
                <div class="layui-input-inline">
                    <input type="text" name="catalog" class="layui-input" >
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    作者简介
                </label>
                <div class="layui-input-inline">
                    <textarea type="text"  name="authorIntroduction" style="width: 200px;height: 60px;background-color: white" ></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    图书简介
                </label>
                <div class="layui-input-inline">
                    <textarea type="text"  name="bookinfo" style="width:200px;height: 60px;background-color: white" ></textarea>
                </div>
            </div>
            <div class="layui-form-item">
                <label  class="layui-form-label">
                    标签
                </label>
                <div class="layui-input-inline">
                    <textarea type="text"  name="label" style="width:200px;height: 60px;background-color: white"></textarea>
                </div>
            </div>

            <c:choose>

                <c:when test="${categoryClass_id!= null}">
                    <input hidden name="classId" value="${categoryClass_id}">
                    <input hidden name="category_id" value="${categoryClass_id}">
                </c:when>
                <c:otherwise>
                    <div >
                        <label  class="layui-form-label">
                            选择所属分类
                        </label>
                        <div >
                            <select name="classId" style="height: 35px">
                                    <%--  <option value="${categoryclass.categoryId}"  selected>选择所属分类</option>--%>
                                <c:forEach items="${categoryClasses}" var="c">
                                    <option value="${c.id}"  >${c.categoryClassname}</option>
                                </c:forEach>
                            </select>
                            <input hidden name="category_id" value="0">
                        </div>
                    </div>
                </c:otherwise>

            </c:choose>
            <input hidden name="numberOfPeople" value="123">
            <div class="layui-form-item">
                <button  class="layui-btn" type="submit">
                   添加
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

