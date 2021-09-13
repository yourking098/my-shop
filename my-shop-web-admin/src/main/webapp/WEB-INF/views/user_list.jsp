<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="sys" tagdir="/WEB-INF/tags/sys" %>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>我的商城 | 用户管理</title>
    <jsp:include page="../includes/header.jsp"></jsp:include>

</head>
<body class="hold-transition skin-blue sidebar-mini">

<div class="wrapper">
    <jsp:include page="../includes/nav.jsp"/>

    <jsp:include page="../includes/menu.jsp"/>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <h1>
                用户管理
                <%--                <small>Control panel</small>--%>
            </h1>
            <ol class="breadcrumb">
                <li><a href="/main"><i class="fa fa-dashboard"></i> 首页</a></li>
                <li class="active">用户管理</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <!-- /.row -->
            <div class="row">
                <div class="col-xs-12">
                    <c:if test="${baseResult!=null}">
                        <div class="alert alert-${baseResult.status==200?"success":'danger'} alert-dismissible" >
                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                                ${baseResult.messsage}
                        </div>
                    </c:if>

                    <div class="box box-info box-info-search" style="display: none">
                        <div class="box-header with-border">
                            <h3 class="box-title">高级搜索</h3>
                        </div>
                        <!-- /.box-header -->
                        <!-- form start -->
                        <form:form action="/user/search" cssClass="form-horizontal" method="post" modelAttribute="tbUser">
                            <div class="box-body">
                                <div class="row">
                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="username" class="col-sm-4 control-label">姓名</label>
                                            <div class="col-sm-8">
                                                <form:input path="username" cssClass="form-control" placeholder="姓名"></form:input>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="email" class="col-sm-4 control-label">邮箱</label>
                                            <div class="col-sm-8">
                                                <form:input path="email" cssClass="form-control" placeholder="邮箱"></form:input>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xs-12 col-sm-3">
                                        <div class="form-group">
                                            <label for="phone" class="col-sm-4 control-label">手机</label>
                                            <div class="col-sm-8">
                                                <form:input path="phone" cssClass="form-control" placeholder="手机"></form:input>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- /.box-body -->
                            <div class="box-footer">
                                <button type="submit" class="btn btn-info pull-right">搜索</button>
                            </div>
                            <!-- /.box-footer -->
                        </form:form>
                    </div>

                    <div class="box">
                        <div class="box-header">
                            <h3 class="box-title">用户列表</h3>

                            <div class="row" style="padding-left: 13px;padding-top: 10px">
                                <a href="/user/form" type="button" class="btn btn-default btn-sm"><i class="fa fa-plus"></i> 新增</a>&nbsp;&nbsp
                                <button type="button" class="btn btn-default btn-sm" onclick="App.deleteMulti('/user/delete')"><i class="fa fa-trash-o" ></i> 删除</button>&nbsp;&nbsp
                                <a href="#" type="button" class="btn btn-default btn-sm"><i class="fa fa-upload"></i> 导入</a>&nbsp;&nbsp
                                <a href="#" type="button" class="btn btn-default btn-sm"><i class="fa fa-download"></i> 导出</a>&nbsp;&nbsp
                                <button href="#" type="button" class="btn btn-primary btn-sm" onclick="$('.box-info-search').css('display')=='none'?$('.box-info-search').show('fast'):$('.box-info-search').hide('fast')"><i class="fa fa-search"></i> 搜索</button>&nbsp;&nbsp
                            </div>

                            <div class="row" style="padding-top: 15px">

                            </div>
                        </div>
                        <!-- /.box-header -->
                        <div class="box-body table-responsive no-padding">
                            <table class="table table-hover">
                                <thead>
                                    <tr>
                                        <th><input type="checkbox" class="minimal checkbox-master" /></th>
                                        <th>ID</th>
                                        <th>用户名</th>
                                        <th>手机号</th>
                                        <th>邮箱</th>
                                        <th>更新时间</th>
                                        <th>操作</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${tbUsers}" var="tbUser">
                                        <tr>
                                            <td><input id="${tbUser.id}" type="checkbox" class="minimal icheck_master" /></td>
                                            <td>${tbUser.id}</td>
                                            <td>${tbUser.username}</td>
                                            <td>${tbUser.phone}</td>
                                            <td>${tbUser.email}</td>
                                            <td><fmt:formatDate value="${tbUser.updated}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:formatDate> </td>
                                            <td>
                                                <a href="#" type="button" class="btn btn-default btn-sm"><i class="fa fa-search"></i> 查看</a>
                                                <a href="#" type="button" class="btn btn-primary btn-sm"><i class="fa fa-edit"></i> 编辑</a>
                                                <a href="#" type="button" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> 删除</a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>

    <jsp:include page="../includes/copyright.jsp" />

</div>

<jsp:include page="../includes/footer.jsp"></jsp:include>

<%--modalMessage="第一个模态框" opts="confirm" url="/user/del"--%>
<!-- 自定义模态框-->
<sys:modal />

<script>
    // $("#multidelete_button").click(function () {
    //     // App.getCheckBox()
    //     App.deleteMulti();
    // })
    // $(function () {
    //
    //     var _checkbox = App.getCheckBox();
    //     console.log(_checkbox.length);
    //     _checkbox.each(function () {
    //         console.log($(this).attr("id"));
    //     })
    // });
    // var idArray = new Array();
    // function deleteMulti() {
    //     App.getCheckBox()
    //     idArray = new Array();
    //     var _checkbox = App.getCheckBox();
    //     _checkbox.each(function () {
    //         var _id = $(this).attr("id");
    //         if (_id!=null && _id!="undifined" &&　$(this).is(":checked")) {
    //             idArray.push(_id);
    //         }
    //         //console.log($(this).attr("id"));
    //     });
    //     $("#modal-default").modal("show");
    //     if (idArray.length === 0) {
    //         $('#modal-message').html("你还没选择任务数据项，请至少选择一项");
    //     } else {
    //         $('#modal-message').html("你确定要删除数据项么");
    //     }
    //     console.log(idArray);
    // }

    // $(function () {
    //     $("#multidelete_button").click(function () {
    //         // App.getCheckBox()
    //         App.deleteMulti();
    //     })
    // });

</script>

</body>
</html>
