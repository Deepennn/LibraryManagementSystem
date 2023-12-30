package com.lms.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.util.Date;

/**
 *
 * @TableName bookborrowing
 */
@TableName(value ="bookborrowing")
public class Bookborrowing implements Serializable {
    /**
     *
     */
    @TableId
    private Integer borrowid;

    /**
     *
     */
    private Integer bookid;

    /**
     *
     */
    private Integer borrowaccountid;

    /**
     *
     */
    private Date borrowtime;

    /**
     *
     */
    private Date returntime;

    /**
     *
     */
    private String borrowreason;

    /**
     *
     */
    private String borrower;

    /**
     *
     */
    private String borrowercontact;

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
    private Integer borrowstatus;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

    /**
     *
     */
    public Integer getBorrowid() {
        return borrowid;
    }

    /**
     *
     */
    public void setBorrowid(Integer borrowid) {
        this.borrowid = borrowid;
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
    public Integer getBorrowaccountid() {
        return borrowaccountid;
    }

    /**
     *
     */
    public void setBorrowaccountid(Integer borrowaccountid) {
        this.borrowaccountid = borrowaccountid;
    }

    /**
     *
     */
    public Date getBorrowtime() {
        return borrowtime;
    }

    /**
     *
     */
    public void setBorrowtime(Date borrowtime) {
        this.borrowtime = borrowtime;
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
    public String getBorrowreason() {
        return borrowreason;
    }

    /**
     *
     */
    public void setBorrowreason(String borrowreason) {
        this.borrowreason = borrowreason;
    }

    /**
     *
     */
    public String getBorrower() {
        return borrower;
    }

    /**
     *
     */
    public void setBorrower(String borrower) {
        this.borrower = borrower;
    }

    /**
     *
     */
    public String getBorrowercontact() {
        return borrowercontact;
    }

    /**
     *
     */
    public void setBorrowercontact(String borrowercontact) {
        this.borrowercontact = borrowercontact;
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
    public Integer getBorrowstatus() {
        return borrowstatus;
    }

    /**
     *
     */
    public void setBorrowstatus(Integer borrowstatus) {
        this.borrowstatus = borrowstatus;
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
        Bookborrowing other = (Bookborrowing) that;
        return (this.getBorrowid() == null ? other.getBorrowid() == null : this.getBorrowid().equals(other.getBorrowid()))
            && (this.getBookid() == null ? other.getBookid() == null : this.getBookid().equals(other.getBookid()))
            && (this.getBorrowaccountid() == null ? other.getBorrowaccountid() == null : this.getBorrowaccountid().equals(other.getBorrowaccountid()))
            && (this.getBorrowtime() == null ? other.getBorrowtime() == null : this.getBorrowtime().equals(other.getBorrowtime()))
            && (this.getReturntime() == null ? other.getReturntime() == null : this.getReturntime().equals(other.getReturntime()))
            && (this.getBorrowreason() == null ? other.getBorrowreason() == null : this.getBorrowreason().equals(other.getBorrowreason()))
            && (this.getBorrower() == null ? other.getBorrower() == null : this.getBorrower().equals(other.getBorrower()))
            && (this.getBorrowercontact() == null ? other.getBorrowercontact() == null : this.getBorrowercontact().equals(other.getBorrowercontact()))
            && (this.getRemarks() == null ? other.getRemarks() == null : this.getRemarks().equals(other.getRemarks()))
            && (this.getDuetime() == null ? other.getDuetime() == null : this.getDuetime().equals(other.getDuetime()))
            && (this.getBorrowstatus() == null ? other.getBorrowstatus() == null : this.getBorrowstatus().equals(other.getBorrowstatus()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getBorrowid() == null) ? 0 : getBorrowid().hashCode());
        result = prime * result + ((getBookid() == null) ? 0 : getBookid().hashCode());
        result = prime * result + ((getBorrowaccountid() == null) ? 0 : getBorrowaccountid().hashCode());
        result = prime * result + ((getBorrowtime() == null) ? 0 : getBorrowtime().hashCode());
        result = prime * result + ((getReturntime() == null) ? 0 : getReturntime().hashCode());
        result = prime * result + ((getBorrowreason() == null) ? 0 : getBorrowreason().hashCode());
        result = prime * result + ((getBorrower() == null) ? 0 : getBorrower().hashCode());
        result = prime * result + ((getBorrowercontact() == null) ? 0 : getBorrowercontact().hashCode());
        result = prime * result + ((getRemarks() == null) ? 0 : getRemarks().hashCode());
        result = prime * result + ((getDuetime() == null) ? 0 : getDuetime().hashCode());
        result = prime * result + ((getBorrowstatus() == null) ? 0 : getBorrowstatus().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", borrowid=").append(borrowid);
        sb.append(", bookid=").append(bookid);
        sb.append(", borrowaccountid=").append(borrowaccountid);
        sb.append(", borrowtime=").append(borrowtime);
        sb.append(", returntime=").append(returntime);
        sb.append(", borrowreason=").append(borrowreason);
        sb.append(", borrower=").append(borrower);
        sb.append(", borrowercontact=").append(borrowercontact);
        sb.append(", remarks=").append(remarks);
        sb.append(", duetime=").append(duetime);
        sb.append(", borrowstatus=").append(borrowstatus);
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
