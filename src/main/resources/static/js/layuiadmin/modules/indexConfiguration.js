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
        ,even: true //开启隔行背景
        ,size: 'lg' //大尺寸的表格
        //,url: layui.setter.base + 'json/useradmin/webuser.js' //模拟接口
        , url: 'product/indexCarouselList' //模拟接口
        , toolbar: ['filter', 'print', 'exports']  //开启工具栏
        , totalRow: true //开启合计行
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'carouselId', width: 100, title: 'ID',  align: 'center'}
            , {field: 'carouselUrl', title: '轮播图', /*style:"height:100px",*/ align: 'center', templet: '#imgTpl'}
            , {field: 'redirectUrl', title: '跳转链接', Width: 200, align: 'center'}
            , {field: 'carouselRank', title: '排序值', align: 'center',sort: true}
            , {field: 'createTime', title: '创建时间', align: 'center'}
            , {field: 'updateTime', title: '更新时间', align: 'center'}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-webuser'}
        ]]
        , page: true
        , limit: 6
        , toolbar: ['filter', 'print', 'exports']
        , height: 'full-220'
        , text: {
            none: '暂无相关数据' //默认：无数据。注：该属性为 layui 2.2.5 开始新增
        }
        , request: {
            pageName: 'pageNum' //页码的参数名称，默认：page
            , limitName: 'pageSize' //每页数据量的参数名，默认：limit
        }

    });

    //监听工具条  后台删除工具条  右边删除（有个更新和删除那个）    list.html是头顶删除
    table.on('tool(LAY-user-manage)', function (obj) {
        var data = obj.data;
        //var submitID = data.userId
        console.log(data.carouselId);//得出id
        console.log(data);
        if (obj.event === 'del') {
            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: '/product/carouselDeleteById/id=' + data.carouselId,
                        data: data.userId,
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
                , title: '编辑轮播图'
                , content: '/product/CarouseSelectById/id=' + data.carouselId
                , maxmin: true
                , area: ['500px', '450px']
                //, btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submitID = 'LAY-user-front-submit'
                        , submit = layero.find('iframe').contents().find('#' + submitID);

                    //监听提交
                    iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                        var field = data.field; //获取提交的字段
                        console.log(field); //得到当前表单全部字段
                        //提交 Ajax 成功后，静态更新表格中的数据
                        let formData = new FormData(data.form);
                        console.log(formData)
                     /*   $.ajax({
                            url: '/product/CarouselUpdateById',
                            contentType: false,//传递的东西有很多种数据格式的时候 写false
                            data: formData,
                            processData: false,
                            type: 'post',
                            success: function (res) {
                                if (res.success) {
                                    layer.msg('更新成功');
                                    table.reload('LAY-user-manage');//数据刷新
                                    layer.close(index);//关闭弹层
                                }
                            }
                        });*/
                    });

                    submit.trigger('click');
                }

            });
        }
    });


    exports('indexConfiguration', {})
});