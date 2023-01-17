/**

 @Name：layuiAdmin 首页配置（轮播图配置、、、热销单品配置）
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */


layui.define(['table', 'form'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form;

    //轮播图管理
    table.render({
        elem: '#LAY-user-manage'
        //,url: layui.setter.base + 'json/useradmin/webuser.js' //模拟接口
        , url: 'notice/selectAllNotice' //模拟接口
        , toolbar: ['filter', 'print', 'exports']  //开启工具栏
        , totalRow: true //开启合计行
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'nId',title: 'ID',  align: 'center'}
            , {field: 'nContent',title: '公告内容',  align: 'center'}
            , {field: 'releaseName', title: '创建者', align: 'center'}
            , {field: 'createTime', title: '创建时间', align: 'center'}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-webuser'}
        ]]
        , height: 'full-220'
        , text: '对不起，加载出现异常！'
    });

    //监听工具条  后台删除工具条  右边删除（有个更新和删除那个）    list.html是头顶删除
    table.on('tool(LAY-user-manage)', function (obj) {
        var data = obj.data;
        //var submitID = data.userId
        console.log(data.nId);//得出id
        console.log(data);
        var nId=data.nId
        if (obj.event === 'del') {
            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: '/notice/noticeDeleteById/'+nId,
                        data: nId,
                        type: 'post',
                        success: function (res) {
                            if (res.success) {
                                table.reload('LAY-user-manage');
                                layer.msg('已删除',{icon:1});
                                layer.close(index);
                            }else {
                                layer.msg('删除失败',{icon:2});
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
                , title: '编辑公告'
                , content: '/notice/selectById/id=' + data.nId
                , maxmin: true
                , area: ['430px', '250px']
                , btn: ['确定', '取消']
                 , yes: function (index, layero) {
                     var iframeWindow = window['layui-layer-iframe' + index]
                         , submitID = 'LAY-user-front-submit'
                         , submit = layero.find('iframe').contents().find('#' + submitID);
                    console.log(iframeWindow);
                    //监听提交
                     iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                         var field = data.field; //获取提交的字段
                         console.log(field.nId); //得到当前表单全部字段
                         console.log(field.nContent); //得到当前表单全部字段
                         $.ajax({
                             url: '/notice/noticeUpdateById',
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


    exports('noticeConfiguration', {})
});