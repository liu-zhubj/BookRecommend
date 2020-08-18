<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core_1_1" %>

<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/30
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@include file="include/header_1.jsp" %>
<%@include file="include/top.jsp" %>
<%@include file="include/search.jsp"%>--%>
<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/30
  Time: 17:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header_1.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/search.jsp"></jsp:include>
<html>
<head>
    <title>Title</title>
</head>
<style>
    .address{

        left: 0;
        right:0;
        margin: 0 auto;
        height: 300px;
        width: 98%;
        border:groove;

        margin-top:15px ;
    }
    .myadd{
        float: left;
        margin-left: 20px;
        height: 150px;
        width: 200px;
        border: 2px solid grey;
    }
    .td1{
        text-align: center;
        line-height: 4;
    }
    .center_td{
        left: 0;
        right:0;
        margin: 0 auto;
        text-align:center ;
    }
    .money{
        font-size: 20px;
        color: #888;
        text-align: right;
        line-height: 36px;
        margin-left: 30px;
    }
    .submitt{
        margin-left: 20px;
        width: 170px;
        height: 60px;
        background-color: #b8494a;
        text-align: center;
        color: #fff;
        font-size: 20px;
        margin-top: 18px;
        cursor: pointer;
        float: right;
    }
    hr{
        width: 2px;
    }
</style>
<body>
<script>



    $(document).ready(function () {
        totalPrice();



        /*00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000*/
        $(".myadd").click(function () {
            /*var aid=$("input[aid='1']").val()*/

            var aid=$(this).find("input[aid='1']").val()


            var are=$(this).find("input[are='1']").val()
            var aus=$(this).find("input[aus='1']").val()
            var aad=$(this).find("input[aad='1']").val()
            var amo=$(this).find("input[amo='1']").val()
            $("input[aid1='1']").val(aid);
            $("input[are1='1']").val(are);
            $("input[aus1='1']").val(aus);
            $("input[aad1='1']").val(aad);
            $("input[amo1='1']").val(amo);

           /* var params = "";
            $("input[type='checkbox']").each(function(){
                if ($(this).checked) {
                    var orderItemId = $(this).attr("orderItemId");
                    params += "&orderItemId=" + orderItemId;
                }
            });
            params = params.substring(1);
            location.href = "buy?" + params;*/
        });




    })
    function totalPrice() {
        var zong=0;
        $(".xiaojiprice").each(function () {

            var all=parseInt($(this).text());
            zong+=all;
        })
        $("#sum").text(zong);
    }
</script>
<%--收货地址部分--%>
<form action="createOrder" method="post">
<div class="address" style="font-family: 华文楷体">
    <h2>选择收货地址</h2>
    <div hidden>
    <input  type="text" value="1" aid1="1" name="address_id">
    <input type="text" value="2" are1="1" name="receiver">
    <input type="text" value="2" aus1="1" name= "user_id">
    <input type="text" value="2" aad1="1" name="address">
    <input type="text" value="2" amo1="1" name="mobile">
    </div>

    <c:forEach items="${addressList}" var="address">

        <div class="myadd">
            <div hidden>
            <input type="text"  amo="1" value="${address.phone}">
            <input type="text"  aad="1" value="${address.province}${address.city}${address.district}${address.address}">
            <input type="text"  aus="1" value="${address.userid}  ">
            <input type="text" are="1"  value="${address.name}">
            <input type="text"  aid="1" value="${address.id}">
        </div>
            <span style="float: left;color: black;margin-top: 10px">${address.name}</span>
            <span style="float: right;color: black;margin-top: 10px">${address.phone}</span>
            <br>
            <br>
            <div style="border: 1px solid gainsboro"></div>
            <div style="margin-top: 10px;height: 80px">
                    ${address.province}${address.city}${address.district}${address.address}
            </div>

        </div>
    </c:forEach>


</div>
<%--商品部分--%>
<div class="adress" style="font-family: 华文楷体">
    <h2>确认订单信息</h2>
    <div>
        <table style="left: 0;right:0;margin: 0 auto; width: 98%;table-layout: fixed;border-collapse: collapse">
            <tr style="border: 1px solid">
                <td style="width: 40%" class="td1">书籍</td>
                <td style="width: 15%" class="td1">单价</td>
                <td style="width: 10%" class="td1">数量</td>
                <td style="width: 15% " class="td1">小计</td>
                <td style="width: 10%" class="td1">其他</td>
            </tr>
            <c:forEach items="${orderItems}" var="oi">


            <%--循环商品--%>
            <tr>
                <td colspan="5">
                    <p style="margin: 15px auto 25px 27px;font-size: 20px " >订单</p>
                    <div style="border-bottom: 1px ridge ;" ></div>
                </td>
            </tr>
            <tr style="height: 200px ;border-bottom:1px dashed ">
                <td style="overflow: hidden;text-overflow: ellipsis;"><%--图片--%>
                    <div style="float: left">
                        <img src="${oi.bookNew.image}" style="margin-left: 10px;margin-top:10px;width: 160px;height: 175px" referrerpolicy="no-referrer"></div>
                    <div style="float: left;margin-left: 10px;margin-top:10px;width:65%;height:180px">
                        <p style="margin-top: 25px">书的名字:${oi.bookNew.bookname}</p>
                        <p >书的简介:${oi.bookNew.bookinfo} </p>
                    </div>
                </td>
                <td  class="td1"><%--单间--%>
                    ${oi.bookNew.price}
                </td>
                <td class="td1"><%--数量--%>
                    ${oi.number}
                </td>
                <td class="td1 xiaojiprice" ><%--小计--%>
                    ${oi.bookNew.price*oi.number}
                </td>
                <td class="td1"><%--其他--%>
                    待支付
                </td>
            </tr>
            <tr style="height: 20px">

            </tr>
            <tr >

                <td colspan="5" style="height: 47px;">
                    <input placeholder="给商家留言:" type="text" style="width: 100%;height: 100%;background-color:gainsboro;border: 1px solid">
                </td>
            </tr>
            <tr style="height: 20px">

            </tr>
            <tr >

                <td colspan="5"  style="height: 47px;border: groove">
                    <span style="margin-left: 70%;color: red">运费：￥0.00</span>
                   <span style="margin-left: 10%; color: red" class=""> 合计:${oi.bookNew.price*oi.number}</span>
                </td>
            </tr>
            </c:forEach>
        </table>
        <br>
        <hr>
        <br>
        <p class="money">共${orderItems.size()}件商品  商品总金额：<span style="color: black" id="sum"></span>

        </p>
        <button class="submitt" type="submit">
            提交订单
        </button>
    </div>
    <br>

</div>
</form>


</body>
</html>
