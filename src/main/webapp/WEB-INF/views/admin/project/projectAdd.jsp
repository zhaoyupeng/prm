<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    $(function () {

        $('#projectAddForm').form({
            url: '${path}/project/add',
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
                    var form = $('#projectAddForm');
                    parent.$.messager.alert('错误', eval(result.msg), 'error');
                }
            }
        });

        $('#manager').combotree({
            url: '${path }/user/tree',
            parentField: 'pid',
            multiple: false,
            required: true,
            panelHeight: 'auto',
            iconCls: 'fi-male'
        });
        $('#pkParent').combotree({
            url: '${path }/project/tree',
            parentField: 'pid',
            multiple: false,
            required: false,
            panelHeight: 'auto',
            iconCls: 'fi-laptop'
        });

    });
</script>
<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'center',border:false" style="overflow: hidden;padding: 3px;">
        <form id="projectAddForm" method="post">
            <table class="grid">
                <tr>
                    <td>项目名称</td>
                    <td><input name="id" type="hidden" value="${project.id}">
                        <input name="name" type="text" placeholder="请输入名称" class="easyui-validatebox"
                               data-options="required:true" value="${project.name}"></td>
                    <td>项目编码</td>
                    <td>
                        <input name="code" type="text" placeholder="请输入编码" class="easyui-validatebox"
                               data-options="required:true" value="${project.code}"></td>
                </tr>
                <tr>
                    <td>合同编码</td>
                    <td><input name="contractCode" type="text" placeholder="请输入合同编码" class="easyui-validatebox"
                               data-options="required:true" value="${project.contractCode}"></td>
                    <td>合同人天</td>
                    <td><input name="contractUseddays" type="text" placeholder="请输入合同人天" class="easyui-validatebox"
                               data-options="required:true" value="${project.contractUseddays}"></td>
                </tr>
                <tr>
                    <td>开发经理</td>
                    <td><select name="manager" id="manager" class="easyui-validatebox"
                                data-options="required:true" style="width: 140px; height: 29px;"></select></td>
                    <td>上级项目</td>
                    <td><select name="pkParent" id="pkParent" class="easyui-validatebox"
                                data-options="required:true" style="width: 140px; height: 29px;"></select>
                    </td>
                </tr>
                <tr>
                    <td>状态</td>
                    <td>
                        <select id="editStatus" name="status" class="easyui-combobox"
                                data-options="width:140,height:29,editable:false,panelHeight:'auto'">
                            <option value="0">正常</option>
                            <option value="1">停用</option>
                        </select>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>