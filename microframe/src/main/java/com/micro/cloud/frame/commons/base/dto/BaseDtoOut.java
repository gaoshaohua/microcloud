package com.micro.cloud.frame.commons.base.dto;

import java.util.List;

public class BaseDtoOut<T> extends ServiceOut {

    /**
     * 
     */
    private static final long serialVersionUID = 1L;

    private T mode;

    private List<T> list;

    public T getMode() {
        return mode;
    }

    public void setMode(T mode) {
        this.mode = mode;
    }

    public List<T> getList() {
        return list;
    }

    public void setList(List<T> list) {
        this.list = list;
    }

}
