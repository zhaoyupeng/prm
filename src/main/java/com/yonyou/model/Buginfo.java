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
public class Buginfo extends Model<Buginfo> {

    private static final long serialVersionUID = 1L;

	private Long id;
	@TableField("create_time")
	private Date createTime;
	private String code;
	private String name;
	private Long creator;
	@TableField("pk_requirement")
	private Long pkRequirement;
	@TableField("pk_project")
	private Long pkProject;
	private String content;
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

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getCreator() {
		return creator;
	}

	public void setCreator(Long creator) {
		this.creator = creator;
	}

	public Long getPkRequirement() {
		return pkRequirement;
	}

	public void setPkRequirement(Long pkRequirement) {
		this.pkRequirement = pkRequirement;
	}

	public Long getPkProject() {
		return pkProject;
	}

	public void setPkProject(Long pkProject) {
		this.pkProject = pkProject;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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

}
