<%--suppress JSAnnotator --%>
<%--suppress ALL --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
<%
    request.getRequestDispatcher("/home_book").forward(request, response);
%>--%>

<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 2020/3/28
  Time: 16:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:include page="/WEB-INF/views/include/header_1.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/top.jsp"></jsp:include>
<jsp:include page="/WEB-INF/views/include/search.jsp"></jsp:include>

<html>
<head>

    <link rel="stylesheet" type="text/css" href="css/public.css"/>
    <link rel="stylesheet" type="text/css" href="css/proList.css"/>
    <title>Title</title>
    <script src="js/echarts.min.js"></script>
    <style>
        .book
        {
            width:70%;
            height: 250px;
            border: groove;

            margin-left: 15%;
            margin-top: 20px;
            z-index: 1;
        }
        .book_date
        {
            width:70%;
            height: 250px;
            border: groove;

            margin-left: 15%;
            margin-top: 20px;
            z-index: 2;
        }
        .book_info
        {
            width:70%;
            height: 300px;
            border: groove;

            margin-left: 15%;
            margin-top: 20px;
            overflow: hidden;
        }
        .book_info:hover{
            overflow: visible;
        }
        .book_like
        {
            width:70%;
            height: 250px;
            border: groove;

            margin-left: 15%;
            margin-top: 20px;
        }
        .book_comment
        {
            width:70%;
            height: 50px;
            line-height:30px;;
            margin-left: 15%;
            margin-top: 20px;
            border-bottom: groove grey;
        }
        .book_c{
            width: 70%;
            height: 130px;
            margin-left: 15%;
            margin-top: 20px;
            border: groove;
        }
        .book_title{
            height: 30px;
            background-color:gainsboro;
            border: groove;
            line-height:30px;;
        }
        .cn{
            float: left;
        }
        .book.book_image{

           margin-top: 20px;
            weigh:60px;
            height: 210px;

            margin-right: 10px;

        }
        .book_image p{
            margin-top: 15px;
            line-height: 1;
            font-size: 10px;
        }
        /*五角星评分*/
        .cleanfloat::after{
            display: block;
            clear: both;
            content:"";
            visibility: hidden;
            height: 0;}/*清浮动*/
        ul li{
            list-style:none;
            float:left;
            font-size:20px;
            margin:1px;
            color:#f00;
            cursor:pointer;}/*五角星样式*/
        /* .hs,.cs{color:#f00;}!*五角星点击后样式*!*/
        .wu{
            list-style:none;
            float:left;
            font-size:7px;
            color:#f00;
            cursor:pointer;
        }

        .buy {
            color: #b8494a;

            /*padding-left: 27px;
            padding-right: 27px;*/
        }
        .button {
           /* margin-top:40px;*/

            display: inline-block;
            line-height: 2;
            width: 170px;
            white-space: nowrap;
            cursor: pointer;
            background: #fff;
            border: 1px solid #dcdfe6;
            color: #606266;
            -webkit-appearance: none;
            text-align: center;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
            outline: 0;
            margin: 0;
            -webkit-transition: .1s;
            transition: .1s;
            font-weight: 500;
            -moz-user-select: none;
            -webkit-user-select: none;
            -ms-user-select: none;
            padding: 12px 20px;
            font-size: 20px;
            border-radius: 4px;
            /*border:groove;*/
        }
        .score{
            float:left;
            width:400px;
            height: 200px;
        }

        input[type=number] {
            -moz-appearance:textfield;
        }
        input[type=number]::-webkit-inner-spin-button,
        input[type=number]::-webkit-outer-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        .overppp{
            margin-top: 10px;
            font-family: 华文楷体;
            font-size: 15px;
        }


    </style>
    <script type="text/javascript" src="http://www.bcty365.com/statics/js/bcty365_js/jquery.min.js"></script>
