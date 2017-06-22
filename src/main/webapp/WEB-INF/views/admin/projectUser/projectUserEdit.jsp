<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#projectUserEditForm').form({
            url: '${path}/projectUser/edit',
            onSubmit: function () {
                progressLoad();
                var isValid = $(this).form('validate');
                if (!isValid) {
                    progressClose();
                }
                return isValid;
            },
            success: function (result) {
                progressClose();
                result = $.parseJSON(result);
                if (result.success) {
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');//之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#projectUserEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });


        $('#pkGrouper').combotree({
            url: '${path }/user/tree',
            parentField: 'pid',
            multiple: false,
            required: true,
            panelHeight: 'auto',
            iconCls: 'fi-torso-business',
            value:"${projectUser.pkGrouper}"

        });

        $('#pkProject').combotree({
            url: '${path }/project/tree',
            parentField: 'pid',
            multiple: false,
            required: true,
            panelHeight: 'auto',
            iconCls: 'fi-laptop',
            value:"${projectUser.pkProject}"

        });
    });
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="projectUserEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>所属项目</td>
                    <td><input name="id" type="hidden" value="${projectUser.id}">
                        <select name="pkProject" id="pkProject" placeholder="请选择所属项目" class="easyui-validatebox"
                                data-options="required:true" style="width: 140px; height: 29px;"
                                <%--value="${projectUser.pkProject}"--%>></select>
                    </td>
                    <td>项目组成员</td>
                    <td><select id="pkGrouper" name="pkGrouper" placeholder="请选择项目组成员"
                                class="easyui-validatebox"
                                data-options="required:true" style="width: 140px; height: 29px;"
                                <%--value="${projectUser.pkGrouper}"--%>></select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>