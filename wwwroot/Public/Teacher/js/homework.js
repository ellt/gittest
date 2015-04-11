//dom加载完成后执行的js
$(function() {
    // 初始化弹出框
    $('[data-toggle="popover"]').popover();

    // 上一次作业
    $("[data-target='class']").change(function() {
        var history = $("[id^='history']");
        if(this.checked) {
            history.show();
        } else {
            history.hide();
        }
    });
    $("[data-check='class']").change(function() {
        var checkboxes = $("[data-check='class']");
        $(this).each(function(index, el) {
            var id = $(this).attr("value"); 
            var history = $("#history"+id); console.log(id+": "+this.checked);
            if(this.checked) {
                history.show();
            } else {
                history.hide();
            }
        });
    });

    // 作业内容
    $("#homework").bind('input propertychange', function() {
        var text = $(this).val();
        var $btn = $("[data-submit='form']");
        var $setTime = $("#setTime");
        var $setTimeGroup = $setTime.parents(".form-group");

        if (text === "") {
            // 没作业
            $btn.html("今天没作业").prop('disabled', false);
            $btn.removeClass("btn-primary").addClass("btn-warning");
            $btn.removeClass("btn-primary").addClass("btn-warning");
            $setTimeGroup.addClass("hidden");
            $setTime.val(0);
            showPopTip($("#addHomeworkForm"));
        } else {
            // 有作业
            $btn.html("发布作业");
            $btn.removeClass("btn-warning").addClass("btn-primary");
            $setTimeGroup.removeClass("hidden");
            $setTime.val(30);
        }
    });

    // 建议时间 设置快捷键
    $("[data-form-btn='set-time']").click(function() {
        var targetInput = $(this).attr('data-target');
        var content = $(this).attr('data-content');
        var $input = $(targetInput);
        $input.val(content);
        $input.trigger("input").trigger("propertychange");
    });

    // 建议时间 输入框
    $("#setTime").bind('input propertychange', function() {
        var val = $(this).val();
        var $btn = $("[data-submit='form']");
        var $form = $("#addHomeworkForm");

        if (isInt(val) && 0 < val && val <= 1000) {
            // 输入符合 1 ~ 1000 的条件
            showPopTip($form); // 清除弹出框
            $btn.prop('disabled', false);
        } else {
            var tip = {
                suggest_time: {
                    errorInfo : "请输入 1 ~ 1000 之间的分钟数"
                }
            };
            showPopTip($form, tip);
            $btn.prop('disabled', true);
        }
    });

    $("[data-submit='form']").click(function(e) {
        //取消默认动作，防止表单两次提交
        e.preventDefault();

        var url = $(this).attr('data-url');
        var targetForm = $(this).attr('data-target');
        var content = $(targetForm).serialize();

        var $btn = $(this);
        $btn.button('loading');
        //发送到服务器
        $.post(url, content).success(function(data) {
            $btn.button('reset');
            handleAjax(data);
        });
    });
});