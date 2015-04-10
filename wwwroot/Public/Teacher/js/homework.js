//dom加载完成后执行的js
$(function() {
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

    $("[data-form-btn='set-time']").click(function() {
        var targetInput = $(this).attr('data-target');
        var input = $(targetInput);
        var content = $(this).attr('data-content');
        input.val(content);
    });

    $("#homework").bind('input propertychange', function() {
        var btn = $("[data-submit='form']");
        var text = $(this).val();

        if (text === "") {
            // 没作业
            btn.html("今天没作业");
            btn.removeClass("btn-primary").addClass("btn-warning");
        } else {
            // 有作业
            btn.html("发布作业");
            btn.removeClass("btn-warning").addClass("btn-primary");
        }
    });

    $("[data-submit='form']").click(function(e) {
        //取消默认动作，防止表单两次提交
        e.preventDefault();

        var url = $(this).attr('data-url');
        var text = $("#homework").val();

        // 没作业
        if (text === "") {
            $("#setTime").val(0); // 将建议用时清零
        } 

        var targetForm = $(this).attr('data-target');
        var content = $(targetForm).serialize();

        var btn = $(this);
        btn.button('loading');
        //发送到服务器
        $.post(url, content).success(function(data) {
            btn.button('reset');
            handleAjax(data);
        });
    });
});