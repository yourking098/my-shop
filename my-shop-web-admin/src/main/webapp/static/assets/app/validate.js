/**
 * JS函数对象,安全，方便，快捷
 * @constructor
 */
var Validate = function () {
    /**
     * 初始化Jquery validation 私有方法
     */
    var handlerInitValidate = function () {
        console.log("初始化Juqery validation");
        //添加自定义方法
        $.validator.addMethod("mobile", function(value, element) {
            var length = value.length;
            var mobile =  /^(((13[0-9]{1})|(15[0-9]{1}))+\d{8})$/;
            return this.optional(element) || (length == 11 && mobile.test(value));
        }, "手机号码格式错误");

        $("#inputForm").validate({
            errorElement: 'span',
            errorClass: 'help-block',

            errorPlacement: function (error, element) {
                element.parent().parent().attr("class", "form-group has-error");
                error.insertAfter(element);
            }
        });
    }

    //公共方法，把私有方法暴露出来
    return {
        init:function () {
            handlerInitValidate();
        }
    }
}();

//初始化页面时
$(document).ready(function (){
    Validate.init();
})