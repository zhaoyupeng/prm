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
public class Project extends Model<Project> {

    private static final long serialVersionUID = 1L;

	private Long id;
	@TableField("create_time")
	private Date createTime;
	private String code;
	private String name;
	@TableField("contract_code")
	private String contractCode;
	@TableField("contract_useddays")
	private Double contractUseddays;
	@TableField("pk_parent")
	private Long pkParent;
	private Long manager;
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

	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}

	public Double getContractUseddays() {
		return contractUseddays;
	}

	public void setContractUseddays(Double contractUseddays) {
		this.contractUseddays = contractUseddays;
	}

	public Long getPkParent() {
		return pkParent;
	}

	public void setPkParent(Long pkParent) {
		this.pkParent = pkParent;
	}

	public Long getManager() {
		return manager;
	}

	public void setManager(Long manager) {
		this.manager = manager;
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
