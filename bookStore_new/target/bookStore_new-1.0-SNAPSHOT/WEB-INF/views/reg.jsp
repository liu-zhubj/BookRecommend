<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" isELIgnored="false" %>


<%@include file="include/header.jsp" %>

<!DOCTYPE html>
<html lang="en" class="no-js">
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆界面</title>
    <link rel="stylesheet" type="text/css" href="../static/css/normalize.css"/>
    <link rel="stylesheet" type="text/css" href="../static/css/demo.css"/>
    <!--必要样式-->
    <link rel="stylesheet" type="text/css" href="../static/css/component.css"/>
    <!--[if IE]>
    <script src="js/html5.js"></script>
    <![endif]-->
</head>


<body>

<style>
    .header {
        padding: 22px 0px;
        height: 88px;
        width: 1190px;
        margin: auto;
    }

    a {
        text-decoration: none;
    }

    .header .tm-logo {
        margin-top: 8px;
        width: 190px;
    }

    #mallPage, #mallPage.mallChn {
        width: auto;
        min-width: 990px;
        background-color: transparent;
    }
</style>


<style>
    .content {
        /*position: relative;
        width: 100%;
        margin-bottom: 40px;*/

        width: 100%;
        height: 100%;
        background: url(/img/temp/20.jpg) no-repeat;
        background-size: 100% 100%;

    }

    .login-banner-wrap img {
        display: block;
        margin: auto;
    }

    .content .form {
        display: none;
        position: absolute;
        top: 91px;
        right: 60px;
        background: #fff;
    }

    .form-inner {
        padding: 25px 26px 20px;
        width: 350px;
        height: 450px;
    }

    .static-form {
        display: block;
        position: relative;
    }

    .login-title {
        height: 18px;
        line-height: 18px;
        font-size: 16px;
        color: #3c3c3c;
        margin-top: 19px;
        padding-bottom: 8px;
        font-weight: 700;
    }

    .field {
        margin-top: 25px;
        position: relative;
    }

    div.field {
        border: 1px solid #CBCBCB;
        margin: 20px 0px;
    }

    div.field span.loginInputIcon {
        margin: 0px;
        background-color: #CBCBCB;
        width: 40px;
        height: 40px;
        display: inline-block;
    }

    span.loginInputIcon span.glyphicon {
        font-size: 22px;
        position: relative;
        left: 9px;
        top: 9px;
        color: #606060;
    }

    div.field input {
        display: inline-block;
        border: 0px solid transparent;
        width: 244px;
        height: 30px;
        position: relative;
        left: 6px;
        top: 6px;
    }

    button.redButton {
        color: white;
        background-color: #FF0036;
        font-size: 16px;
        font-weight: 700;
        height: 42px;
        line-height: 42px;
        vertical-align: middle;
        width: 300px;
        border-radius: 3px;
        border: 0;
    }

    button.redButton:hover {
        background-color: rgba(255, 0, 54, .8);
    }



    #i{height:15px;color:blue;font-size:13px;width: 180px}

    table{text-align:left;}

    #t{text-align:right;
        width:95px;
        font-size:18px;
        font-family: 华文楷体;
    }
</style>
<script>
    $(function(){

        <c:if test="${!empty msg}">
        $("span.errorMessage").html("${msg}");
        $("div.loginErrorMessageDiv").show();
        </c:if>

        $("form.loginForm").submit(function(){
            if(0==$("#name").val().length||0==$("#password").val().length){
                $("span.errorMessage").html("请输入账号密码");
                $("div.loginErrorMessageDiv").show();
                return false;
            }
            return true;
        });

        $("form.loginForm input").keyup(function(){
            $("div.loginErrorMessageDiv").hide();
        });
    })



    function validate(){

        var name=document.forms[0].name.value;

        var pwd=document.forms[0].password.value;

        var pwd1=document.forms[0].password1.value;

        var age=document.forms[0].age.value;

        var reg=/[a-zA-Z]\w*/;

        if(name.length<=0)alert("用户名不能为空！");

        else if(!reg.test(name))alert("用户名格式不正确！");

        else if(pwd.length<6)alert("密码长度必须大于等于6！");

        else if(pwd!=pwd1)alert("两次密码不一致！");

        else if(age<1||age>100)alert("年龄范围应该为1岁至100岁！")

        else document.forms[0].submit();

    }

</script>
<div class="content">
    <%--<div class="login-banner-wrap" style="width: 100%; background-color: rgb(223, 226, 231);" title="">
        <div class="inner">
            <img src="/img/temp/19.jpg">
        </div>
    </div>--%>

    <div class="form" style="display: block; right: 80.5px;">
        <div class="form-inner" STYLE="width: 450px">
            <div class="static-form">
                <div class="loginErrorMessageDiv" style="display: none;">
                    <div class="alert alert-danger" >
                        <button type="button" class="close" data-dismiss="alert" aria-label="Close"></button>
                        <span class="errorMessage"></span>
                    </div>
                </div>
                <div class="login-title" style="margin-bottom: 20px;font-size: 21px;"><b>用户注册</b></div>

                <form action="/register" class="loginForm" method="post" >

                    <table border="0" align="center"width="400px">
                        <tr ><td align="right" id="t">用户名:*</td>
                            <td style="width:70px;"><input type="text" name="name" /></td>
                            <td id="i">由字母开头</td>
                        </tr>
                        <tr style="height:10px;">
                        </tr>
                        <tr><td align="right" id="t">密码:*</td>
                            <td><input type="password" name="password"/></td>
                            <td id="i">设置登录密码，至少六位！</td>
                        </tr>
                        <tr style="height:10px;">
                        </tr>
                        <tr><td align="right" id="t">确认密码:*</td>
                            <td><input type="password" name="password1"/></td>
                            <td id="i">请再次输入你的密码！</td>
                        </tr>
                        <tr style="height:10px;">
                        </tr>
                        <tr><td align="right" id="t">性别:*</td>
                            <td><input type="radio"name="gender"value="男" checked/>男
                                <input type="radio" name="gender" value="女"/>女</td>
                            <td id="i">请选择你的性别！</td>
                        </tr>
                        <tr style="height:10px;">
                        </tr>
                        <tr><td align="right" id="t">年龄:*</td>
                            <td><input type="text" name="age"/></td>
                        </tr>
                        <tr style="height:10px;">
                        </tr>
                        <tr><td align="right" id="t">邮箱地址:</td>
                            <td><input type="text" name="email"/>
                            </td>
                        </tr>
                        <tr style="height:10px;">
                        </tr>
                        <tr><td align="right" id="t">电话:</td>
                            <td><input type="text" name="phone"/>
                            </td>
                        </tr>
                        <tr style="height:5px;">
                        </tr>
                        <tr>
                            <td colspan="3"align="center"  >
                                <button   onClick="validate()" style="background-color:red;width:360px;height:42px;color: whitesmoke">注 册</button>
                        </td>
                        </tr>
                    </table>
                    <div style="margin-top: 20px;">
                        <a href="/login_new" class="pull-right">登录</a>
                    </div>

                </form>




            </div>
        </div>
    </div>
</div>


</body>
</html>
