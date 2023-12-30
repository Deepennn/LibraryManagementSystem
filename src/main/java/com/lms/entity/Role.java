package com.lms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

/**
 * 
 * @TableName role
 */
@TableName(value ="role")
public class Role implements Serializable {
    /**
     * 
     */
    @TableId
    private Integer roleid;

    /**
     * 
     */
    private String rolename;

    /**
     * 
     */
    private Date createdtime;

    /**
     * 
     */
    private String rolestatus;

    /**
     * 
     */
    private String remarks;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     * 
     */
    public Integer getRoleid() {
        return roleid;
    }

    /**
     * 
     */
    public void setRoleid(Integer roleid) {
        this.roleid = roleid;
    }

    /**
     * 
     */
    public String getRolename() {
        return rolename;
    }

    /**
     * 
     */
    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    /**
     * 
     */
    public Date getCreatedtime() {
        return createdtime;
    }

    /**
     * 
     */
    public void setCreatedtime(Date createdtime) {
        this.createdtime = createdtime;
    }

    /**
     * 
     */
    public String getRolestatus() {
        return rolestatus;
    }

    /**
     * 
     */
    public void setRolestatus(String rolestatus) {
        this.rolestatus = rolestatus;
    }

    /**
     * 
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * 
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    @Override
    public boolean equals(Object that) {
        if (this == that) {
            return true;
        }
        if (that == null) {
            return false;
        }
        if (getClass() != that.getClass()) {
            return false;
        }
        Role other = (Role) that;
        return (this.getRoleid() == null ? other.getRoleid() == null : this.getRoleid().equals(other.getRoleid()))
            && (this.getRolename() == null ? other.getRolename() == null : this.getRolename().equals(other.getRolename()))
            && (this.getCreatedtime() == null ? other.getCreatedtime() == null : this.getCreatedtime().equals(other.getCreatedtime()))
            && (this.getRolestatus() == null ? other.getRolestatus() == null : this.getRolestatus().equals(other.getRolestatus()))
            && (this.getRemarks() == null ? other.getRemarks() == null : this.getRemarks().equals(other.getRemarks()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getRoleid() == null) ? 0 : getRoleid().hashCode());
        result = prime * result + ((getRolename() == null) ? 0 : getRolename().hashCode());
        result = prime * result + ((getCreatedtime() == null) ? 0 : getCreatedtime().hashCode());
        result = prime * result + ((getRolestatus() == null) ? 0 : getRolestatus().hashCode());
        result = prime * result + ((getRemarks() == null) ? 0 : getRemarks().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", roleid=").append(roleid);
        sb.append(", rolename=").append(rolename);
        sb.append(", createdtime=").append(createdtime);
        sb.append(", rolestatus=").append(rolestatus);
        sb.append(", remarks=").append(remarks);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}