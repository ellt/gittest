$(function(){
    "use strict";

    var url = $('table').data("url");
    $('table').on('mouseout', "[data-id='popover']", function(event) {
        $(this).data("mouse", "out");
    });

    $('table').on('mouseover', "[data-id='popover']", {url: url}, function(event) {
        var $span = $(this); // 触发弹出框的元素

        // 设置鼠标状态标记
        $span.data("mouse", "over");

        // 已经加载数据并初始化弹出框，则返回
        if ($span.data("state") === "loaded") return false;
    
        // 设置加载数据状态标记
        $span.data("state", "loaded");

        // 初始化弹出框
        $span.popover({
            html: true,
            container: "body",
            placement: "left",
            trigger: "hover",
            content: '<span><i class="fa fa-spinner fa-pulse"></i> 加载中</span>',
        });
        $span.popover("show");

        // 异步加载数据
        var param = $span.data("get-param");
        $.get(event.data.url+"&"+param).success(function(data){
            if (data.status) {
                var list = data.data;
                var content = "成员：";

                for (var i = 0; i < list.length; i++) {
                    content += list[i].relation + " ";
                }
                $span.data("bs.popover").options.content = content;

            } else {
                $span.data("bs.popover").options.content = 
                    "<p>绑定信息加载失败！</p><p>错误信息：" + data.info + "</p>";
            }

        }).error(function() {
            $span.data("bs.popover").options.content = "<p>绑定信息加载失败！</p><p>错误信息：连接服务器失败</p>";

        }).complete(function() {
            // 当鼠标仍在触发元素上时
            if ($span.data("mouse") === "over") {
                $span.popover("show");
            }
        });
    });
});