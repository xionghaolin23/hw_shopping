/**

 @Name：layuiAdmin 用户管理 管理员管理 角色管理
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */


layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    //用户管理
    table.render({
        elem: '#LAY-user-manage'
        , url: '/sku/selectAllSku' //模拟接口
        ,size: 'lg' //大尺寸的表格
        ,skin:'line'
        , toolbar: ['filter', 'print', 'exports']  //开启工具栏
        , totalRow: true //开启合计行
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'skuId', width: 100, title: 'ID', sort: true, align: 'center', totalRowText: '合计：'}
            , {field: 'spuId', title: 'spuId', Width: 70, align: 'center'}
            , {field: 'spuName', title: 'spu名称', Width: 70, align: 'center'}
            , {field: 'skuColor', title: '颜色', Width: 200, align: 'center', totalRow: true}
            //,{field: 'avatar', title: '头像', width: 100, templet: '#imgTpl'}
            , {field: 'skuVersion', title: '版本', align: 'center'}
            , {field: 'skuService', title: '服务', align: 'center'}
            , {field: 'skuPrice', title: '价格', align: 'center'}
            , {field: 'skuDate', title: '添加时间', align: 'center'}
            , {field: 'updateTime', title: '更新时间', align: 'center'}
            , {field: 'isHot', title: '热门', align: 'center'}
            , {field: 'skuSort', title: '排序', align: 'center'}
            , {field: 'skuDesc', title: '描述', align: 'center'}
            , {field: 'skuFlag', title: '上架', align: 'center'}
            , {field: 'cid', title: 'cid', align: 'center'}
            , {field: 'skuStock', title: '库存', align: 'center'}
            , {field: 'deleteFlag', title: '标记', align: 'center'}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-webuser'}
        ]]
        , page: true
        , limit: 4
        , height: 'full-220'
        , text: '对不起，加载出现异常！'
        , request: {
            pageName: 'pageNum' //页码的参数名称，默认：page
            , limitName: 'pageSize' //每页数据量的参数名，默认：limit
        }
    });

    //监听工具条  后台删除工具条  右边删除（有个更新和删除那个）    list.html是头顶删除
    table.on('tool(LAY-user-manage)', function (obj) {
        var data = obj.data;
        //var submitID = data.userId
        if (obj.event === 'del') {
            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: '/product/productDeleteById/id=' + data.pid,
                        data: data.pid,
                        type: 'post',
                        success: function (res) {
                            if (res.success) {
                                table.reload('LAY-user-manage');
                                layer.msg('已删除');
                                layer.close(index);
                            }
                        }
                    });
                    obj.del();
                    layer.close(index);
                });
            });
        } else if (obj.event === 'edit') {
            var tr = $(obj.tr);
            // var data = obj.data;
            layer.open({
                type: 2
                , title: '编辑用户'
                , content: '/adminUser/selectById/id=' + data.userId
                , maxmin: true
                , area: ['500px', '450px']
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submitID = 'LAY-user-front-submit'
                        , submit = layero.find('iframe').contents().find('#' + submitID);

                    //监听提交
                    iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                        var field = data.field; //获取提交的字段

                        //提交 Ajax 成功后，静态更新表格中的数据
                        $.ajax({
                            url: '/adminUser/updateById',
                            dateType: 'json',
                            data: field,
                            type: 'post',
                            success: function (res) {
                                if (res.success) {
                                    layer.msg('更新成功');
                                    table.reload('LAY-user-manage');//数据刷新
                                    layer.close(index);//关闭弹层
                                }
                            }
                        });
                    });

                    submit.trigger('click');
                }

            });
        }
    });


    exports('sku', {})
});