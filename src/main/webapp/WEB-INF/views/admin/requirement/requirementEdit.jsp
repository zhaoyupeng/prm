<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {
        $('#requirementEditForm').form({
            url: '${path}/requirement/edit',
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
                    var form = $('#requirementEditForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });

        $("#editStatus").val('${requirement.status}');

        $('#pkProject').combotree({
            url: '${path }/project/tree',
            parentField: 'pid',
            multiple: false,
            required: true,
            panelHeight: 'auto',
            iconCls: 'fi-laptop',
            value:'${requirement.pkProject}'
        });
        $('#pkParent').combotree({
            url: '${path }/requirement/tree',
            parentField: 'pid',
            multiple: false,
            required: false,
            panelHeight: 'auto',
            iconCls: 'fi-comment-quotes',
            value:'${requirement.pkParent}'
        });

    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" title="" style="overflow: hidden;padding: 3px;">
        <form id="requirementEditForm" method="post">
            <table class="grid">
                <tr>
                    <td>上级需求</td>
                    <td>
                        <input name="id" type="hidden" value="${requirement.id}">
                        <select name="pkParent" id="pkParent" class="easyui-validatebox"
                                data-options="required:true" style="width: 140px; height: 29px;"
                        ></select></td>
                    <td>所属项目</td>
                    <td><select name="pkProject" id="pkProject" class="easyui-validatebox"
                                data-options="required:true" style="width: 140px; height: 29px;"
                    ></select></td>
                </tr>
                <tr>
                    <td>需求简称</td>
                    <td><input name="name" type="text" placeholder="请输入名称" class="easyui-validatebox span2"
                               data-options="required:true" value="${requirement.name}"></td>
                    <td>需求人天</td>
                    <td><input name="requiredays" type="text" placeholder="请输入需求人天" class="easyui-validatebox span2"
                               data-options="required:true" value="${requirement.requiredays}"></td>
                </tr>
                <tr>

                    <td>需求明细</td>
                    <td colspan="3"><input style="width: 500px" name="requireinfo" type="text" placeholder="请输入需求明细" class="easyui-validatebox span2"
                               data-options="required:true" value="${requirement.requireinfo} "></td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <select id="editStatus" name="status" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'"
                                value="${requirement.status}">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>