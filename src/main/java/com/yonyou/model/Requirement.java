package com.yonyou.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
public class Requirement extends Model<Requirement> {

    private static final long serialVersionUID = 1L;

	private Long id;
	@TableField("create_time")
	private Date createTime;
	private String requireinfo;
	private String name;
	private Double requiredays;
	@TableField("pk_project")
	private Long pkProject;
	@TableField("pk_parent")
	private Long pkParent;
	@TableField("update_time")
	private Date updateTime;
	@TableField("delete_flag")
	private Integer deleteFlag;
	@TableField("status")
	private Integer status;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public String getRequireinfo() {
		return requireinfo;
	}

	public void setRequireinfo(String requireinfo) {
		this.requireinfo = requireinfo;
	}

	public Double getRequiredays() {
		return requiredays;
	}

	public void setRequiredays(Double requiredays) {
		this.requiredays = requiredays;
	}

	public Long getPkProject() {
		return pkProject;
	}

	public void setPkProject(Long pkProject) {
		this.pkProject = pkProject;
	}

	public Long getPkParent() {
		return pkParent;
	}

	public void setPkParent(Long pkParent) {
		this.pkParent = pkParent;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	public Integer getDeleteFlag() {
		return deleteFlag;
	}

	public void setDeleteFlag(Integer deleteFlag) {
		this.deleteFlag = deleteFlag;
	}

	@Override
	protected Serializable pkVal() {
		return this.id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
}
