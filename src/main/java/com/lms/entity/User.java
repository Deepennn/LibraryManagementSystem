package com.lms.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 *
 * @TableName user
 */
@TableName(value ="user")
public class User implements Serializable {
    /**
     *
     */
    @TableId
    private Integer userid;

    /**
     *
     */
    private String username;

    /**
     *
     */
    private String password;

    /**
     *
     */
    private String realname;

    /**
     *
     */
    private String contactnumber;

    /**
     *
     */
    private String email;

    /**
     *
     */
    private String address;

    /**
     *
     */
    private Integer workid;

    /**
     *
     */
    private Integer isregistered;

    /**
     *
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date createdtime;

    /**
     *
     */
    private String gender;

    /**
     *
     */
    private String avatarpath;

    /**
     *
     */
    private String accountstatus;

    /**
     *
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date lastlogintime;

    /**
     *
     */
    private Integer unitid;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    public Integer getUserid() {
        return userid;
    }

    /**
     *
     */
    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    /**
     *
     */
    public String getUsername() {
        return username;
    }

    /**
     *
     */
    public void setUsername(String username) {
        this.username = username;
    }

    /**
     *
     */
    public String getPassword() {
        return password;
    }

    /**
     *
     */
    public void setPassword(String password) {
        this.password = password;
    }

    /**
     *
     */
    public String getRealname() {
        return realname;
    }

    /**
     *
     */
    public void setRealname(String realname) {
        this.realname = realname;
    }

    /**
     *
     */
    public String getContactnumber() {
        return contactnumber;
    }

    /**
     *
     */
    public void setContactnumber(String contactnumber) {
        this.contactnumber = contactnumber;
    }

    /**
     *
     */
    public String getEmail() {
        return email;
    }

    /**
     *
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     *
     */
    public String getAddress() {
        return address;
    }

    /**
     *
     */
    public void setAddress(String address) {
        this.address = address;
    }

    /**
     *
     */
    public Integer getWorkid() {
        return workid;
    }

    /**
     *
     */
    public void setWorkid(Integer workid) {
        this.workid = workid;
    }

    /**
     *
     */
    public Integer getIsregistered() {
        return isregistered;
    }

    /**
     *
     */
    public void setIsregistered(Integer isregistered) {
        this.isregistered = isregistered;
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
    public String getGender() {
        return gender;
    }

    /**
     *
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     *
     */
    public String getAvatarpath() {
        return avatarpath;
    }

    /**
     *
     */
    public void setAvatarpath(String avatarpath) {
        this.avatarpath = avatarpath;
    }

    /**
     *
     */
    public String getAccountstatus() {
        return accountstatus;
    }

    /**
     *
     */
    public void setAccountstatus(String accountstatus) {
        this.accountstatus = accountstatus;
    }

    /**
     *
     */
    public Date getLastlogintime() {
        return lastlogintime;
    }

    /**
     *
     */
    public void setLastlogintime(Date lastlogintime) {
        this.lastlogintime = lastlogintime;
    }

    /**
     *
     */
    public Integer getUnitid() {
        return unitid;
    }

    /**
     *
     */
    public void setUnitid(Integer unitid) {
        this.unitid = unitid;
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
        User other = (User) that;
        return (this.getUserid() == null ? other.getUserid() == null : this.getUserid().equals(other.getUserid()))
            && (this.getUsername() == null ? other.getUsername() == null : this.getUsername().equals(other.getUsername()))
            && (this.getPassword() == null ? other.getPassword() == null : this.getPassword().equals(other.getPassword()))
            && (this.getRealname() == null ? other.getRealname() == null : this.getRealname().equals(other.getRealname()))
            && (this.getContactnumber() == null ? other.getContactnumber() == null : this.getContactnumber().equals(other.getContactnumber()))
            && (this.getEmail() == null ? other.getEmail() == null : this.getEmail().equals(other.getEmail()))
            && (this.getAddress() == null ? other.getAddress() == null : this.getAddress().equals(other.getAddress()))
            && (this.getWorkid() == null ? other.getWorkid() == null : this.getWorkid().equals(other.getWorkid()))
            && (this.getIsregistered() == null ? other.getIsregistered() == null : this.getIsregistered().equals(other.getIsregistered()))
            && (this.getCreatedtime() == null ? other.getCreatedtime() == null : this.getCreatedtime().equals(other.getCreatedtime()))
            && (this.getGender() == null ? other.getGender() == null : this.getGender().equals(other.getGender()))
            && (this.getAvatarpath() == null ? other.getAvatarpath() == null : this.getAvatarpath().equals(other.getAvatarpath()))
            && (this.getAccountstatus() == null ? other.getAccountstatus() == null : this.getAccountstatus().equals(other.getAccountstatus()))
            && (this.getLastlogintime() == null ? other.getLastlogintime() == null : this.getLastlogintime().equals(other.getLastlogintime()))
            && (this.getUnitid() == null ? other.getUnitid() == null : this.getUnitid().equals(other.getUnitid()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUserid() == null) ? 0 : getUserid().hashCode());
        result = prime * result + ((getUsername() == null) ? 0 : getUsername().hashCode());
        result = prime * result + ((getPassword() == null) ? 0 : getPassword().hashCode());
        result = prime * result + ((getRealname() == null) ? 0 : getRealname().hashCode());
        result = prime * result + ((getContactnumber() == null) ? 0 : getContactnumber().hashCode());
        result = prime * result + ((getEmail() == null) ? 0 : getEmail().hashCode());
        result = prime * result + ((getAddress() == null) ? 0 : getAddress().hashCode());
        result = prime * result + ((getWorkid() == null) ? 0 : getWorkid().hashCode());
        result = prime * result + ((getIsregistered() == null) ? 0 : getIsregistered().hashCode());
        result = prime * result + ((getCreatedtime() == null) ? 0 : getCreatedtime().hashCode());
        result = prime * result + ((getGender() == null) ? 0 : getGender().hashCode());
        result = prime * result + ((getAvatarpath() == null) ? 0 : getAvatarpath().hashCode());
        result = prime * result + ((getAccountstatus() == null) ? 0 : getAccountstatus().hashCode());
        result = prime * result + ((getLastlogintime() == null) ? 0 : getLastlogintime().hashCode());
        result = prime * result + ((getUnitid() == null) ? 0 : getUnitid().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", userid=").append(userid);
        sb.append(", username=").append(username);
        sb.append(", password=").append(password);
        sb.append(", realname=").append(realname);
        sb.append(", contactnumber=").append(contactnumber);
        sb.append(", email=").append(email);
        sb.append(", address=").append(address);
        sb.append(", workid=").append(workid);
        sb.append(", isregistered=").append(isregistered);
        sb.append(", createdtime=").append(createdtime);
        sb.append(", gender=").append(gender);
        sb.append(", avatarpath=").append(avatarpath);
        sb.append(", accountstatus=").append(accountstatus);
        sb.append(", lastlogintime=").append(lastlogintime);
        sb.append(", unitid=").append(unitid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    private Unit unit;

    public Unit getUnit() {
        return unit;
    }

    public void setUnit(Unit unit) {
        this.unit = unit;
    }

    private Role role;

    public Role getRole() {
        return role;
    }

    public void setRole(Role role) {
        this.role = role;
    }

}
