package com.micro.cloud.sys.area.vo;


/**
 * @desc vo
 * @author gsh
 * @version 1.0
 * @date 2019年01月15日 05:10:48
 */
public class AreaVo{

	 /**
	  * desc: id
	  */
	  private Integer id;
     
	 /**
	  * desc: 城市code
	  */
	  private String areaCode;
     
	 /**
	  * desc: 区域名称
	  */
	  private String areaName;
     
	 /**
	  * desc: parent_id
	  */
	  private Integer parentId;
     
	 /**
	  * desc: 简称
	  */
	  private String shortName;
     
	 /**
	  * desc: 经度
	  */
	  private String lng;
     
	 /**
	  * desc: 维度
	  */
	  private String lat;
     
	 /**
	  * desc: 级数
	  */
	  private Integer level;
     
	 /**
	  * desc: 排序
	  */
	  private Integer sort;
     
	 /**
	  * desc: 1正常 0删除
	  */
	  private String status;
     

	public Integer getId(){
        return id;
    }

    public void setId(Integer id){
        this.id = id;
    }
	public String getAreaCode(){
        return areaCode;
    }

    public void setAreaCode(String areaCode){
        this.areaCode = areaCode;
    }
	public String getAreaName(){
        return areaName;
    }

    public void setAreaName(String areaName){
        this.areaName = areaName;
    }
	public Integer getParentId(){
        return parentId;
    }

    public void setParentId(Integer parentId){
        this.parentId = parentId;
    }
	public String getShortName(){
        return shortName;
    }

    public void setShortName(String shortName){
        this.shortName = shortName;
    }
	public String getLng(){
        return lng;
    }

    public void setLng(String lng){
        this.lng = lng;
    }
	public String getLat(){
        return lat;
    }

    public void setLat(String lat){
        this.lat = lat;
    }
	public Integer getLevel(){
        return level;
    }

    public void setLevel(Integer level){
        this.level = level;
    }
	public Integer getSort(){
        return sort;
    }

    public void setSort(Integer sort){
        this.sort = sort;
    }
	public String getStatus(){
        return status;
    }

    public void setStatus(String status){
        this.status = status;
    }
}
