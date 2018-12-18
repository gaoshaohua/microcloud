package com.micro.cloud.frame.sys.entity;


/**
* 
* @author gsh
* @version 1.0
* @date 2018年05月31日 05:22:29
*/
public class Task{

	 /**
	  * 注释: 编号
	  */
	  private Long id;
     
	 /**
	  * 注释: 任务名称
	  */
	  private String jobName;
     
	 /**
	  * 注释: 任务分组
	  */
	  private String jobGroup;
     
	 /**
	  * 注释: cron表达式
	  */
	  private String cron;
     
	 /**
	  * 注释: 任务执行时调用哪个类的方法 包名+类名
	  */
	  private String beanClass;
     
	 /**
	  * 注释: 是否有状态
	  */
	  private String isConcurrent;
     
	 /**
	  * 注释: 任务调用的方法名
	  */
	  private String methodName;
     
	 /**
	  * 注释: 创建者
	  */
	  private Long creator;
     
	 /**
	  * 注释: 创建时间
	  */
	  private java.util.Date createDate;
     
	 /**
	  * 注释: 修改者
	  */
	  private Long updater;
     
	 /**
	  * 注释: 修改时间
	  */
	  private java.util.Date updateDate;
     
	 /**
	  * 注释: 描述
	  */
	  private String remark;
     
	 /**
	  * 注释: 任务状态 1正常 0暂停 
	  */
	  private String status;
     

	public Long getId(){
        return id;
    }

    public void setId(Long id){
        this.id = id;
    }
	public String getJobName(){
        return jobName;
    }

    public void setJobName(String jobName){
        this.jobName = jobName;
    }
	public String getJobGroup(){
        return jobGroup;
    }

    public void setJobGroup(String jobGroup){
        this.jobGroup = jobGroup;
    }
	public String getCron(){
        return cron;
    }

    public void setCron(String cron){
        this.cron = cron;
    }
	public String getBeanClass(){
        return beanClass;
    }

    public void setBeanClass(String beanClass){
        this.beanClass = beanClass;
    }
	public String getIsConcurrent(){
        return isConcurrent;
    }

    public void setIsConcurrent(String isConcurrent){
        this.isConcurrent = isConcurrent;
    }
	public String getMethodName(){
        return methodName;
    }

    public void setMethodName(String methodName){
        this.methodName = methodName;
    }
	public Long getCreator(){
        return creator;
    }

    public void setCreator(Long creator){
        this.creator = creator;
    }
	public java.util.Date getCreateDate(){
        return createDate;
    }

    public void setCreateDate(java.util.Date createDate){
        this.createDate = createDate;
    }
	public Long getUpdater(){
        return updater;
    }

    public void setUpdater(Long updater){
        this.updater = updater;
    }
	public java.util.Date getUpdateDate(){
        return updateDate;
    }

    public void setUpdateDate(java.util.Date updateDate){
        this.updateDate = updateDate;
    }
	public String getRemark(){
        return remark;
    }

    public void setRemark(String remark){
        this.remark = remark;
    }
	public String getStatus(){
        return status;
    }

    public void setStatus(String status){
        this.status = status;
    }
}
