package service;

import pojo.BookNew;
import pojo.Category;

import java.util.List;

public interface BookNewService {
    /**
     * 增加一条数据
     *
     * @param bookNew
     */
    int add(BookNew bookNew);

    /**
     * 通过id删除一条数据
     *
     * @param id
     */
    int delete(Integer id);

    /**
     * 更新一条数据
     *
     * @param bookNew
     */
    void update(BookNew bookNew);

    /**
     * 根据id获取一条数据
     *
     * @param id
     * @return
     */
    BookNew get(Integer id);

    /**
     * 根据category_id返回所有对应的Product数据
     *
     * @param category_id
     * @return
     */
    List<BookNew> list(Integer category_id);
    List<BookNew> list1(Integer category_id);


    void setCommentCount(BookNew bookNew);

    /**
     * 为多个分类填充产品集合
     *
     * @param categories
     */
    void fill(List<Category> categories);

    /**
     * 为一个分类填充产品集合
     *
     * @param category
     */
    void fill(Category category);

    /**
     * 为多个分类填充产品集合
     *
     * @param categories
     */
    void fillByRow(List<Category> categories);

    /**
     * 为产品填充ReviewCount字段
     *
     * @param product
     */
    //void setReviewCount(Product product);

    /**
     * 根据keyword返回相应的产品集合
     *
     * @param keyword
     * @return
     */
    List<BookNew> search(String keyword,int offset);

    List<BookNew> search(String keyword);
    /*挑选出最新的五本书*/

    List<BookNew> listBookNew();
    List<BookNew> listBookNew(String s);


	/*挑选出销量最好的五本书*/

    List<BookNew> listBookNewSale();
    List<BookNew> listBookNewAll();
}
