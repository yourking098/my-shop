/**
 * JS函数对象,安全，方便，快捷
 * @constructor
 */
var App = function () {
    //iCheck
    var _checkboxMaster;
    var _checkbox;

    //用于存入ID的数组
    var _idArray;

    /**
     * 初始化handleInitCheckBox 私有方法
     */
    var handleInitCheckBox = function () {
        //iCheck for checkbox and radio inputs
        $('input[type="checkbox"].minimal, input[type="radio"].minimal').iCheck({
            checkboxClass: 'icheckbox_minimal-blue',
            radioClass   : 'iradio_minimal-blue'
        });
        //获取控制端Checkbox
        _checkboxMaster = $('input[type="checkbox"].minimal.checkbox-master');
        //获取全部Checkbox集合
        _checkbox = $('input[type="checkbox"].minimal');
    };

    /**
     * CheckBox全选功能
     */
    var handleCheckBoxAll = function () {
        _checkboxMaster.on("ifClicked", function (e) {
            // 当前状态已选中，点击后应取消选择
            if (e.target.checked) {
                _checkbox.iCheck("uncheck");
            }

            // 当前状态未选中，点击后应全选
            else {
                _checkbox.iCheck("check");
            }
        });
    }

    /**
     * 批量删除
     */
    var handlerDeleteMulti = function (url) {
        _idArray = new Array();
        _checkbox.each(function () {
            var _id = $(this).attr("id");
            if (_id!=null && _id!="undifined" &&　$(this).is(":checked")) {
                _idArray.push(_id);
            }
            //console.log($(this).attr("id"));
        });
        if (_idArray.length === 0) {
            $('#modal-message').html("你还没选择任务数据项，请至少选择一项");
        } else {
            $('#modal-message').html("你确定要删除数据项么");
        }
        $("#modal-default").modal("show");
        console.log(_idArray);

        $("#btnModalOk").bind("click",function () {
            del();
        });

        /**
         * 当前私有函数的私有函数，删除数据
         */
        function del() {
            $("#modal-default").modal("hide");
            if (_idArray.length > 0) {
                console.log("提交数据到后台！");
                setTimeout(function() {
                    $.ajax({
                        "url":url,
                        "type":"POST",
                        "dataType":"JSON",
                        "data":{"ids":_idArray.toString()},
                        "success":function (data) {
                            if (data.status == 200) {
                                window.location.reload();
                            } else {
                                $("#btnModalOk").unbind("click");
                                $("#btnModalOk").bind("click",function () {
                                    $("#modal-default").modal("hide");
                                });
                                $('#modal-message').html("删除失败！");
                                $("#modal-default").modal("show");
                            }
                        }
                    });
                },500)
            }
        }
    };

    return {
        init:function () {
            handleInitCheckBox();
            handleCheckBoxAll();
        },
        //开放私有属性
        getCheckBox:function () {
            return _checkbox;
        },
        deleteMulti:function (url) {
            handlerDeleteMulti(url);
        },
    }
}();

$(document).ready(function () {
    App.init();
})


