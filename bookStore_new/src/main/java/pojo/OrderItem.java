package pojo;

public class OrderItem {
    private Integer id;

    private Integer productId;

    private Integer orderId;

    private Integer userId;

    private Integer number;

    private Book books;
    private  BookNew bookNew;

    public BookNew getBookNew() {
        return bookNew;
    }

    public void setBookNew(BookNew bookNew) {
        this.bookNew = bookNew;
    }

    public Book getBooks() {
        return books;
    }

    public void setBooks(Book books) {
        this.books = books;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getProductId() {
        return productId;
    }

    public void setProductId(Integer productId) {
        this.productId = productId;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }
}