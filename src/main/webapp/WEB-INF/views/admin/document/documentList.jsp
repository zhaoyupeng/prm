<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="/commons/global.jsp" %>
<script type="text/javascript">
    var documentDataGrid;
    $(function() {
        documentDataGrid = $('#documentDataGrid').datagrid({
        url : '${path}/document/dataGrid',
        striped : true,
        rownumbers : true,
        pagination : true,
        singleSelect : true,
        idField : 'id',
        sortName : 'id',
        sortOrder : 'asc',
        pageSize : 20,
        pageList : [ 10, 20, 30, 40, 50, 100, 200, 300, 400, 500],
        frozenColumns : [ [ {
            width : '60',
            title : '编号',
            field : 'id',
            sortable : true
        }, {
            width : '60',
            title : '状态',
            field : 'status',
            sortable : true,
            formatter : function(value, row, index) {
                switch (value) {
                case 0:
                    return '正常';
                case 1:
                    return '停用';
                }
            }
        }, {
            width : '140',
            title : '创建时间',
            field : 'createTime',
            sortable : true
        }, {
            field : 'action',
            title : '操作',
            width : 200,
            formatter : function(value, row, index) {
                var str = '';
                <shiro:hasPermission name="/document/edit">
                    str += $.formatString('<a href="javascript:void(0)" class="document-easyui-linkbutton-edit" data-options="plain:true,iconCls:\'fi-pencil icon-blue\'" onclick="documentEditFun(\'{0}\');" >编辑</a>', row.id);
                </shiro:hasPermission>
                <shiro:hasPermission name="/document/delete">
                    str += '&nbsp;&nbsp;|&nbsp;&nbsp;';
                    str += $.formatString('<a href="javascript:void(0)" class="document-easyui-linkbutton-del" data-options="plain:true,iconCls:\'fi-x icon-red\'" onclick="documentDeleteFun(\'{0}\');" >删除</a>', row.id);
                </shiro:hasPermission>
                return str;
            }
        } ] ],
        onLoadSuccess:function(data){
            $('.document-easyui-linkbutton-edit').linkbutton({text:'编辑'});
            $('.document-easyui-linkbutton-del').linkbutton({text:'删除'});
        },
        toolbar : '#documentToolbar'
    });
});

/**
 * 添加框
 * @param url
 */
function documentAddFun() {
    parent.$.modalDialog({
        title : '添加',
        width : 700,
        height : 600,
        href : '${path}/document/addPage',
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = documentDataGrid;//因为添加成功之后，需要刷新这个treeGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#documentAddForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 编辑
 */
function documentEditFun(id) {
    if (id == undefined) {
        var rows = documentDataGrid.datagrid('getSelections');
        id = rows[0].id;
    } else {
        documentDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
    }
    parent.$.modalDialog({
        title : '编辑',
        width : 700,
        height : 600,
        href :  '${path}/document/editPage?id=' + id,
        buttons : [ {
            text : '确定',
            handler : function() {
                parent.$.modalDialog.openner_dataGrid = documentDataGrid;//因为添加成功之后，需要刷新这个dataGrid，所以先预定义好
                var f = parent.$.modalDialog.handler.find('#documentEditForm');
                f.submit();
            }
        } ]
    });
}


/**
 * 删除
 */
 function documentDeleteFun(id) {
     if (id == undefined) {//点击右键菜单才会触发这个
         var rows = documentDataGrid.datagrid('getSelections');
         id = rows[0].id;
     } else {//点击操作里面的删除图标会触发这个
         documentDataGrid.datagrid('unselectAll').datagrid('uncheckAll');
     }
     parent.$.messager.confirm('询问', '您是否要删除当前角色？', function(b) {
         if (b) {
             progressLoad();
             $.post('${path}/document/delete', {
                 id : id
             }, function(result) {
                 if (result.success) {
                     parent.$.messager.alert('提示', result.msg, 'info');
                     documentDataGrid.datagrid('reload');
                 }
                 progressClose();
             }, 'JSON');
         }
     });
}


/**
 * 清除
 */
function documentCleanFun() {
    $('#documentSearchForm input').val('');
    documentDataGrid.datagrid('load', {});
}
/**
 * 搜索
 */
function documentSearchFun() {
     documentDataGrid.datagrid('load', $.serializeObject($('#documentSearchForm')));
}
</script>

<div class="easyui-layout" data-options="fit:true,border:false">
    <div data-options="region:'north',border:false" style="height: 30px; overflow: hidden;background-color: #fff">
        <form id="documentSearchForm">
            <table>
                <tr>
                    <th>名称:</th>
                    <td><input name="name" placeholder="搜索条件"/></td>
                    <td>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-magnifying-glass',plain:true" onclick="documentSearchFun();">查询</a>
                        <a href="javascript:void(0);" class="easyui-linkbutton" data-options="iconCls:'fi-x-circle',plain:true" onclick="documentCleanFun();">清空</a>
                    </td>
                </tr>
            </table>
        </form>
     </div>
 
    <div data-options="region:'center',border:false">
        <table id="documentDataGrid" data-options="fit:true,border:false"></table>
    </div>
</div>
<div id="documentToolbar" style="display: none;">
    <shiro:hasPermission name="/document/add">
        <a onclick="documentAddFun();" href="javascript:void(0);" class="easyui-linkbutton" data-options="plain:true,iconCls:'fi-page-add'">添加</a>
    </shiro:hasPermission>
</div>