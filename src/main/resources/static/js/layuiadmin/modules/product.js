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

    //商品管理
    table.render({
        elem: '#LAY-user-manage'
        , url: '/product/select' //模拟接口
        ,size: 'lg' //大尺寸的表格
       // ,skin:'row'
        , toolbar: ['filter', 'print', 'exports']  //开启工具栏
        , totalRow: true //开启合计行
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'pid', width: 100, title: 'pid', sort: true, align: 'center', totalRowText: '合计：'}
            , {field: 'pname', title: '商品名', Width: 70, align: 'center'}
            , {field: 'marketPrice', title: '市场价', Width: 200, align: 'center', totalRow: true}
            //,{field: 'avatar', title: '头像', width: 100, templet: '#imgTpl'}
            , {field: 'shopPrice', title: '商城价', align: 'center', totalRow: true}
            , {field: 'pimage', title: '图片', align: 'center', templet: '#imgTpl'}
            , {field: 'pdate', width: 200, title: '上架时间', align: 'center'}
           /* , {field: 'cid', title: '所属', align: 'center'}*/
            , {field: 'pdesc', title: '描述', sort: true, align: 'center'}
            , {field: 'pflag', title: '状态', sort: true, align: 'center'}
            , {field: 'pstock', title: '库存', sort: true, align: 'center'}
            , {field: 'deleteFlag', title: '标记', align: 'center'}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-webuser'}
        ]]
        , page: true
        , limit: 8
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
                , title: '编辑商品'
                , content: '/product/selectById/id=' + data.pid
                , maxmin: true
                , area: ['500px', '450px']
                //, btn: ['确定', '取消']
               /* , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submitID = 'LAY-user-front-submit'
                        , submit = layero.find('iframe').contents().find('#' + submitID);

                    //监听提交
                    iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                        var field = data.field; //获取提交的字段

                        //提交 Ajax 成功后，静态更新表格中的数据

                    });

                    submit.trigger('click');
                }*/

            });
        }
    });


    exports('product', {})
});