package com.huawei.hw_shopping.model.dto;

import lombok.Data;

/**
 * 返回状态dto
 */
@Data
public class ResponseDTO {
    //服务器返回给客户端得消息
    private String msg;
    //返回得结果
    private Boolean result;
    //返回得数据
    private Object data;
    //返回得状态 200 ok
    private Integer status=200;
    //错误代码  默认200   200  404  500
    private Integer errorCode;

    public ResponseDTO(String msg, Boolean result, Object data, Integer status, Integer errorCode) {
        this.msg = msg;
        this.result = result;
        this.data = data;
        this.status = status;
        this.errorCode = errorCode;
    }

    /** 返回成功消息
     * @param msg
     * @return
     */
    public static ResponseDTO success(String msg){
        return new ResponseDTO(msg,true,null,200,null);
    }
    /** 返回成功简单消息  并且返回data数据
     * @param msg
     * @return
     */
    public static ResponseDTO success(String msg,Object data){
        return new ResponseDTO(msg,true,data,200,null);
    }

    /** 只返回错误消息
     * @param msg
     * @return
     */
    public static ResponseDTO fail(String msg){
        return new ResponseDTO(msg,false,null,null,null);
    }

    public static ResponseDTO fail(String msg,Object data,Integer status,Integer errorCode){
        return new ResponseDTO(msg,false,data,status,errorCode);
    }
}
