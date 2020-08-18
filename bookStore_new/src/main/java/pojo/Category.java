package pojo;

import java.util.List;

public class Category {
    private Integer id;

    private String name;

    private List<Book> books;

    private List<BookNew> bookNews;
    private List<List<BookNew>> bookNewByRow;


    private List<List<Book>> bookByRow;

    public List<BookNew> getBookNews() {
        return bookNews;
    }

    public void setBookNews(List<BookNew> bookNews) {
        this.bookNews = bookNews;
    }

    public List<List<BookNew>> getBookNewByRow() {
        return bookNewByRow;
    }

    public void setBookNewByRow(List<List<BookNew>> bookNewByRow) {
        this.bookNewByRow = bookNewByRow;
    }

    public List<Book> getBooks() {
        return books;
    }

    public void setBooks(List<Book> books) {
        this.books = books;
    }

    public List<List<Book>> getBookByRow() {
        return bookByRow;
    }

    public void setBookByRow(List<List<Book>> bookByRow) {
        this.bookByRow = bookByRow;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }
}