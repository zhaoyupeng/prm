<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#projectUserAddForm').form({
            url: '${path}/projectUser/add',
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
                    //之所以能在这里调用到parent.$.modalDialog.openner_dataGrid这个对象，是因为user.jsp页面预定义好了
                    parent.$.modalDialog.openner_dataGrid.datagrid('reload');
                    parent.$.modalDialog.handler.dialog('close');
                } else {
                    var form = $('#projectUserAddForm');
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
            iconCls: 'fi-torso-business'
        });

        //项目赋值
        $('#pkProject_').attr("value",currentProject.name);
        $('#pkProject').attr("value",currentProject.id);
    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;">
        <form id="projectUserAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>所属项目组</td>
                    <td><input name="pkProject_" id="pkProject_" type="text" class="easyui-validatebox span2"
                               data-options="required:true"  readonly="true">
                        <input name="pkProject" id="pkProject" type="text" class="easyui-validatebox span2"
                               data-options="required:true"  readonly="true" style="display: none">
                    </td>
                    <td>项目组成员</td>
                    <td><select name="pkGrouper" id="pkGrouper" class="easyui-validatebox"
                                data-options="required:true" style="width: 140px; height: 29px;"></select></td>
                </tr>
            </table>
        </form>
    </div>
</div>