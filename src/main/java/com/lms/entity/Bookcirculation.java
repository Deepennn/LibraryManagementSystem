package com.lms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @TableName bookcirculation
 */
@TableName(value ="bookcirculation")
public class Bookcirculation implements Serializable {
    /**
     *
     */
    @TableId
    private Integer circulationid;

    /**
     *
     */
    private Integer bookid;

    /**
     *
     */
    private String unit;

    /**
     *
     */
    private Integer circulationaccountid;

    /**
     *
     */
    private Date circulationtime;

    /**
     *
     */
    private Date returntime;

    /**
     *
     */
    private String circulationreason;

    /**
     *
     */
    private String applicant;

    /**
     *
     */
    private String applicantcontact;

    /**
     *
     */
    private String remarks;

    /**
     *
     */
    private Date duetime;

    /**
     *
     */
    private Integer circulationstatus;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    public Integer getCirculationid() {
        return circulationid;
    }

    /**
     *
     */
    public void setCirculationid(Integer circulationid) {
        this.circulationid = circulationid;
    }

    /**
     *
     */
    public Integer getBookid() {
        return bookid;
    }

    /**
     *
     */
    public void setBookid(Integer bookid) {
        this.bookid = bookid;
    }

    /**
     *
     */
    public String getUnit() {
        return unit;
    }

    /**
     *
     */
    public void setUnit(String unit) {
        this.unit = unit;
    }

    /**
     *
     */
    public Integer getCirculationaccountid() {
        return circulationaccountid;
    }

    /**
     *
     */
    public void setCirculationaccountid(Integer circulationaccountid) {
        this.circulationaccountid = circulationaccountid;
    }

    /**
     *
     */
    public Date getCirculationtime() {
        return circulationtime;
    }

    /**
     *
     */
    public void setCirculationtime(Date circulationtime) {
        this.circulationtime = circulationtime;
    }

    /**
     *
     */
    public Date getReturntime() {
        return returntime;
    }

    /**
     *
     */
    public void setReturntime(Date returntime) {
        this.returntime = returntime;
    }

    /**
     *
     */
    public String getCirculationreason() {
        return circulationreason;
    }

    /**
     *
     */
    public void setCirculationreason(String circulationreason) {
        this.circulationreason = circulationreason;
    }

    /**
     *
     */
    public String getApplicant() {
        return applicant;
    }

    /**
     *
     */
    public void setApplicant(String applicant) {
        this.applicant = applicant;
    }

    /**
     *
     */
    public String getApplicantcontact() {
        return applicantcontact;
    }

    /**
     *
     */
    public void setApplicantcontact(String applicantcontact) {
        this.applicantcontact = applicantcontact;
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

    /**
     *
     */
    public Date getDuetime() {
        return duetime;
    }

    /**
     *
     */
    public void setDuetime(Date duetime) {
        this.duetime = duetime;
    }

    /**
     *
     */
    public Integer getCirculationstatus() {
        return circulationstatus;
    }

    /**
     *
     */
    public void setCirculationstatus(Integer circulationstatus) {
        this.circulationstatus = circulationstatus;
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
        Bookcirculation other = (Bookcirculation) that;
        return (this.getCirculationid() == null ? other.getCirculationid() == null : this.getCirculationid().equals(other.getCirculationid()))
            && (this.getBookid() == null ? other.getBookid() == null : this.getBookid().equals(other.getBookid()))
            && (this.getUnit() == null ? other.getUnit() == null : this.getUnit().equals(other.getUnit()))
            && (this.getCirculationaccountid() == null ? other.getCirculationaccountid() == null : this.getCirculationaccountid().equals(other.getCirculationaccountid()))
            && (this.getCirculationtime() == null ? other.getCirculationtime() == null : this.getCirculationtime().equals(other.getCirculationtime()))
            && (this.getReturntime() == null ? other.getReturntime() == null : this.getReturntime().equals(other.getReturntime()))
            && (this.getCirculationreason() == null ? other.getCirculationreason() == null : this.getCirculationreason().equals(other.getCirculationreason()))
            && (this.getApplicant() == null ? other.getApplicant() == null : this.getApplicant().equals(other.getApplicant()))
            && (this.getApplicantcontact() == null ? other.getApplicantcontact() == null : this.getApplicantcontact().equals(other.getApplicantcontact()))
            && (this.getRemarks() == null ? other.getRemarks() == null : this.getRemarks().equals(other.getRemarks()))
            && (this.getDuetime() == null ? other.getDuetime() == null : this.getDuetime().equals(other.getDuetime()))
            && (this.getCirculationstatus() == null ? other.getCirculationstatus() == null : this.getCirculationstatus().equals(other.getCirculationstatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getCirculationid() == null) ? 0 : getCirculationid().hashCode());
        result = prime * result + ((getBookid() == null) ? 0 : getBookid().hashCode());
        result = prime * result + ((getUnit() == null) ? 0 : getUnit().hashCode());
        result = prime * result + ((getCirculationaccountid() == null) ? 0 : getCirculationaccountid().hashCode());
        result = prime * result + ((getCirculationtime() == null) ? 0 : getCirculationtime().hashCode());
        result = prime * result + ((getReturntime() == null) ? 0 : getReturntime().hashCode());
        result = prime * result + ((getCirculationreason() == null) ? 0 : getCirculationreason().hashCode());
        result = prime * result + ((getApplicant() == null) ? 0 : getApplicant().hashCode());
        result = prime * result + ((getApplicantcontact() == null) ? 0 : getApplicantcontact().hashCode());
        result = prime * result + ((getRemarks() == null) ? 0 : getRemarks().hashCode());
        result = prime * result + ((getDuetime() == null) ? 0 : getDuetime().hashCode());
        result = prime * result + ((getCirculationstatus() == null) ? 0 : getCirculationstatus().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", circulationid=").append(circulationid);
        sb.append(", bookid=").append(bookid);
        sb.append(", unit=").append(unit);
        sb.append(", circulationaccountid=").append(circulationaccountid);
        sb.append(", circulationtime=").append(circulationtime);
        sb.append(", returntime=").append(returntime);
        sb.append(", circulationreason=").append(circulationreason);
        sb.append(", applicant=").append(applicant);
        sb.append(", applicantcontact=").append(applicantcontact);
        sb.append(", remarks=").append(remarks);
        sb.append(", duetime=").append(duetime);
        sb.append(", circulationstatus=").append(circulationstatus);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    private User user;

    private Bookinformation bookinformation;

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public Bookinformation getBookinformation() {
        return bookinformation;
    }

    public void setBookinformation(Bookinformation bookinformation) {
        this.bookinformation = bookinformation;
    }

}
