package service;

import pojo.Order;
import pojo.OrderItem;

import java.util.List;

public interface OrderItemService {

    List<OrderItem> listForCart(Integer user_id);
    /*
    *
 * 为List<Order>填充订单项
 *
 * @param orders

     */
    void fill(List<Order> orders);



    void fill(Order o);

    /**
     * *
     * 更新OrderItem，也只是更新number属性
     *
     * @param orderItem


    void update(OrderItem orderItem);

     */

    void update(OrderItem orderItem);

    void add(OrderItem orderItem);
    /*
*
 * 通过id返回OrderItem项
 *
 * @param id
 * @return
*/

	OrderItem getById(Integer id);

    List<OrderItem> listByUserId(Integer user_id);
    List<OrderItem> listByAnd(Integer user_id,Integer product_id);
    Integer  deleteCartId(Integer user_id,Integer product_id);




}
