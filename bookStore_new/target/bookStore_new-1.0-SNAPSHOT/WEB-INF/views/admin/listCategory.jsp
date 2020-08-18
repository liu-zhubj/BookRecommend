<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/4/26
  Time: 18:14
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
    <script type="text/javascript" src="https://cdn.bootcss.com/jquery/3.2.1/jquery.min.js"></script>
    <script src="../../../lib/layui/layui.js" charset="utf-8"></script>
    <script type="text/javascript" src="../../../js/xadmin.js"></script>
    <!-- 让IE8/9支持媒体查询，从而兼容栅格 -->
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
                    <form class="layui-form layui-col-space5" action="addCategory">
                        <div class="layui-input-inline layui-show-xs-block">
                            <input class="layui-input" placeholder="分类名" name="name"></div>
                        <div class="layui-input-inline layui-show-xs-block">
                            <button class="layui-btn" type="submit"><i class="layui-icon"></i>增加</button>
                        </div>
                    </form>
                    <hr>
                      </div>
              <%--  <div class="layui-card-header">
                   &lt;%&ndash; <button class="layui-btn layui-btn-danger" onclick="delAll()">
                        <i class="layui-icon"></i>批量删除</button>&ndash;%&gt;
                </div>--%>
                <div class="layui-card-body ">
                    <table class="layui-table layui-form">
                        <thead>
                        <tr>
                            <th width="20">
                                <input type="checkbox" name="" lay-skin="primary">
                            </th>
                            <th width="150">ID</th>
                            <th width="350">分类名</th>
                           <%-- <th width="50">图书管理</th>--%>
                            <th width="150">状态</th>
                            <th width="600">操作</th>
                        </thead>
                        <tbody class="x-cate">
                        <c:forEach items="${categories}" var="category">
                        <tr cate-id='1' fid='0' >
                            <td>
                                <input type="checkbox" name="" lay-skin="primary">
                            </td>
                            <td>${category.id}</td>
                            <td>
                                <i class="layui-icon x-show" status='true'>&#xe623;</i>
                                ${category.name}
                            </td>
                           <%-- <td><input type="text" class="layui-input x-sort" name="order" value="1"></td>--%>
                            <td>


                            </td>
                            <td class="td-manage">
                                <button class="layui-btn layui-btn layui-btn-xs"  ><i class="layui-icon">&#xe642;</i><a href="/admin/editCategory?id=${category.id}&name=${category.name}" >编辑</a></button>
                                <button class="layui-btn layui-btn-warm layui-btn-xs" ><i class="layui-icon">&#xe642;</i><a href="/admin/addCategoryredirt?id=${category.id}" >添加子栏目</a></button>
                               <a href="deleteCategory?id=${category.id}"}> <button class="layui-btn-danger layui-btn layui-btn-xs"  ><i class="layui-icon">&#xe640;</i>删除</button></a>
                            </td>
                        </tr>


                            <c:set var="cc" value="${category.id}" scope="session"></c:set>
                            <%
                                Integer category_id= (Integer) pageContext.findAttribute("cc");
                                String URL="jdbc:mysql://127.0.0.1:3306/bookstorm?useUnicode=true&amp;characterEncoding=utf-8";
                                String USER="root";
                                String PASSWORD="root";
                                //1.加载驱动程序
                                Class.forName("com.mysql.jdbc.Driver");
                                //2.获得数据库链接
                                Connection conn= DriverManager.getConnection(URL, USER, PASSWORD);
                                //3.通过数据库的连接操作数据库，实现增删改查（使用Statement类）
                                Statement st=conn.createStatement();
                                ResultSet rs=st.executeQuery("select * from category_class where category_id="+category_id);
                            %>


                            <% while(rs.next())
                            {
                            %>
                            <tr cate-id='2' fid='1' >
                                <td>
                                    <input type="checkbox" name="" lay-skin="primary">
                                </td>
                                <td>3</td>
                                <td>
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    ├ <%=rs.getString("category_className")%>
                                </td>
                                <td>
                                    <button class="layui-btn layui-btn layui-btn-xs"  ><i class="layui-icon">&#xe642;</i><a href="/admin/listProduct_class?id=<%=rs.getString("id")%>">该类图书管理</a> </button>                                </td>

                                <td class="td-manage">
                                    <button class="layui-btn layui-btn layui-btn-xs"  ><i class="layui-icon">&#xe642;</i><a href="/admin/editCategoryredirt?id=<%=rs.getString("id")%>">编辑</a> </button>
                                   <%-- <button class="layui-btn layui-btn-warm layui-btn-xs"  onclick="xadmin.open('编辑','admin-edit.html')" ><i class="layui-icon">&#xe642;</i>添加子栏目</button>--%>
                                    <button class="layui-btn-danger layui-btn layui-btn-xs"  ><i class="layui-icon">&#xe640;</i>  <a href="deleteCategory_class?id=<%=rs.getString("id")%>">删除</a></button>

                                    </td>
                            </tr>
                            <%
                                }
                            %>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
                <%--<div class="layui-card-body ">
                    <div class="page">
                        <div>
                            <a class="prev" href="">&lt;&lt;</a>
                            <a class="num" href="">1</a>
                            <span class="current">2</span>
                            <a class="num" href="">3</a>
                            <a class="num" href="">489</a>
                            <a class="next" href="">&gt;&gt;</a></div>
                    </div>
                </div>--%>
            </div>
        </div>
    </div>
</div>
<script>
    layui.use(['form'], function(){
        form = layui.form;

    });

    /*用户-删除*/
    function member_del(obj,id){
        layer.confirm('确认要删除吗？',function(index){
            //发异步删除数据
            $(obj).parents("tr").remove();
            layer.msg('已删除!',{icon:1,time:1000});
        });
    }

    // 分类展开收起的分类的逻辑
    //
    $(function(){
        $("tbody.x-cate tr[fid!='0']").hide();
        // 栏目多级显示效果
        $('.x-show').click(function () {
            if($(this).attr('status')=='true'){
                $(this).html('&#xe625;');
                $(this).attr('status','false');
                cateId = $(this).parents('tr').attr('cate-id');
                $("tbody tr[fid="+cateId+"]").show();
            }else{
                cateIds = [];
                $(this).html('&#xe623;');
                $(this).attr('status','true');
                cateId = $(this).parents('tr').attr('cate-id');
                getCateId(cateId);
                for (var i in cateIds) {
                    $("tbody tr[cate-id="+cateIds[i]+"]").hide().find('.x-show').html('&#xe623;').attr('status','true');
                }
            }
        })
    })

    var cateIds = [];
    function getCateId(cateId) {
        $("tbody tr[fid="+cateId+"]").each(function(index, el) {
            id = $(el).attr('cate-id');
            cateIds.push(id);
            getCateId(id);
        });
    }

</script>
</body>
</html>
