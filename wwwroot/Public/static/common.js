//dom加载完成后执行的js
;$(function(){

    //全选的实现
    $(".check-all").click(function(){
        $(".ids").prop("checked", this.checked);
    });
    $(".ids").click(function(){
        var option = $(".ids");
        option.each(function(i){
            if(!this.checked){
                $(".check-all").prop("checked", false);
                return false;
            }else{
                $(".check-all").prop("checked", true);
            }
        });
    });

    //全选的实现(通用方式)
    $("[data-toggle='checkall']").click(function(){
        var target = $(this).attr("data-target");
        var checkbox = $("[data-check=" + target + "]");
        checkbox.prop("checked", this.checked);
    });
    $("[data-check]").click(function(){
        var target = $(this).attr("data-check");
        var checkbox = $("[data-check=" + target + "]");
        var checkall = $("[data-toggle='checkall']").filter("[data-target=" + target +"]");
        checkbox.each(function(i){
            if(!this.checked){
                checkall.prop("checked", false);
                return false;
            }else{
                checkall.prop("checked", true);
            }
        });
    });

    /**顶部警告栏*/
    var top_alert = $('#top-alert');
    top_alert.find('.close').on('click', function () {
        top_alert.hide();
    });

    // 警告栏的弹出与隐藏
    window.updateAlert = function (info, status) {
        if (status) { //如果不是隐藏提示框
            var c = (status == "success") ? "alert-success" : "alert-warning";
            top_alert.removeClass('alert-warning alert-success').addClass(c);
            top_alert.find('.alert-content').text(info);
            top_alert.show();
            setTimeout(function () {
                top_alert.hide();
            }, 1500);
        } else {
            top_alert.hide();
        }
    };

    /**
     * ajax-form
     * 通过ajax提交表单，显示提示消息
     * 示例：<form class="ajax-form" method="post" action="xxx">
     */
    $(document).on('submit', 'form.ajax-form', function (e) {
        //取消默认动作，防止表单两次提交
        e.preventDefault();

        //禁用提交按钮，防止重复提交
        var form = $(this);
        $("[type='submit']", form).button('loading');

        //获取提交地址，方式
        var action = form.attr('action');
        var method = form.attr('method');

        //检测提交地址
        if (!action) {
            return false;
        }

        //获取表单内容
        var formContent = form.serialize();

        //发送提交请求
        var callable = (method == 'post') ? $.post : $.get;

        callable(action, formContent, function (a) {
            handleAjax(a);
            $("[type='submit']", form).button('reset');
        });

        return false;
    });

    //ajax get请求
    $('.ajax-get').click(function(){
        if ( $(this).hasClass('confirm') ) {
            if(!confirm('确认要执行该操作吗?')){
                return false;
            }
        }

        var url,btn=undefined;
        (url = $(this).attr('href')) || (url = $(this).attr('url'));
        if(undefined==url) { //逐渐过渡到使用html5标准 data-*
            url = $(this).attr('data-url');
            btn = this;
            $(btn).button('loading');
        }

        if (url) {
            $.get(url, function(data) {
                handleAjax(data);
                btn && $(btn).button('reset');
            });
        }
        return false;
    });

    //ajax post submit请求
    $('.ajax-post').click(function(){
        var target,query,form;
        var target_form = $(this).attr('target-form');
        var that = this;
        var nead_confirm=false;
        if( ($(this).attr('type')=='submit') || (target = $(this).attr('href')) || (target = $(this).attr('url')) ){
            form = $('.'+target_form);

            if ($(this).attr('hide-data') === 'true'){//无数据时也可以使用的功能
                form = $('.hide-data');
                query = form.serialize();
            }else if (form.get(0)==undefined){
                return false;
            }else if ( form.get(0).nodeName=='FORM' ){
                if ( $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                if($(this).attr('url') !== undefined){
                    target = $(this).attr('url');
                }else{
                    target = form.get(0).action;
                }
                query = form.serialize();
            }else if( form.get(0).nodeName=='INPUT' || form.get(0).nodeName=='SELECT' || form.get(0).nodeName=='TEXTAREA') {
                form.each(function(k,v){
                    if(v.type=='checkbox' && v.checked==true){
                        nead_confirm = true;
                    }
                })
                if ( nead_confirm && $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                query = form.serialize();
            }else{
                if ( $(this).hasClass('confirm') ) {
                    if(!confirm('确认要执行该操作吗?')){
                        return false;
                    }
                }
                query = form.find('input,select,textarea').serialize();
            }
            $(that).addClass('disabled').attr('autocomplete','off').prop('disabled',true);
            $.post(target,query).success(function(data){
                handleAjax(data);
                $(that).removeClass('disabled').prop('disabled',false);
            });
        }
        var url;
        if(url = $(this).attr('data-url')) {
            var target = $(this).attr("data-target");
            var form = $("["+ target + "]");
            query = form.serialize();
            $.post(url,query).success(function(data){
                handleAjax(data);
            });
        }
        return false;
    });

    //ajax 发送 submit 请求
    $("[data-target-form]").click(function() {
        var target_form = $(this).attr("data-target-form");
        form = $('.'+target_form);
        var url = $(this).attr("data-url");
        
        $.post(url, form.serialize(), function (data) {
            handleAjax(data);
        })
    });

    //按钮组
    (function(){
        //按钮组(鼠标悬浮显示)
        // $(".btn-group").mouseenter(function(){
        //     var userMenu = $(this).children(".dropdown ");
        //     var icon = $(this).find(".btn i");
        //     icon.addClass("btn-arrowup").removeClass("btn-arrowdown");
        //     userMenu.show();
        //     clearTimeout(userMenu.data("timeout"));
        // }).mouseleave(function(){
        //     var userMenu = $(this).children(".dropdown");
        //     var icon = $(this).find(".btn i");
        //     icon.removeClass("btn-arrowup").addClass("btn-arrowdown");
        //     userMenu.data("timeout") && clearTimeout(userMenu.data("timeout"));
        //     userMenu.data("timeout", setTimeout(function(){userMenu.hide()}, 100));
        // });

        $(".btn-group-click .btn").click(function(e){
            if ($(this).next(".dropdown-pannel").is(":hidden")) {
                $(this).next(".dropdown-pannel").show();
                $(this).find("i").addClass("btn-arrowup");
                e.stopPropagation();
            }else{
                $(this).find("i").removeClass("btn-arrowup");
            }
        })
        $(".dropdown-pannel").click(function(e) {
            e.stopPropagation();
        });
        $(document).click(function() {
            $(".dropdown-pannel").hide();
            $(".btn-group-click .btn").find("i").removeClass("btn-arrowup");
        });
    })();

//     // 独立域表单获取焦点样式
//     $(".text").focus(function(){
//         $(this).addClass("focus");
//     }).blur(function(){
//         $(this).removeClass('focus');
//     });
//     $("textarea").focus(function(){
//         $(this).closest(".textarea").addClass("focus");
//     }).blur(function(){
//         $(this).closest(".textarea").removeClass("focus");
//     });
});

/**
 * 模拟U函数
 * @param url
 * @param params
 * @returns {string}
 * @constructor
 */
function U(url, params, rewrite) {
    var website = Think.ROOT + '/index.php';
    url = url.split('/');
    if (url[0] == '' || url[0] == '@')
        url[0] = APPNAME;
    if (!url[1])
        url[1] = 'Index';
    if (!url[2])
        url[2] = 'index';
    website = website + '?s=/' + url[0] + '/' + url[1] + '/' + url[2];
    if (params) {
        params = params.join('/');
        website = website + '/' + params;
    }
    if (!rewrite) {
        website = website + '.html';
    }
    return website;
}

/**
 * 处理ajax返回结果
 * 弹出提示框，显示结果中的success或error信息
 * 参数：
 * data.status：1 成功 0 失败
 * data.info：提示信息
 * data.url: "refresh" 刷新，url 跳转地址, "" 不刷新
 */
function handleAjax(data) {

    //如果需要跳转的话，消息的末尾附上即将跳转字样
    if (data.url && data.url != "no-refresh") {
        data.info += '，页面即将跳转～';
    }

    //弹出提示消息
    if (data.status) {
        updateAlert(data.info, 'success');
        if (!data.url) data.url = "refresh"; // 对ot admin 方法兼容，后期需要优化 add by Guoky
    } else {
        updateAlert(data.info, 'error');
    }

    //需要跳转的话就跳转
    var interval = 1000;
    if (data.url == "refresh") {
        setTimeout(function () {
            location.href = location.href;
        }, interval);
    } else if (data.url == "no-refresh") {
        // 暂时留空
    } else if (data.url) {
        setTimeout(function () {
            location.href = data.url;
        }, interval);
    }
}

/**
 * 改变按钮状态
 * 参数：
 * btn：按钮对象
 * status：true active，false disabled
 * text：按钮显示的内容
 */
function changeBtnStatus(btn, status, text) {
    
    if(status == true) { // 激活状态
        btn.removeClass('disabled').prop('disabled',false);
    } else { // 禁用状态
        btn.addClass('disabled').prop('disabled',true);
    }

    if(text != undefined) {
        btn.val(text);
    }
}

 function isInt(obj){
    reg = /^-?\d+$/;
    result = reg.test(obj) ? true : false;
    return result;
 }   
 // function isEmail(obj){
 //     reg=/^w{3,}@w+(.w+)+$/;   
 //    if(!reg.test(obj)){        
 //         $("#test").html("<b>请输入正确的邮箱地址</b>");   
 //     }else{   
 //         $("#test").html("");   
 //     }   
 // }   
 // function isString(obj){
 //     reg=/^[a-z,A-Z]+$/;   
 //    if(!reg.test(obj)){   
 //         $("#test").html("<b>只能输入字符</b>");   
 //     }else{   
 //         $("#test").html("");   
 //     }   
 // }   
 // function isTelephone(obj){
 //     reg=/^(d{3,4}-)?[1-9]d{6,7}$/;   
 //    if(!reg.test(obj)){   
 //         $("#test").html("<b>请输入正确的电话号码！</b>");   
 //     }else{   
 //         $("#test").html("");   
 //     }   
 // }   
 // function isMobile(obj){   
 //     reg=/^(+d{2,3}-)?d{11}$/;   
 //    if(!reg.test(obj)){   
 //         $("#test").html("请输入正确移动电话");   
 //     }else{   
 //         $("#test").html("");   
 //     }   
 // }   
 // function isUri(obj){   
 //     reg=/^http://[a-zA-Z0-9]+.[a-zA-Z0-9]+[/=?%-&_~`@[]':+!]*([^<>""])*$/;
 //    if(!reg.test(obj)){   
 //         $("#test").html($("#uri").val()+"请输入正确的inernet地址");   
 //     }else{   
 //         $("#test").html("");   
 //     }   
 // }   

// /* 上传图片预览弹出层 */
// $(function(){
//     $(window).resize(function(){
//         var winW = $(window).width();
//         var winH = $(window).height();
//         $(".upload-img-box").click(function(){
//          //如果没有图片则不显示
//          if($(this).find('img').attr('src') === undefined){
//              return false;
//          }
//             // 创建弹出框以及获取弹出图片
//             var imgPopup = "<div id=\"uploadPop\" class=\"upload-img-popup\"></div>"
//             var imgItem = $(this).find(".upload-pre-item").html();

//             //如果弹出层存在，则不能再弹出
//             var popupLen = $(".upload-img-popup").length;
//             if( popupLen < 1 ) {
//                 $(imgPopup).appendTo("body");
//                 $(".upload-img-popup").html(
//                     imgItem + "<a class=\"close-pop\" href=\"javascript:;\" title=\"关闭\"></a>"
//                 );
//             }

//             // 弹出层定位
//             var uploadImg = $("#uploadPop").find("img");
//             var popW = uploadImg.width();
//             var popH = uploadImg.height();
//             var left = (winW -popW)/2;
//             var top = (winH - popH)/2 + 50;
//             $(".upload-img-popup").css({
//                 "max-width" : winW * 0.9,
//                 "left": left,
//                 "top": top
//             });
//         });

//         // 关闭弹出层
//         $("body").on("click", "#uploadPop .close-pop", function(){
//             $(this).parent().remove();
//         });
//     }).resize();

//     // 缩放图片
//     function resizeImg(node,isSmall){
//         if(!isSmall){
//             $(node).height($(node).height()*1.2);
//         } else {
//             $(node).height($(node).height()*0.8);
//         }
//     }
// })

// //标签页切换(无下一步)
// function showTab() {
//     $(".tab-nav li").click(function(){
//         var self = $(this), target = self.data("tab");
//         self.addClass("current").siblings(".current").removeClass("current");
//         window.location.hash = "#" + target.substr(3);
//         $(".tab-pane.in").removeClass("in");
//         $("." + target).addClass("in");
//     }).filter("[data-tab=tab" + window.location.hash.substr(1) + "]").click();
// }

// //标签页切换(有下一步)
// function nextTab() {
//      $(".tab-nav li").click(function(){
//         var self = $(this), target = self.data("tab");
//         self.addClass("current").siblings(".current").removeClass("current");
//         window.location.hash = "#" + target.substr(3);
//         $(".tab-pane.in").removeClass("in");
//         $("." + target).addClass("in");
//         showBtn();
//     }).filter("[data-tab=tab" + window.location.hash.substr(1) + "]").click();

//     $("#submit-next").click(function(){
//         $(".tab-nav li.current").next().click();
//         showBtn();
//     });
// }

// // 下一步按钮切换
// function showBtn() {
//     var lastTabItem = $(".tab-nav li:last");
//     if( lastTabItem.hasClass("current") ) {
//         $("#submit").removeClass("hidden");
//         $("#submit-next").addClass("hidden");
//     } else {
//         $("#submit").addClass("hidden");
//         $("#submit-next").removeClass("hidden");
//     }
// }

// //导航高亮
// function highlight_subnav(url){
//     $('.side-sub-menu').find('a[href="'+url+'"]').closest('li').addClass('current');
// }