</head>
<body>
<script>
    $(function() {

        <c:if test="${!empty msg}">
        alert("lalal");
        alert(${msg});
        </c:if>


        $(".add").click(function() {
            var stock= $(this).parent().parent().find('input[class*=stock]');
            var t = $(this).parent().find('input[class*=text_box]');
            if(t.val()==""||undefined||null){
                t.val(0);
            }

            t.val(parseInt(t.val()) + 1)
            if(t.val()>=stock){
                t.val(5);
            }
            setTotal();
        })
        $(".min").click(function() {
            var t = $(this).parent().find('input[class*=text_box]');
            if(t.val()==""||undefined||null){
                t.val(0);
            }
            t.val(parseInt(t.val()) - 1)
            if(parseInt(t.val()) < 0) {
                t.val(0);
            }
            setTotal();
        })
        $(".text_box").keyup(function(){
            var t = $(this).parent().find('input[class*=text_box]');
            if(parseInt(t.val())==""||undefined||null || isNaN(t.val())) {
                t.val(0);
            }
            setTotal();
        })
        function setTotal() {
            var s = 0;
            $("#tab td").each(function() {
                var t = $(this).find('input[class*=text_box]').val();
                var p = $(this).find('span[class*=price]').text();
                if(parseInt(t)==""||undefined||null || isNaN(t) || isNaN(parseInt(t))){
                    t=0;
                }
                s += parseInt(t) * parseFloat(p);
            });
            $("#total").html(s.toFixed(2));
        }
        setTotal();
    })


    function buyLink() {
        // noinspection JSAnnotator
        window.location = "/buyone?product_id="+${product.id}+
        "&number=" + $("#number").val();
    }
    function addcart() {
        // noinspection JSAnnotator
        window.location = "/addCart?product_id="+${product.id}+
        "&num=" + $("#number").val();
    }
</script>
<div class="book">
    <div class="book_title">图书详情</div>
    <img src="${product.image}" class="cn " style="width: 170px;height: 180px" referrerpolicy="no-referrer">
    <div class="cn book_image" style="width: 250px;margin-left: 10px">
        <p>书名：${product.bookname}</p>
        <p>ISBN：${product.isbn}</p>
        <p>作者：${product.author}</p>
        <p>类别：${product.label}</p>
        <p>出版社：${product.publicsource}</p>
        <p>出版日期：${product.date}</p>

    </div>
    <div class="score" >
        <div>
        <ul class="cleanfloat">
            <li style="color: black "><b>评分：</b></li>
            <c:forEach begin="1" end="5" step="1">
                <li>&#9733;</li>
            </c:forEach>
        </ul>
        </div>
        <table id="tab" style="margin-top: 20px;margin-left: 10px">
            <tr>
                <td  style="font-family: 华文楷体">
                    <span style="margin-left: 20px">单价:</span><span class="price">${product.price}</span>
                    <b style="font-size: 20px">数量</b>：<input class="min" name="" type="button" value="-" />
                   <input class="stock" value="5" hidden type="number" name="">
                    <input class="text_box" id="number" name="number" type="number" value="1" placeholder="0" style="width: 30px"/>
                    <input class="add" name="" type="button" value="+" />
                    <input hidden name="product_id" value="${product.id}">
                </td>
            </tr>
        </table>
        <div style="margin-top: 20px">
        <input  type="submit" class="button" onclick="javascript:buyLink()" value="立即购买">
            <button   onclick="javascript:addcart()" class="button addcart" style="margin-left: 40px;
             background-color: red;color: white" type="button" >加入购物车
            </button>
        </div>


    </div>

</div>

