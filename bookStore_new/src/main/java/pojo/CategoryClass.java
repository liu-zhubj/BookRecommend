package pojo;

public class CategoryClass {
    private Integer id;

    private Integer categoryId;

    private String categoryClassname;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Integer categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryClassname() {
        return categoryClassname;
    }

    public void setCategoryClassname(String categoryClassname) {
        this.categoryClassname = categoryClassname == null ? null : categoryClassname.trim();
    }
}