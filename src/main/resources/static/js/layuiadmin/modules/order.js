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
        , url: '/backOrder/selectAllNotice' //模拟接口
        ,size: 'lg' //大尺寸的表格
       // ,skin:'row'
        , toolbar: ['filter', 'print', 'exports']  //开启工具栏
        , totalRow: true //开启合计行
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'orderId', width: 100, title: '订单号', sort: true, align: 'center', totalRowText: '合计：'}
            , {field: 'orderContent', title: '订单名称', Width: 70, align: 'center'}
            , {field: 'totalPrice', title: '订单总价', Width: 70, align: 'center',totalRow: true}
            , {field: 'payStatus', title: '支付类型', Width: 70, align: 'center',templet: function (d) {
                    return d.payStatus == 0 ? '待支付' : '已支付';
                }}
            , {field: 'orderStatus', title: '订单状态', Width: 200, align: 'center',templet: function (d) {
                   // return d.orderStatus == 0 ? '待配货' : '已配货';
                    if(d.orderStatus == 0){
                        return '待配货';
                    }else if(d.orderStatus == 1){
                        return '已配货';
                    }else if(d.orderStatus == 2){
                        return '出库';
                    }else if(d.orderStatus == 3){
                        return '已收货';
                    }

                }}
            , {field: 'userName', title: '收货人', align: 'center'}
            , {field: 'userPhone', title: '电话', align: 'center'}
            , {field: 'userAddress', title: '收货地址', align: 'center'}
            , {field: 'logistics', title: '物流单号', align: 'center',templet:'#imgTpl'}
            , {field: 'createTime', title: '创建时间', align: 'center'}
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
                        url: '/backOrder/closeOrder/id=' + data.orderId,
                        data: data.pid,
                        type: 'post',
                        success: function (res) {
                            if (res.success) {
                                table.reload('LAY-user-manage');
                                layer.msg('已删除');
                                layer.close(index);
                            }else if(res.error==false){
                                table.reload('LAY-user-manage');
                                layer.msg(res.msg);
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
                , title: '编辑订单'
                , content: '/backOrder/selectById/id=' + data.orderId
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
                            url: '/backOrder/updateById',
                            dateType: 'json',
                            data: field,
                            type: 'post',
                            success: function (res) {
                                if (res.success) {
                                    layer.msg('更新成功');
                                    table.reload('LAY-user-manage');//数据刷新
                                    layer.close(index);//关闭弹层
                                }else {
                                    layer.msg('更新失败');
                                    table.reload('LAY-user-manage');//数据刷新
                                    layer.close(index);//关闭弹层
                                }
                            }
                        });
                    });

                    submit.trigger('click');
                }

            });
        }else if(obj.event === 'logistics'){
            var data = obj.data;
            $.ajax({
                url: '/logistics',
                 data:{
                     logistics:data.logistics,
                     LogCompany:null,
                 },
                dateType: 'json',
                success: function (res) {
                    var str = '';
                    if (res.status == 0) {
                        $.each(res.result.list, function (k, v) {
                            str += ' <li class="layui-timeline-item">\n' +
                                '                        <i class="layui-icon layui-timeline-axis">&#xe63f;</i>\n' +
                                '                        <div class="layui-timeline-content layui-text">\n' +
                                '                            <h3 class="layui-timeline-title">' + v.time + '</h3>\n' +
                                '                            <p>' + v.status + '</p>\n' +
                                '                        </div>\n' +
                                '</li>\n';
                        })
                        layer.open({
                            type: 1,
                            shade: false,
                            title: '查看物流', //不显示标题
                            area: ['500px', '450px'], //宽高
                            content: str, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                            cancel: function(){
                                layer.msg('查看成功', {time: 2000, icon:6});
                            }
                        });
                    }else {

                    }

                    /*if (res.success) {
                        layer.msg('更新成功');
                        table.reload('LAY-user-manage');//数据刷新
                        layer.close(index);//关闭弹层
                    }else {
                        layer.msg('更新失败');
                        table.reload('LAY-user-manage');//数据刷新
                        layer.close(index);//关闭弹层
                    }*/
                }
            });
            /*var data = obj.data;
            layer.open({
                type: 1,
                shade: false,
                title: '物流查询',
                content: data.logistics, //捕获的元素，注意：最好该指定的元素要存放在body最外层，否则可能被其它的相对元素所影响
                cancel: function(){
                    layer.msg('捕获就是从页面已经存在的元素上，包裹layer的结构', {time: 5000, icon:6});
                }
            });*/
        }
    });


    exports('order', {})
});