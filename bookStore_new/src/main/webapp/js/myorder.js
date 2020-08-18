$(function(){
    $(".fin").click(function () {
        alert("dddd")
        $(".mask").show();
    });


//	address


    $(".dizhi").hover(function(){
        var txt="";
        txt='<p class="addp"><a href="#"  class="readdn">ÐÞ¸Ä</a><a href="/delete" class="deladd">É¾³ý</a></p>'
        $(this).append(txt);
        $(".readdn").click(function(){
            $(".mask").show();
            $(".readd").show();
        });
        $(".deladd").click(function(){
            $(this).parents(".dizhi").remove();
        });
    },function(){
        $(".bc>input").click(function(){
            if($(this).val()=="±£´æ"){
                $(".mask").hide();
                $(".readd").hide();
            }else{
                $(".mask").hide();
                $(".readd").hide();
            }
        });
        $(".addp").remove();
    });



})
