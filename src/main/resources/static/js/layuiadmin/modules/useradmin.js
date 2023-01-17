/**

 @Name：layuiAdmin 用户管理 管理员管理 角色管理
 @Author：star1029
 @Site：http://www.layui.com/admin/
 @License：LPPL

 */


layui.define(['table', 'form', 'laypage'], function (exports) {
    var $ = layui.$
        , table = layui.table
        , form = layui.form
        , laypage = layui.laypage;

    //用户管理
    table.render({
        elem: '#LAY-user-manage'
        //,url: layui.setter.base + 'json/useradmin/webuser.js' //模拟接口
        , url: 'adminUser/selectUser' //模拟接口
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'userId', width: 100, title: 'ID', sort: true, align: 'center'}
            , {field: 'userName', title: '用户名', Width: 70, align: 'center'}
            , {field: 'password', title: '密码', Width: 200, align: 'center'}
            //,{field: 'avatar', title: '头像', width: 100, templet: '#imgTpl'}
            , {field: 'mobile', title: '手机', align: 'center'}
            , {field: 'email', title: '邮箱', align: 'center'}
            , {field: 'gender', width: 80, title: '性别', align: 'center'}
            , {field: 'name', title: '真实姓名', align: 'center'}
            , {field: 'birthday', title: '生日', sort: true, align: 'center'}
            , {field: 'registerTime', title: '注册时间', sort: true, align: 'center'}
            , {field: 'loginIp', title: '登录ip', align: 'center'}
            , {
                field: 'isSys', title: '角色', align: 'center', templet: function (d) {
                    return d.isSys == 0 ? '普通用户' : '管理员';
                }
            }
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-webuser'}
        ]]

        , page: true
        , limit: 8
        , toolbar: ['filter', 'print', 'exports']
        , height: 'full-350'
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
        console.log(data.userId);//得出id
        console.log(data);
        if (obj.event === 'del') {
            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                layer.confirm('真的删除行么', function (index) {
                    $.ajax({
                        url: '/adminUser/deleteById/id=' + data.userId,
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
                , title: '编辑用户'
                , content: '/adminUser/selectById/id=' + data.userId
                , maxmin: true
                , area: ['500px', '450px']
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submitID = 'LAY-user-front-submit'
                        , submit = layero.find('iframe').contents().find('#' + submitID);
                    console.log(iframeWindow);
                    //监听提交
                    iframeWindow.layui.form.on('submit(' + submitID + ')', function (data) {
                        var field = data.field; //获取提交的字段
                        console.log(field);
                        console.log(1);
                        //提交 Ajax 成功后，静态更新表格中的数据
                        $.ajax({
                            url: '/adminUser/updateById',
                            dateType: 'json',
                            data: field,
                            type: 'post',
                            success: function (res) {
                                if (res.success) {
                                    layer.msg('更新成功');
                                }
                            }
                        });
                        table.reload('LAY-user-manage');//数据刷新
                        layer.close(index);//关闭弹层
                    });

                    submit.trigger('click');
                }

            });
        }
    });






    //管理员管理
    table.render({
        elem: '#LAY-user-back-manage'
        , url: 'adminUser/selectAdminer' //模拟接口
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'userId', width: 100, title: 'ID', sort: true, align: 'center'}
            , {field: 'userName', title: '用户名', minWidth: 100, align: 'center'}
            , {field: 'password', title: '密码', minWidth: 100, align: 'center'}
            //,{field: 'avatar', title: '头像', width: 100, templet: '#imgTpl'}
            , {field: 'mobile', title: '手机', align: 'center'}
            , {field: 'email', title: '邮箱', align: 'center'}
            , {field: 'gender', width: 80, title: '性别', align: 'center'}
            , {field: 'name', title: '真实姓名', align: 'center'}
            , {field: 'birthday', title: '生日', sort: true, align: 'center'}
            , {field: 'registerTime', title: '注册时间', sort: true, align: 'center'}
            , {field: 'loginIp', title: '登录ip', align: 'center'}
            , {
                field: 'isSys', title: '角色', align: 'center', templet: function (d) {
                    return d.isSys == 0 ? '普通用户' : '管理员';
                }
            }
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-admin'}
        ]],
        page: true
        , limit: 4
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

    //监听工具条
    table.on('tool(LAY-user-back-manage)', function (obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.prompt({
                formType: 1
                , title: '敏感操作，请验证口令'
            }, function (value, index) {
                layer.close(index);
                layer.confirm('确定删除此管理员？', function (index) {
                    $.ajax({
                        url: '/adminUser/deleteById/id=' + data.userId,
                        data: data.userId,
                        type: 'post',
                        success: function (res) {
                            if (res.success) {
                                table.reload('LAY-user-back-manage');
                                layer.msg('已删除');
                                layer.close(index);
                            }
                        }
                    });
                    console.log(obj)
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
                                }
                            }
                        });
                        table.reload('LAY-user-back-manage');//数据刷新
                        layer.close(index);//关闭弹层
                    });

                    submit.trigger('click');
                }

            });
        }
    });






    //角色管理
    table.render({
        elem: '#LAY-user-back-role'
        , url: layui.setter.base + 'json/useradmin/role.js' //模拟接口
        , cols: [[
            {type: 'checkbox', fixed: 'left'}
            , {field: 'id', width: 80, title: 'ID', sort: true}
            , {field: 'rolename', title: '角色名'}
            , {field: 'limits', title: '拥有权限'}
            , {field: 'descr', title: '具体描述'}
            , {title: '操作', width: 150, align: 'center', fixed: 'right', toolbar: '#table-useradmin-admin'}
        ]]
        , text: '对不起，加载出现异常！'
    });

    //监听工具条
    table.on('tool(LAY-user-back-role)', function (obj) {
        var data = obj.data;
        if (obj.event === 'del') {
            layer.confirm('确定删除此角色？', function (index) {
                obj.del();
                layer.close(index);
            });
        } else if (obj.event === 'edit') {
            var tr = $(obj.tr);

            layer.open({
                type: 2
                , title: '编辑角色'
                , content: '../../../views/user/administrators/roleform.html'
                , area: ['500px', '480px']
                , btn: ['确定', '取消']
                , yes: function (index, layero) {
                    var iframeWindow = window['layui-layer-iframe' + index]
                        , submit = layero.find('iframe').contents().find("#LAY-user-role-submit");

                    //监听提交
                    iframeWindow.layui.form.on('submit(LAY-user-role-submit)', function (data) {
                        var field = data.field; //获取提交的字段

                        //提交 Ajax 成功后，静态更新表格中的数据
                        //$.ajax({});
                        table.reload('LAY-user-back-role'); //数据刷新
                        layer.close(index); //关闭弹层
                    });

                    submit.trigger('click');
                }
                , success: function (layero, index) {

                }
            })
        }
    });

    exports('useradmin', {})
});