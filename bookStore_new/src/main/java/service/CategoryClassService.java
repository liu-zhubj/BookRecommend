package service;


import pojo.Book;
import pojo.Category;
import pojo.CategoryClass;

import java.util.List;

public interface CategoryClassService {

	/**
	 * 增加一条子类
	 * @param categoryClass
	 */
void add(CategoryClass categoryClass);

	/**
	 * 根据id删除一条数据
	 * @param id
	 */
	//void delete(Integer id);

	/**
	 * 更新一条数据
	 * @param
	 */
	void update(CategoryClass categoryClass);
	int  delete(Integer id);

	/**
	 * 返回所有的category_id下的class_category列表
	 * @return
	 */
	List<CategoryClass> list(Integer category_id);

	/**
	 * 根据id返回一条数据
	 * @param id
	 */
	CategoryClass get(Integer id);

	//Property get(Integer id);
	List<Book> getListBookByClass(Integer category_id);

	void put(Integer id);

	List<CategoryClass> selectByCategoryId(Integer category_id);
	List<CategoryClass> selectAll();


}
