<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var projectUserDataGrid;
    var projectTree;
    var currentProject;
    $(function () {
        projectTree = $('#projectTree').tree({
            url: '${path }/project/tree',
            parentField: 'pid',
            lines: true,
            onClick: function (node) {
                currentProject = {'id': node.id, 'name': node.text};
                projectUserDataGrid.datagrid('load', {
                    pkProject: node.id
                });
            }
        });
        projectUserDataGrid = $('#projectUserDataGrid').datagrid({
            url: '${path}/projectUser/dataGrid',
            fit : true,
//            fitColumns:false,
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
                title: '项目组成员',
                field: 'pkGrouper',
                sortable: true
            }, {
                width: '140',
                title: '所属项目组',
                field: 'pkProject',
                sortable: true
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
                    <shiro:hasPermission name="/projectUser/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="projectUser-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="projectUserEditFun(\'{0}\');" >编辑</a>', row.id);
                    </shiro:hasPermission>
                    <shiro:hasPermission name="/projectUser/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="projectUser-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="projectUserDeleteFun(\'{0}\');" >删除</a>', row.id);
                    </shiro:hasPermission>
                    return str;
                }
            }]],
            onLoadSuccess: function (data) {
                $('.projectUser-easyui-linkbutton-edit').linkbutton({text: '编辑'});
                $('.projectUser-easyui-linkbutton-del').linkbutton({text: '删除'});
            },
            toolbar: '#projectUserToolbar'
        });
    });

    /**
     * 添加框
     * @param url
     */
    function projectUserAddFun() {
        parent.$.modalDialog({
            title: '添加',
            width: 700,
            height: 600,
            href: '${path}/projectUser/addPage',
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = projectUserDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#projectUserAddForm');
                    f.submit();
                }
            }]
        });
    }


    /**
     * 编辑
     */
    function projectUserEditFun(id) {
        if (id == undefined) {
            var rows = projectUserDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {
            projectUserDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.modalDialog({
            title: '编辑',
            width: 700,
            height: 600,
            href: '${path}/projectUser/editPage?id=' + id,
            buttons: [{
                text: '确定',
                handler: function () {
                    parent.$.modalDialog.openner_dataGrid = projectUserDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                    var f = parent.$.modalDialog.handler.find('#projectUserEditForm');
                    f.submit();
                }
            }]
        });
    }


    /**
     * 删除
     */
    function projectUserDeleteFun(id) {
        if (id == undefined) {//点击右键菜单才会触发这个
            var rows = projectUserDataGrid.datagrid('getSelections');
            id = rows[0].id;
        } else {//点击操作里面的删除图标会触发这个
            projectUserDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
        }
        parent.$.messager.confirm('询问', '您是否要删除当前角色？', function (b) {
            if (b) {
                progressLoad();
                $.post('${path}/projectUser/delete', {
                    id: id
                }, function (result) {
                    if (result.success) {
                        parent.$.messager.alert('提示', result.msg, 'info');
                        projectUserDataGrid.datagrid('reload');
                    }
                    progressClose();
                }, 'JSON');
            }
        });
    }


    /**
     * 清除
     */
    function projectUserCleanFun() {
        $('#projectUserSearchForm input').val('');
        projectUserDataGrid.datagrid('load', {});
    }
    /**
     * 搜索
     */
    function projectUserSearchFun() {
        projectUserDataGrid.datagrid('load', $.serializeObject($('#projectUserSearchForm')));
    }
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="projectUserSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" placeholder="搜索条件"/></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-magnifying-glass',plain:true"
                           onclick="projectUserSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton"
                           data-options="iconCls:'fi-x-circle',plain:true" onclick="projectUserCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <div data-options="region:'center',border:true,title:'用户列表'">
        <table id="projectUserDataGrid" data-options="fit:true,border:false"></table>
    </div>
    <div data-options="region:'west',border:true,split:false,title:'项目信息'" style="width:150px;overflow: hidden; ">
        <ul id="projectTree" style="width:160px;margin: 10px 10px 10px 10px" class="fi-laptop"></ul>
    </div>
</div>
<div id="projectUserToolbar" style="display: none;">
    <shiro:hasPermission name="/projectUser/add">
        <a onclick="projectUserAddFun();" href="javascript:void(0);" class="easyui-linkbutton"
           data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>