<div class="book_date" >
    <div class="book_title">评分数据表 ${couts[0]},${couts[1]},${couts[2]},${couts[3]},${couts[4]}</div>
    <div id="main"  style="width: 350px; height:190px;float: left "></div>
    <div id="main1"    style="width: 450px; height:220px;float: right;"></div>
    <script>

        var myChart1 = echarts.init(document.getElementById('main1'));
        option = {
            title: {
                text: '各评分人数占比雷达图',
                left:'left'

            },
            tooltip: {
                trigger: 'axis'
            },
            radar: [
                {
                    indicator: [
                        {text: '力荐', max:15},
                        {text: '推荐', max: 15},
                        {text: '很好', max: 15},
                        {text: '较差', max: 15},
                        {text: '很差', max: 15}
                    ],
                    center: ['50%', '55%'],
                    radius: 80
                }


            ],
            series: [
                {
                    type: 'radar',
                    tooltip: {
                        trigger: 'item'
                    },
                    areaStyle: {},
                    data: [
                        {
                            value: [${couts[0]}, ${couts[1]}, ${couts[2]}, ${couts[3]},${couts[4]}],
                            name: '某软件'
                        }
                    ]
                }
            ]
        };
        myChart1.setOption(option);

    </script>



    <script>



        var myChart = echarts.init(document.getElementById('main'));


        var data = genData(50);
        var c=new Array();
        c.push(${couts[0]})
        var c1=${couts[0]};
        var c2=${couts[1]};
        var c3=${couts[2]};
        var c4=${couts[3]};
        var c5=${couts[4]};

        option = {
            title: {
                text: '各评分占比饼图',
                subtext: '',
                left: 'center'
            },
            tooltip: {
                trigger: 'item',
                formatter: '{a} <br/>{b} : {c} ({d}%)'
            },
            legend: {
                type: 'scroll',
                orient: 'vertical',
                right: 10,
                top: 20,
                bottom: 20,
                data: data.legendData,

                selected: data.selected
            },
            series: [
                {
                    name: '姓名',
                    type: 'pie',
                    radius: '60%',
                    center: ['40%', '60%'],
                    data: data.seriesData,
                    emphasis: {
                        itemStyle: {
                            shadowBlur: 10,
                            shadowOffsetX: 0,
                            shadowColor: 'rgba(0, 0, 0, 0.5)'
                        }
                    }
                }
            ]
        };
        myChart.setOption(option);



        function genData(count) {
            var nameList = [
                '很差','较差', '很好', '推荐','力荐'
            ];
            var legendData = [];
            var seriesData = [];
            var selected = {};
            for (var i = 0; i < 5; i++) {
                var v;
                if (i==0){
                    v=${couts[0]};
                }
                if (i==1){
                    v=${couts[1]};
                }
                if (i==2){
                    v=${couts[2]};
                }
                if (i==3){
                    v=${couts[3]};
                }
                if (i==4){
                    v=${couts[4]};
                }


                var j=parseInt(i);
                name =nameList[i];
                legendData.push(name);
                seriesData.push({
                    name: name,
                    value: v
                });
                selected[name] = i < 6;

            }

            return {
                legendData: legendData,
                seriesData: seriesData,
                selected: selected
            };
        }



    </script>



</div>
<%--&lt;%&ndash;作品信息&ndash;%&gt;--%>

<div class="book_info">
    <div class="book_title">作品信息</div>
    <p class="overppp" ><b>作者简介</b>：${product.authorIntroduction}</p>
<br>
    <p class="overppp"><b>书籍简介</b>：${product.bookinfo}</p>

</div>

<div class="introMsg wrapper clearfix">
    <div class="msgL fl" style="width: 900px">
        <div class="msgTit clearfix">

            <a class="on">所有评价</a>
        </div>
        <div  >

            <div class="eva" style="font-family: 华文楷体">

<c:forEach items="${reviews}" var="r">
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per02.jpg">
                    <div class="perR fl">
                        <p>${r.user.name}</p>
                        <p>${r.content}不好意思评价晚了，书很好，价格便宜，发货快，包装好，全5分</p>
                       <%-- <div class="clearfix">
                            <p><img src="img/temp/eva01.jpg"></p>
                            <p><img src="img/temp/eva02.jpg"></p>
                            <p><img src="img/temp/eva03.jpg"></p>
                            <p><img src="img/temp/eva04.jpg"></p>
                            <p><img src="img/temp/eva05.jpg"></p>
                        </div>--%>
                        <p><span>${r.publicDate}</span><span>数量：1</span></p>
                    </div>
                </div>
