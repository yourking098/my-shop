<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

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
                <li class="active">控制面板</li>
            </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="col-md-6">
                <c:if test="${baseResult!=null}">
                    <div class="alert alert-${baseResult.status==200?"success":'danger'} alert-dismissible" >
                        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
                            ${baseResult.messsage}
                    </div>
                </c:if>

                <!-- Horizontal Form -->
                <div class="box box-info">
                    <div class="box-header with-border">
                        <h3 class="box-title">新增用户</h3>
                    </div>
                    <!-- /.box-header -->
                    <!-- form start -->
                    <form:form id="inputForm" cssClass="form-horizontal" action="/user/save" method="post" modelAttribute="tbUser">
                        <div class="box-body">
                            <div class="form-group">
                                <label for="email" class="col-sm-2 control-label">邮箱</label>

                                <div class="col-sm-10">
<%--                                    <input type="email" name="email" class="form-control" id="emailInput" placeholder="请输入邮箱">--%>
                                    <form:input path="email" cssClass="form-control required email" placeholder="请输入邮箱"/>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="username" class="col-sm-2 control-label">姓名</label>

                                <div class="col-sm-10">
                                    <form:input path="username" cssClass="form-control required" placeholder="请输入姓名"/>
<%--                                    <input type="text" name="username" class="form-control" id="username" placeholder="请输入姓名">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="phone" class="col-sm-2 control-label">手机</label>

                                <div class="col-sm-10">
                                    <form:input path="phone" cssClass="form-control required mobile" placeholder="请输入手机"/>
<%--                                    <input type="text" name="phone" class="form-control" id="phone" placeholder="请输入手机">--%>
                                </div>
                            </div>
                            <div class="form-group">
                                <label for="password" class="col-sm-2 control-label">密码</label>

                                <div class="col-sm-10">
                                    <form:password path="password" cssClass="form-control required" placeholder="请输入密码"/>
<%--                                    <input type="password" name="password" class="form-control" id="password" placeholder="请输入密码">--%>
                                </div>
                            </div>
                        </div>
                        <!-- /.box-body -->
                        <div class="box-footer">
                            <button type="button" class="btn btn-default" onclick="history.go(-1)">返回</button>
                            <button type="submit" class="btn btn-info pull-right">提交</button>
                        </div>
                        <!-- /.box-footer -->
                    </form:form>
<%--                    <form class="form-horizontal" method="post" action="/user/save">--%>

<%--                    </form>--%>
                </div>
            </div>
        </section>
        <!-- /.content -->
    </div>

    <jsp:include page="../includes/copyright.jsp" />

</div>

<jsp:include page="../includes/footer.jsp"></jsp:include>

</body>
</html>
