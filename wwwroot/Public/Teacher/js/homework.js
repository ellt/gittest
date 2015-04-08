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
        var status = btn.attr("data-status");
        var text = $(this).val();

        if (text === "" && status === "1") {
            // 没作业
            btn.attr("data-status", "0");
            btn.html("今天没作业");
            btn.removeClass("btn-primary").addClass("btn-warning");
        } else if (text !== "" && status === "0") {
            // 有作业
            btn.attr("data-status", "1");
            btn.html("发布作业");
            btn.removeClass("btn-warning").addClass("btn-primary");
        }
    });

    $("[data-submit='form']").click(function(e) {
        //取消默认动作，防止表单两次提交
        e.preventDefault();

        var url = $(this).attr('data-url');
        var status = $(this).attr("data-status");
        var content = "";

        if (status === "1") {
            var targetForm = $(this).attr('data-target');
            var form = $(targetForm);
            content = form.serialize();
            content += "&status=true";
        } else {
            var checkbox = $("[data-check='class']");
            content = checkbox.serialize();
            content += "&status=false";
        }

        var btn = $(this);
        btn.button('loading');
        //发送到服务器
        $.post(url, content).success(function(data) {
            btn.button('reset');
            if (data.status) {
                
            } else {
                
            }
        });
    });
});