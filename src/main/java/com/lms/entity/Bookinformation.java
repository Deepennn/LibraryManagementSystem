package com.lms.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

/**
 *
 * @TableName bookinformation
 */
@TableName(value ="bookinformation")
public class Bookinformation implements Serializable {
    /**
     *
     */
    @TableId
    private Integer bookid;

    /**
     *
     */
    private String bookname;

    /**
     *
     */
    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date publicationdate;

    /**
     *
     */
    private String author;

    /**
     *
     */
    private String publisher;

    /**
     *
     */
    private String bookcategory;

    /**
     *
     */
    private Integer pagecount;

    /**
     *
     */
    private BigDecimal price;

    /**
     *
     */
    private String imagepath;

    /**
     *
     */
    private Integer bookcount;

    /**
     *
     */
    private Integer unitid;

    @TableField(exist = false)
    private static final long serialVersionUID = 1L;

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
    public String getBookname() {
        return bookname;
    }

    /**
     *
     */
    public void setBookname(String bookname) {
        this.bookname = bookname;
    }

    /**
     *
     */
    public Date getPublicationdate() {
        return publicationdate;
    }

    /**
     *
     */
    public void setPublicationdate(Date publicationdate) {
        this.publicationdate = publicationdate;
    }

    /**
     *
     */
    public String getAuthor() {
        return author;
    }

    /**
     *
     */
    public void setAuthor(String author) {
        this.author = author;
    }

    /**
     *
     */
    public String getPublisher() {
        return publisher;
    }

    /**
     *
     */
    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    /**
     *
     */
    public String getBookcategory() {
        return bookcategory;
    }

    /**
     *
     */
    public void setBookcategory(String bookcategory) {
        this.bookcategory = bookcategory;
    }

    /**
     *
     */
    public Integer getPagecount() {
        return pagecount;
    }

    /**
     *
     */
    public void setPagecount(Integer pagecount) {
        this.pagecount = pagecount;
    }

    /**
     *
     */
    public BigDecimal getPrice() {
        return price;
    }

    /**
     *
     */
    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    /**
     *
     */
    public String getImagepath() {
        return imagepath;
    }

    /**
     *
     */
    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    /**
     *
     */
    public Integer getBookcount() {
        return bookcount;
    }

    /**
     *
     */
    public void setBookcount(Integer bookcount) {
        this.bookcount = bookcount;
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
        Bookinformation other = (Bookinformation) that;
        return (this.getBookid() == null ? other.getBookid() == null : this.getBookid().equals(other.getBookid()))
            && (this.getBookname() == null ? other.getBookname() == null : this.getBookname().equals(other.getBookname()))
            && (this.getPublicationdate() == null ? other.getPublicationdate() == null : this.getPublicationdate().equals(other.getPublicationdate()))
            && (this.getAuthor() == null ? other.getAuthor() == null : this.getAuthor().equals(other.getAuthor()))
            && (this.getPublisher() == null ? other.getPublisher() == null : this.getPublisher().equals(other.getPublisher()))
            && (this.getBookcategory() == null ? other.getBookcategory() == null : this.getBookcategory().equals(other.getBookcategory()))
            && (this.getPagecount() == null ? other.getPagecount() == null : this.getPagecount().equals(other.getPagecount()))
            && (this.getPrice() == null ? other.getPrice() == null : this.getPrice().equals(other.getPrice()))
            && (this.getImagepath() == null ? other.getImagepath() == null : this.getImagepath().equals(other.getImagepath()))
            && (this.getBookcount() == null ? other.getBookcount() == null : this.getBookcount().equals(other.getBookcount()))
            && (this.getUnitid() == null ? other.getUnitid() == null : this.getUnitid().equals(other.getUnitid()));
    }

    @Override
    public int hashCode() {
        final int prime = 31;
        int result = 1;
        result = prime * result + ((getBookid() == null) ? 0 : getBookid().hashCode());
        result = prime * result + ((getBookname() == null) ? 0 : getBookname().hashCode());
        result = prime * result + ((getPublicationdate() == null) ? 0 : getPublicationdate().hashCode());
        result = prime * result + ((getAuthor() == null) ? 0 : getAuthor().hashCode());
        result = prime * result + ((getPublisher() == null) ? 0 : getPublisher().hashCode());
        result = prime * result + ((getBookcategory() == null) ? 0 : getBookcategory().hashCode());
        result = prime * result + ((getPagecount() == null) ? 0 : getPagecount().hashCode());
        result = prime * result + ((getPrice() == null) ? 0 : getPrice().hashCode());
        result = prime * result + ((getImagepath() == null) ? 0 : getImagepath().hashCode());
        result = prime * result + ((getBookcount() == null) ? 0 : getBookcount().hashCode());
        result = prime * result + ((getUnitid() == null) ? 0 : getUnitid().hashCode());
        return result;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", bookid=").append(bookid);
        sb.append(", bookname=").append(bookname);
        sb.append(", publicationdate=").append(publicationdate);
        sb.append(", author=").append(author);
        sb.append(", publisher=").append(publisher);
        sb.append(", bookcategory=").append(bookcategory);
        sb.append(", pagecount=").append(pagecount);
        sb.append(", price=").append(price);
        sb.append(", imagepath=").append(imagepath);
        sb.append(", bookcount=").append(bookcount);
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

}
