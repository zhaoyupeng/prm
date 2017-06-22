package com.yonyou.model;

import java.util.Date;
import com.baomidou.mybatisplus.annotations.TableField;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 
 * </p>
 *
 * @author shidl
 * @since 2017-06-13
 */
@TableName("project_user")
public class ProjectUser extends Model<ProjectUser> {

    private static final long serialVersionUID = 1L;

	private Long id;
	@TableField("pk_project")
	private Long pkProject;
	@TableField("pk_grouper")
	private Long pkGrouper;
	@TableField("create_time")
	private Date createTime;
	@TableField("update_time")
	private Date updateTime;
	@TableField("delete_flag")
	private Integer deleteFlag;


	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public Long getPkProject() {
		return pkProject;
	}

	public void setPkProject(Long pkProject) {
		this.pkProject = pkProject;
	}

	public Long getPkGrouper() {
		return pkGrouper;
	}

	public void setPkGrouper(Long pkGrouper) {
		this.pkGrouper = pkGrouper;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
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
