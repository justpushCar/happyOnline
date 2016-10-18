$(function(){
    var height = $(".somediv60").width();
    height=height*0.6;
    $(".somediv60").css("height",height );
    var siz=$('.data-size')
    siz.each(function(k,v){
       var ht=$(v).attr('data-size');
        var  height=$(v).width();
       var height=height*(ht/100);
        $(this).find('img').css('height',height)

    })

    //轮播
    jQuery("#banner").slide({mainCell:".bd ul",autoPlay:true});
    jQuery(".slideTxtBox").slide({effect:"left",easing:"swing",delayTime:1000});
    //注册







})