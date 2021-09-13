<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ attribute name="modalTitle" type="java.lang.String" required="false" description="模态弹窗标题"%>
<%@ attribute name="modalMessage" type="java.lang.String" required="false" description="模态弹窗消息内容"%>

<%--<%@ attribute name="opts" type="java.lang.String" required="false" description="操作类型：info信息提示，confirm确认 "%>--%>
<%--<%@ attribute name="url" type="java.lang.String" required="false" description="跳转链接，主要用于确认对话框删除使用 "%>--%>


<div class="modal fade" id="modal-default">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">${modalTitle==null?"温馨提示":modalTitle}</h4>
            </div>
            <div class="modal-body">
                <p id="modal-message">${modalMessage}&hellip;</p>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default pull-left" data-dismiss="modal">关闭</button>
                <button id="btnModalOk" type="button" class="btn btn-primary">确定</button>
            </div>
        </div>
        <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
</div>
<!-- /.modal -->

<%--<script>--%>
<%--    $(function () {--%>
<%--        $("#btnModalOk").bind("click",function () {--%>
<%--            <c:if test="${opts != 'confirm'}">--%>
<%--                $("#modal-default").modal("hide");--%>
<%--            </c:if>--%>
<%--            <c:if test="${opts == 'confirm'}">--%>
<%--                console.log('${url}');--%>
<%--            </c:if>--%>
<%--        })--%>
<%--    });--%>
<%--</script>--%>