$(function() {

});

function tableHandle(userData) {
    var container = document.getElementById('hs');
    var url = $(container).attr("data-url");
    var hs = creatTable(container, userData);
    var order = $(container).data('order');
    $("[data-submit='edit-table']").click(function(event) {
        var btn = this;
        $(btn).button('loading');

        var url = $(this).attr("data-url");
        var data = hs.getData();
        var mode = "save";
        
        $.post(url, {mode:mode, data:data}).success(function(data){
            $(btn).button('reset');
            if (data.status) {
                handleAjax(data);
            }
            else {
                showTableTip(hs, order, data.error_info);
            }
        });
    });

    hs.addHook('beforeChange', function(changes, source) {
        for (var i = 0; i < changes.length; i++) {
            if (changes[i][1] === "sex.title") {
                var data = hs.getData();
                changes[i][3] = $.trim(changes[i][3]);
                if (changes[i][3] === "男") {
                    data[changes[i][0]].sex.value = "male";
                } else if (changes[i][3] === "女") {
                    data[changes[i][0]].sex.value = "female";
                } else { //输入非法字符 改为默认值"男"
                    changes[i][3] = "男";
                    data[changes[i][0]].sex.value = "male";
                }
            }
        }
    });

    hs.addHook('afterChange', function(changes, source) {
        if (changes === null) return false;
        // elog(changes);
        var oldVal, newVal;
        for (var i = 0; i < changes.length; i++) {
            oldVal = changes[i][2];
            newVal = changes[i][3];
            //elog("changes:"+oldVal+"=>"+newVal);
            if (oldVal !== newVal) {
                checkData(url, hs, order);
            }
        }
    });
}

function creatTable(container, userData) {
    var ret = getSettings(userData);

    $(container).data("order", ret.order);

    var settings = {
        data: ret.data,
        startRows: 0,
        stretchH: 'all',
        rowHeaders: true,
        colHeaders: ret.colHeaders,
        minSpareRosw: 1,
        comments: true,
        columns:ret.columns,
    };
    var hs = new Handsontable(container, settings);
    return hs;
}

function getSettings(rowData) {
    var head = rowData.head;
    var body = rowData.body;

    var ret = {};
    var data = Array();
    var order = Array();
    var headers = Array();
    var columns = Array();
    var i;
    
    for (i = 0; i < head.length; i++) {

        // 隐藏id 
        if(head[i].value === "id") continue;

        order.push(head[i].value);
        headers.push(head[i].title);

        if (head[i].value === "student_id" || head[i].value === "teacher_id") {
            columns.push({
                data:head[i].value+".value", 
                type:"text", 
                readOnly: true
            });
        } else if(head[i].value === "sex") {
            columns.push({
                data:head[i].value+".title", 
                type:"dropdown",
                source: ["男", "女"],
            });
        } else {
            columns.push({data:head[i].value+".value", type:"text"});
        }
    }

    if (body[i].hasOwnProperty('sex')) {
        for (i = 0; i < body.length; i++) {
            body[i].sex.title = body[i].sex.value === 'male' ? "男" : "女";
        }
    }

    ret.colHeaders = headers;
    ret.order = order;
    ret.data = body;
    ret.columns = columns;

    return ret;
}

function checkData(url, hs, order) {
    var data = hs.getData();
    var mode = "check";
    $.post(url, {mode:mode, data:data}).success(function(data){
        showTableTip(hs, order, data.hint);
    });
}

function showTableTip(hs, order, hint) {
    hs.updateSettings({
        cells: function (row, col, prop) {
            var cellProperties = {};

            for (var i in hint) {
                for (var j in hint[i]) {
                    if (row === Number(i) && col === order.indexOf(j)) {
                        cellProperties.renderer = errorRenderer;
                        cellProperties.comment = hint[i][j].errorInfo;
                    }
                }
            }

            return cellProperties;
        },
    });
    elog("hint:" + hint);
}

function errorRenderer(instance, td, row, col, prop, value, cellProperties) {
    Handsontable.renderers.TextRenderer.apply(this, arguments);
    td.style.background = 'pink';
}

// function firstRowRenderer(instance, td, row, col, prop, value, cellProperties) {
//     Handsontable.renderers.TextRenderer.apply(this, arguments);
//     td.style.padding = '5px';
//     td.style.fontWeight = 'bold';
//     td.style.color = 'white';
//     td.style.background = '#444';
// }

function getUserData() {
    var url = $("#hs").attr("data-url");
    var ret;

    // 设置为同步，等待获取完数据再进行其他的步骤
    $.ajaxSetup({
        async : false
    });

    $.post(url).success(function(data){
        ret = data.data;
    });

    // 恢复为异步
    $.ajaxSetup({
        async: true
    });

    return ret;
}