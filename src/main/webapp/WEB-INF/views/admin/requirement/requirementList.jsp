<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var requirementDataGrid;
    var projectTree;
    $(function () {
        projectTree = $('#projectTree').tree({
            url: '${path }/project/tree',
            parentField: 'pid',
            lines: true,
            onClick: function (node) {
                requirementDataGrid.datagrid('load', {
                    pkProject: node.id
                });
            }
        });

        requirementDataGrid = $('#requirementDataGrid').datagrid({
            url: '${path}/requirement/dataGrid',
            fit:true,
            striped: true,
            rownumbers: true,
            pagination: true,
            singleSelect: true,
            idField: 'id',
            sortName: 'id',
            sortOrder: 'asc',
            pageSize: 20,
            pageList: [10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
            frozenColumns: [[{
                width: '60',
                title: '编号',
                field: 'id',
                sortable: true
            }, {
                width: '140',
                title: '所属项目',
                field: 'pkProject',
                sortable: true
            }, {
                width: '140',
                title: '需求人天',
                field: 'requiredays',
                sortable: true
            }, {
                width: '140',
                title: '需求明细',
                field: 'requireinfo',
                sortable: true
            }, {
                width: '140',
                title: '需求简称',
                field: 'name',
                sortable: true
            }, {
                width: '140',
                title: '上级需求',
                field: 'pkParent',
                sortable: true
            }, {
                width: '60',
                title: '状态',
                field: 'status',
                sortable: true,
                formatter: function (value, row, index) {
                    switch (value) {
                        case 0:
                            return '正常';
                        case 1:
                            return '停用';
                    }
                }
            }, {
                width: '140',
                title: '创建时间',
                field: 'createTime',
                sortable: true
            }, {
                width: '140',
                title: '修改时间',
                field: 'updateTime',
                sortable: true
            }, {
                field: 'action',
                title: '操作',
                width: 200,
                formatter: function (value, row, index) {
                    var str = '';
                    <shiro:hasPermission name="/requirement/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="requirement-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="requirementEditFun(\'{0}\');" >编辑</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/requirement/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="requirement-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="requirementDeleteFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.requirement-easyui-linkbutton-edit').linkbutton({text: '编辑'});
                $('.requirement-easyui-linkbutton-del').linkbutton({text: '删除'});
            },
            toolbar: '#requirementToolbar'
        });
    });

    /**
     * 添加框
     * @param url
     */
    function requirementAddFun() {
        parent.$.modalDialog({
            title: '添加',
            width: 700,
            height: 600,
            href: '${path}/requirement/addPage',
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = requirementDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#requirementAddForm');
                    f.submit();
                }
            }]
        });
    }


    /**
     * 编辑
     */
    function requirementEditFun(id) {
        if (id == undefined) {
            var rows = requirementDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            requirementDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '编辑',
            width: 700,
            height: 600,
            href: '${path}/requirement/editPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = requirementDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#requirementEditForm');
                    f.submit();
                }
            }]
        });
    }


    /**
     * 删除
     */
    function requirementDeleteFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = requirementDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            requirementDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前角色？', function (b) {
            if (b) {
                progressLoad();
                $.post('${path}/requirement/delete', {
                    id: id
                }, function (result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        requirementDataGrid.datagrid('reload');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }


    /**
     * 清除
     */
    function requirementCleanFun() {
        $('#requirementSearchForm input').val('');
        requirementDataGrid.datagrid('load', {});
    }
    /**
     * 搜索
     */
    function requirementSearchFun() {
        requirementDataGrid.datagrid('load', $.serializeObject($('#requirementSearchForm')));
    }
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="requirementSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" placeholder="搜索条件"/></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-magnifying-glass',plain:true"
                           onclick="requirementSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="requirementCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div data-options="region:'center',border:true,title:'需求列表',fit:true">
        <table id="requirementDataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div data-options="region:'west',border:true,split:false,title:'项目信息'" style="width:150px;overflow: hidden; ">
        <ul id="projectTree" style="width:160px;margin: 10px 10px 10px 10px" class="fi-laptop"></ul>
    </div>
</div>
<div id="requirementToolbar" style="display: none;">
    <shiro:hasPermission name="/requirement/add">
        <a onclick="requirementAddFun();" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>