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

    /**
     * ajax-post
     * 将链接转换为ajax请求，并交给handleAjax处理
     * 参数：
     * data-confirm：如果存在，则点击后发出提示。
     * 示例：<a href="xxx" class="ajax-post">Test</a>
     */
    // $(document).on('click', '.ajax-post', function (e) {
    //     //取消默认动作，防止跳转页面
    //     e.preventDefault();

    //     //获取参数（属性）
    //     var url = $(this).attr('href');
    //     var confirmText = $(this).attr('data-confirm');

    //     //如果需要的话，发出确认提示信息
    //     if (confirmText) {
    //         var result = confirm(confirmText);
    //         if (!result) {
    //             return false;
    //         }
    //     }

    //     //发送AJAX请求
    //     $.post(url, {}, function (a, b, c) {
    //         handleAjax(a);
    //     });
    // });

    /**
     * ajax-form
     * 通过ajax提交表单，通过oneplus提示消息
     * 示例：<form class="ajax-form" method="post" action="xxx">
     */
    $(document).on('submit', 'form.ajax-form', function (e) {
        //取消默认动作，防止表单两次提交
        e.preventDefault();

        //禁用提交按钮，防止重复提交
        var form = $(this);
        $('[type=submit]', form).addClass('disabled');

        //获取提交地址，方式
        var action = form.attr('action');
        var method = form.attr('method');

        //检测提交地址
        if (!action) {
            return false;
        }

        //默认提交方式为get
        if (!method) {
            method = 'get';
        }

        //获取表单内容
        var formContent = form.serialize();

        //发送提交请求
        var callable;
        if (method == 'post') {
            callable = $.post;
        } else {
            callable = $.get;
        }
        callable(action, formContent, function (a) {
            handleAjax(a);
            //$('[type=submit]', form).removeClass('disabled');
        });

        //返回
        return false;
    });

    //ajax get请求
    $('.ajax-get').click(function(){
        var target;
        var that = this;
        if ( $(this).hasClass('confirm') ) {
            if(!confirm('确认要执行该操作吗?')){
                return false;
            }
        }
        if ( (target = $(this).attr('href')) || (target = $(this).attr('url')) ) {
            $.get(target).success(function(data){
                if (data.status==1) {
                    if (data.url) {
                        updateAlert(data.info + ' 页面即将自动跳转~','alert-success');
                    }else{
                        updateAlert(data.info,'alert-success');
                    }
                    setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }else if( $(that).hasClass('no-refresh')){
                            $('#top-alert').find('button').click();
                        }else{
                            location.reload();
                        }
                    },1500);
                }else{
                    updateAlert(data.info);
                    setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }else{
                            $('#top-alert').find('button').click();
                        }
                    },1500);
                }
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
                if (data.status==1) {
                    if (data.url) {
                        updateAlert(data.info + ' 页面即将自动跳转~','alert-success');
                    }else{
                        updateAlert(data.info ,'alert-success');
                    }
                    setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }else if( $(that).hasClass('no-refresh')){
                            $('#top-alert').find('button').click();
                            $(that).removeClass('disabled').prop('disabled',false);
                        }else{
                            location.reload();
                        }
                    },1500);
                }else{
                    updateAlert(data.info);
                    setTimeout(function(){
                        if (data.url) {
                            location.href=data.url;
                        }else{
                            $('#top-alert').find('button').click();
                            $(that).removeClass('disabled').prop('disabled',false);
                        }
                    },1500);
                }
            });
        }
        return false;
    });

    /**顶部警告栏*/
    var top_alert = $('#top-alert');
    top_alert.find('.close').on('click', function () {
        top_alert.hide();
    });

    window.updateAlert = function (text,c) {
        text = text||'default';
        c = c||false;
        if ( c!=false ) {
            top_alert.removeClass('alert-error alert-warning alert-info alert-success').addClass(c);
        }
        if ( text!='default' ) {
            top_alert.find('.alert-content').text(text);
            top_alert.show();
        } else {
            top_alert.hide();
        }
    };

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
 * Ajax系列
 */

/**
 * 处理ajax返回结果
 */
function handleAjax(a) {

    //如果需要跳转的话，消息的末尾附上即将跳转字样
    if (a.url) {
        a.info += '，页面即将跳转～';
    }

    //弹出提示消息
    if (a.status) {
        updateAlert(a.info, 'alert-success');
    } else {
        updateAlert(a.info);
    }

    //需要跳转的话就跳转
    var interval = 1500;
    if (a.url == "refresh") {
        setTimeout(function () {
            location.href = location.href;
        }, interval);
    } else if (a.url) {
        setTimeout(function () {
            location.href = a.url;
        }, interval);
    } else {
        setTimeout(function () {
            $('#top-alert').find('button').click();
        }, interval);
    }

    //如果需要跳转的话，消息的末尾附上即将跳转字样
    // if (a.url) {
    //     a.info += '，页面即将跳转～';
    // }

    // //弹出提示消息
    // if (a.status) {
    //     op_success(a.info, '温馨提示');
    // } else {
    //     op_error(a.info, '温馨提示');
    // }

    // //需要跳转的话就跳转
    // var interval = 1500;
    // if (a.url == "refresh") {
    //     setTimeout(function () {
    //         location.href = location.href;
    //     }, interval);
    // } else if (a.url) {
    //     setTimeout(function () {
    //         location.href = a.url;
    //     }, interval);
    // }
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
