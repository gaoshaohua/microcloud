package com.micro.cloud.frame.commons.base.dto;

public class BaseDtoIn<I> extends ServiceIn {

    private I mode;

    
    public BaseDtoIn() {
        super();
    }

    public BaseDtoIn(I mode) {
        super();
        this.mode = mode;
    }

    public I getMode() {
        return mode;
    }

    public void setMode(I mode) {
        this.mode = mode;
    }
    
    
}
