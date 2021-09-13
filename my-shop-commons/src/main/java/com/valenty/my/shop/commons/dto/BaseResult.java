package com.valenty.my.shop.commons.dto;

import java.io.Serializable;

/**
 * 自定义返回结果
 */
public class BaseResult implements Serializable {
    //封装常量
    public static final int STATUS_SUCCESS = 200;
    public static final int STATUS_FAIL = 500;

    private int status;//状态码
    private String messsage;//消息

    //封装成功
    public static BaseResult success() {
        return BaseResult.createResult(STATUS_SUCCESS,"成功");
    }

    public static BaseResult success(String message) {
        return BaseResult.createResult(STATUS_SUCCESS,message);
    }

    //封装失败
    public static BaseResult fail() {
        return BaseResult.createResult(STATUS_FAIL,"失败");
    }
    public static BaseResult fail(String messsage) {
        return BaseResult.createResult(STATUS_FAIL,messsage);
    }

    private static BaseResult createResult(int status,String messsage) {
        BaseResult baseResult = new BaseResult();
        baseResult.setStatus(status);
        baseResult.setMesssage(messsage);
        return baseResult;
    }

    public static BaseResult fail(int status,String messsage) {
        return BaseResult.createResult(status,messsage);
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public String getMesssage() {
        return messsage;
    }

    public void setMesssage(String messsage) {
        this.messsage = messsage;
    }
}
