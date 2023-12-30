package com.lms.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.io.Serializable;

/**
 *
 * @TableName unit
 */
@TableName(value ="unit")
public class Unit implements Serializable {
    /**
     *
     */
    @TableId
    private Integer unitid;

    /**
     *
     */
    private String unitname;

    /**
     *
     */
    private String contactperson;

    /**
     *
     */
    private String contactnumber;

    /**
     *
     */
    private String emailaddress;

    /**
     *
     */
    private String contactaddress;

    /**
     *
     */
    private String unittype;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

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

    /**
     *
     */
    public String getUnitname() {
        return unitname;
    }

    /**
     *
     */
    public void setUnitname(String unitname) {
        this.unitname = unitname;
    }

    /**
     *
     */
    public String getContactperson() {
        return contactperson;
    }

    /**
     *
     */
    public void setContactperson(String contactperson) {
        this.contactperson = contactperson;
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
    public String getEmailaddress() {
        return emailaddress;
    }

    /**
     *
     */
    public void setEmailaddress(String emailaddress) {
        this.emailaddress = emailaddress;
    }

    /**
     *
     */
    public String getContactaddress() {
        return contactaddress;
    }

    /**
     *
     */
    public void setContactaddress(String contactaddress) {
        this.contactaddress = contactaddress;
    }

    /**
     *
     */
    public String getUnittype() {
        return unittype;
    }

    /**
     *
     */
    public void setUnittype(String unittype) {
        this.unittype = unittype;
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
        Unit other = (Unit) that;
        return (this.getUnitid() == null ? other.getUnitid() == null : this.getUnitid().equals(other.getUnitid()))
            && (this.getUnitname() == null ? other.getUnitname() == null : this.getUnitname().equals(other.getUnitname()))
            && (this.getContactperson() == null ? other.getContactperson() == null : this.getContactperson().equals(other.getContactperson()))
            && (this.getContactnumber() == null ? other.getContactnumber() == null : this.getContactnumber().equals(other.getContactnumber()))
            && (this.getEmailaddress() == null ? other.getEmailaddress() == null : this.getEmailaddress().equals(other.getEmailaddress()))
            && (this.getContactaddress() == null ? other.getContactaddress() == null : this.getContactaddress().equals(other.getContactaddress()))
            && (this.getUnittype() == null ? other.getUnittype() == null : this.getUnittype().equals(other.getUnittype()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getUnitid() == null) ? 0 : getUnitid().hashCode());
        result = prime * result + ((getUnitname() == null) ? 0 : getUnitname().hashCode());
        result = prime * result + ((getContactperson() == null) ? 0 : getContactperson().hashCode());
        result = prime * result + ((getContactnumber() == null) ? 0 : getContactnumber().hashCode());
        result = prime * result + ((getEmailaddress() == null) ? 0 : getEmailaddress().hashCode());
        result = prime * result + ((getContactaddress() == null) ? 0 : getContactaddress().hashCode());
        result = prime * result + ((getUnittype() == null) ? 0 : getUnittype().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", unitid=").append(unitid);
        sb.append(", unitname=").append(unitname);
        sb.append(", contactperson=").append(contactperson);
        sb.append(", contactnumber=").append(contactnumber);
        sb.append(", emailaddress=").append(emailaddress);
        sb.append(", contactaddress=").append(contactaddress);
        sb.append(", unittype=").append(unittype);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}
