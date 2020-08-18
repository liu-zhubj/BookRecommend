package service;

import pojo.Book;
import pojo.Comment;

import java.util.List;

public interface CommentService {

	/**
	 * 根据product_id来返回当前产品下的所有评论
	 *
	 * @param book_id
	 * @return
	 */
List<Comment> listByBookId(Integer book_id);

/**
 * 返回当前产品下评论的数量
 *
 */

 int getCount(int book_id);

	/**
	 * 增加一条评论
	 *
	 * @param comment
	 */
	int add(Comment comment);
	/**
	 * 增加一条评论
	 *
	 * @param review
	 */
	//void add(Review review);

	/**
	 * 删除一条评论
	 *
	 * @param id
	 */
//	void delete(int id);

	/**
	 * 更新一条评论
	 *
	 * @param review
	 */
//	void update(Review review);

	/**
	 * 通过id返回一条Review
	 *
	 * @param id
	 * @return
	 */
//	Review get(int id);

	/**
	 * 根据product_id来返回当前产品下的所有评论
	 *
	 * @param product_id
	 * @return
	 */
//	List<Review> listByProductId(Integer product_id);

	/**
	 * 返回当前产品下评论的数量
	 *
	 * @param product_id
	 * @return
	 */
//	int getCount(int product_id);
}
