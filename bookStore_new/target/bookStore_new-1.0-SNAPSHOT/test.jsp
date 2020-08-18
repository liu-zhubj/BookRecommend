<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%--
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>用户注册</title>
    <style type="text/css">
        h1{
            color:red;
            font-weight:bold;
            text-align:center;
            text-shadow:2px 2px 5px #FFFF00;
        }
        span{color:red }
    </style>
    <script type="text/javascript">
        function userMethod()
        {
            var user = document.getElementById("input_user").value;
            if(user.length>5||user.length<3)
            {
                document.getElementById("zhushi_user").style.color="red";
            }
            else document.getElementById("zhushi_user").style.color="green";
        }
        function passMethod()
        {
            var pass = document.getElementById("input_pass1").value;
            if(pass.length>12||pass.length<8)
            {
                document.getElementById("zhushi_pass1").style.color="red";
            }
            else document.getElementById("zhushi_pass1").style.color="green";
        }
        function passMethod2()
        {
            var pass1 = document.getElementById("input_pass1").value;
            var pass2 = document.getElementById("input_pass2").value;
            if(pass1!=pass2)
            {
                document.getElementById("zhushi_pass2").style.color="red";
            }
            else document.getElementById("zhushi_pass2").style.color="green";
        }
        function emailMethod()
        {
            var email = document.getElementById("input_email").value;
            var pattern = /^[a-zA-Z0-9#_\^\$\.\*\+\-\?\=\]+@[a-zA-Z0-9]+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/; //email的正则表达式
            if(!pattern.test(email))
            {
                document.getElementById("zhushi_email").style.color="red";
            }
            else
            {
                document.getElementById("zhushi_email").style.color="green";
            }
        }
        function phoneMethod()
        {
            var phone_num = document.getElementById("input_phone").value;
            var pattern = /^1[0-9]{10}$/;		//phone的正则表达式
            if(!pattern.test(phone_num))
            {
                document.getElementById("zhushi_phone").style.color="red";
            }
            else
            {
                document.getElementById("zhushi_phone").style.color="green";
            }
        }
        function provinceMethod()
        {
            var pro = document.getElementById("province").value;
            if(pro=="0")
            {
                document.getElementById("zhushi_province").style.color="red";

            }
            else
            {
                document.getElementById("zhushi_province").style.color="green";
            }
        }
        function nameMethod()
        {
            var name = document.getElementById("input_name").value;
            if(name.length>5||name.length<2)
            {
                document.getElementById("zhushi_name").style.color="red";

            }
            else
            {
                document.getElementById("zhushi_name").style.color="green";
            }
        }
        function checkAll(){
            userMethod();
            passMethod();
            passMethod2();
            emailMethod();
            provinceMethod();
            phoneMethod();
            nameMethod();
        }
    </script>
</head>
<body>
<h1>用户注册</h1>
<table align="center">
    <form method="get"  action="" target="rfFrame">
        <tr>
            <td><span style="vertical-align:super;">*</span>用户名：</td>
            <td >
                <input  type = "text" onBlur="userMethod()" id="input_user" style="width:330px;"></input>
            </td>
            <td id="zhushi_user">用户名由3-5个字符组成</td>
        </tr>
        <tr>
            <td><span style="vertical-align:super;">*</span>密码：</td>
            <td>
                <input  type = "password" onBlur="passMethod()" id="input_pass1"style="width:330px;"></input>
            </td>
            <td id="zhushi_pass1">请输入8-12位密码</td>
        </tr>
        <tr>
            <td><span style="vertical-align:super;">*</span>确认密码：</td>
            <td>
                <input  type = "password" onBlur="passMethod2()" id="input_pass2"style="width:330px;" ></input>
            </td>
            <td id="zhushi_pass2">两次密码不一致</td>
        </tr>
        <tr>
            <td><span style="vertical-align:super;">*</span>Email：</td>
            <td>
                <input  type = "text" onBlur="emailMethod()" id="input_email"style="width:330px;"></input>
            </td>
            <td id="zhushi_email">格式样例：XXXXXXX@163.com</td>
        </tr>
        <tr>
            <td><span style="vertical-align:super;">*</span>手机号码：</td>
            <td>
                <input  type = "text" onBlur="phoneMethod()" id="input_phone"style="width:330px;"></input>
            </td>
            <td id="zhushi_phone">格式样例：13866688000</td>
        </tr>
        <tr>
            <td><span style="vertical-align:super;">*</span>真实姓名：</td>
            <td >
                <input  type = "text" onBlur="nameMethod()" id="input_name" style="width:330px;"></input>
            </td>
            <td id="zhushi_name">由2-5个中文组成</td>
        </tr>
        <tr>
            <td><span style="vertical-align:super;">*</span>省份：</td>
            <td ><select name="省份" id=province onBlur="provinceMethod()">
                <option  value="0">-请选择-</option>
                <option  value="1">河南</option>
                <option  value="2">北京</option>
                <option  value="3">山东</option>
                <option  value="4">河北</option>
                <option  value="5">湖北</option>
                <option  value="6">湖南</option>
            </select>
            </td>
            <td id=zhushi_province>请选择省份!</td>
        </tr>
        <tr>
            <td><span style="vertical-align:super;">*</span>技术方向：</td>
            <td>
                <input name = "language" type = "checkbox" >Java</input>
                <input name = "language" type = "checkbox" >.Net</input>
                <input name = "language" type = "checkbox" >PHP</input>
                <input name = "language" type = "checkbox" >网页</input>
                <input name = "language" type = "checkbox" >IOS</input>
                <input name = "language" type = "checkbox" >Android</input>
            </td>
        </tr>
        <tr>
            <td colspan = "2" align = "center">
                <input type = "submit" name = "submit" onClick = "checkAll();" value = "注册"/>
                <input type = "reset" name = "reset" value = "重置"/>
            </td>
        </tr>
    </form>
    <iframe id="rfFrame" name="rfFrame" src="about:blank" style="display:none;"></iframe>
</table>
</body>
</html>--%>

Reg.html

<!DOCTYPE html>

<html>

<head>

    <style type="text/css">

        #title{color:#FF7B0B;font-size:20px;font-weight:bod;}

        #i{width:352px;height:15px;color:blue;font-size:12px;}

        table{text-align:left;}

        #t{text-align:right;}
    </style>

    <script language="javascript" src="Reg.js"></script>

    <meta name="keywords" content="keyword1,keyword2,keyword3">

    <meta name="description" content="this is my page">

    <meta name="content-type" content="textml; charset=GB18030">

    <title>注册页面</title>

    <script>

        function validate(){

            var name=document.forms[0].username.value;

            var pwd=document.forms[0].userpwd.value;

            var pwd1=document.forms[0].userpwd1.value;

            var age=document.forms[0].userage.value;

            var reg=/[a-zA-Z]\w*/;

            if(name.length<=0)alert("用户名不能为空！");

            else if(!reg.test(name))alert("用户名格式不正确！");

            else if(pwd.length<6)alert("密码长度必须大于等于6！");

            else if(pwd!=pwd1)alert("两次密码不一致！");

            else if(age<18||age>100)alert("年龄范围应该为18岁至100岁！")

            else document.forms[0].submit();

        }

    </script>

</head>

<body>
<hr>
<%=request.getContextPath()%>
<hr>
<%=request.getServletContext().getRealPath("/")%>
<hr>
<%=request.getRequestURI()%>
<form action="">

    <table border="0" align="center"width="600">

        <tr><td colspan="3" align="center" height="40"id="title">填写注册信息</td></tr>

        <tr><td align="right" id="t">用户名:*</td>

            <td><input type="text" name="username"/></td>

            <td id="i">请由字母开头，可由字母、数字或下划线组成！</td>

        </tr>

        <tr><td align="right" id="t">密码:*</td>

            <td><input type="password" name="userpwd"/></td>

            <td id="i">设置登录密码，至少六位！</td>

        </tr>

        <tr><td align="right" id="t">确认密码:*</td>

            <td><input type="password" name="userpwd1"/></td>

            <td id="i">请再次输入你的密码！</td>

        </tr>

        <tr><td align="right" id="t">性别:*</td>

            <td><input type="radio"name="usersex"value="男" checked/>男

                <input type="radio" name="usersex" value="女"/>女</td>

            <td id="i">请选择你的性别！</td>

        </tr>

        <tr><td align="right" id="t">年龄:*</td>

            <td><input type="text" name="userage"/></td>

        </tr>

        <tr><td align="right" id="t">邮箱地址:*</td>

            <td><input type="text" name="useremail"/>

            </td>

        </tr>

        <tr><td align="right" valign="top">基本情况:*</td>

            <td colspan="2">

                <textarea name="userbasicinfo"rows="5" cols="50"></textarea>

            </td>

        </tr>

        <tr><td colspan="3"align="center" height="40">

            <input type="Button" value="确认" onClick="validate()"/>

            <input type="reset"value="取消"/>

        </td>

        </tr>

    </table>

</form>
</body>
</html>