</c:forEach>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per02.jpg">
                    <div class="perR fl">
                        <p>么***周</p>
                        <p>包装也很好，绝对不会磕碎碰坏，好评！</p>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per01.jpg">
                    <div class="perR fl">
                        <p>馨***呀</p>
                        <p>不好意思评价晚了，产品很好，发货快，包装好，全5分</p>
                        <div class="clearfix">
                            <p><img src="img/temp/eva01.jpg"></p>
                            <p><img src="img/temp/eva02.jpg"></p>
                            <p><img src="img/temp/eva03.jpg"></p>
                            <p><img src="img/temp/eva04.jpg"></p>
                            <p><img src="img/temp/eva05.jpg"></p>
                        </div>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per02.jpg">
                    <div class="perR fl">
                        <p>么***周</p>
                        <p>不好意思评价晚了，产品很好，价格便宜，没有杂色，发货快，包装好，全5分</p>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per01.jpg">
                    <div class="perR fl">
                        <p>馨***呀</p>
                        <p>不好意思评价晚了，产品很好，发货快，包装好，全5分</p>
                        <div class="clearfix">
                            <p><img src="img/temp/eva01.jpg"></p>
                            <p><img src="img/temp/eva02.jpg"></p>
                            <p><img src="img/temp/eva03.jpg"></p>
                            <p><img src="img/temp/eva04.jpg"></p>
                            <p><img src="img/temp/eva05.jpg"></p>
                        </div>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per02.jpg">
                    <div class="perR fl">
                        <p>么***周</p>
                        <p>超级棒，我看图超有质感，很喜欢。美观。包装也很好，绝对不会磕碎碰坏，好评！</p>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per01.jpg">
                    <div class="perR fl">
                        <p>馨***呀</p>
                        <p>不好意思评价晚了，产品很好，发货快，包装好，全5分</p>
                        <div class="clearfix">
                            <p><img src="img/temp/eva01.jpg"></p>
                            <p><img src="img/temp/eva02.jpg"></p>
                            <p><img src="img/temp/eva03.jpg"></p>
                            <p><img src="img/temp/eva04.jpg"></p>
                            <p><img src="img/temp/eva05.jpg"></p>
                        </div>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per02.jpg">
                    <div class="perR fl">
                        <p>么***周</p>
                        <p>包装也很好，绝对不会磕碎碰坏，好评！</p>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per01.jpg">
                    <div class="perR fl">
                        <p>馨***呀</p>
                        <p>全5分</p>
                        <div class="clearfix">
                            <p><img src="img/temp/eva01.jpg"></p>
                            <p><img src="img/temp/eva02.jpg"></p>
                            <p><img src="img/temp/eva03.jpg"></p>
                            <p><img src="img/temp/eva04.jpg"></p>
                            <p><img src="img/temp/eva05.jpg"></p>
                        </div>
                        <p><span>2016年12月27日08:31</span><span>数量：2</span></p>
                    </div>
                </div>
                <div class="per clearfix">
                    <img class="fl" src="img/temp/per02.jpg">
                    <div class="perR fl">
                        <p>么***周</p>
                        <p>书超级棒，书的封面超级好看，感觉很有档次，很喜欢。包装也很好，绝对不会磕烂损坏，好评！</p>
                        <p><span>2016年12月27日08:31</span><span>数量：1</span></p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="msgR fl" style="width: 250px">
<c:if test="${booksByxiangsi.size()!=0}">
        <h4>相似书籍${booksByxiangsi.size()}</h4>
</c:if>
        <div class="seeList">
            <c:forEach items="${booksByxiangsi}" var="x">
            <%--<a href="/showProduct?product_id=${x.id}">--%>

                <dl>
                    <dt><a href="${x.image}"><img src="${x.image}" style="width: 220px;height:200px " referrerpolicy="no-referrer"></a></dt>
                    <dd><a href="/showProduct?product_id=${x.id}">${x.bookname}</a></dd>
                    <dd>￥${x.price}</dd>
                </dl>
            </a>
            </c:forEach>
        </div>

    </div>
</div>

<div class="like" style="width: 100%">
<c:if test="${userPassLike!=null}||${userPassLike.size()!=0}">
    <h4 STYLE="width: 1100px">买过该书的人还喜欢</h4>
</c:if>
   <div class="bottom">
         <div class="hd">
            <span class="prev"><img src="img/temp/prev.png"></span>
            <span class="next"><img src="img/temp/next.png"></span>
        </div>
       <div class="imgCon bd">
            <div class="likeList clearfix">
                <div>
                    <c:forEach items="${userPassLike}" var="b1">
                    <a href="/showProduct?product_id=${b1.id}">
                        <dl>
                            <dt><img src="${b1.image}" referrerpolicy="no-referrer"></dt>
                            <dd>${b1.bookname}</dd>
                            <dd>￥${b1.price}</dd>
                        </dl>
                    </c:forEach>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<script src="js/jquery.SuperSlide.2.1.1.js" type="text/javascript" charset="utf-8"></script>

<script src="js/public.js" type="text/javascript" charset="utf-8"></script>
<script src="js/nav.js" type="text/javascript" charset="utf-8"></script>
<script src="js/pro.js" type="text/javascript" charset="utf-8"></script>
<script src="js/cart.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
    jQuery(".bottom").slide({titCell:".hd ul",mainCell:".bd .likeList",autoPage:true,autoPlay:false,effect:"leftLoop",autoPlay:true,vis:1});
</script>
</html>
