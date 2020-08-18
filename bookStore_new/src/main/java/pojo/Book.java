package pojo;

import java.util.Date;

public class Book {
    private Integer id;

    private String bookname;

    private String bookinfo;

    private Long price;

    private Integer salenumber;

    private String publicsource;

    private String author;

    private Date date;

    private String image;

    private Integer classId;

    /*添加*/

    private Integer commentCout;

    public Integer getCommentCout() {
        return commentCout;
    }

    public void setCommentCout(Integer commentCout) {
        this.commentCout = commentCout;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getBookname() {
        return bookname;
    }

    public void setBookname(String bookname) {
        this.bookname = bookname == null ? null : bookname.trim();
    }

    public String getBookinfo() {
        return bookinfo;
    }

    public void setBookinfo(String bookinfo) {
        this.bookinfo = bookinfo == null ? null : bookinfo.trim();
    }

    public Long getPrice() {

        return price;
    }

    public void setPrice(Long price) {
        this.price = price;
    }

    public Integer getSalenumber() {
        return salenumber;
    }

    public void setSalenumber(Integer salenumber) {
        this.salenumber = salenumber;
    }

    public String getPublicsource() {
        return publicsource;
    }

    public void setPublicsource(String publicsource) {
        this.publicsource = publicsource == null ? null : publicsource.trim();
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author == null ? null : author.trim();
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image == null ? null : image.trim();
    }

    public Integer getClassId() {
        return classId;
    }

    public void setClassId(Integer classId) {
        this.classId = classId;
    }
}