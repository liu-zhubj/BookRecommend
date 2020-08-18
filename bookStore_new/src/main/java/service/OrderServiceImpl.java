package service;

import mapper.OrderItemMapper;
import mapper.OrderMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import pojo.*;

import javax.servlet.http.HttpSession;
import java.util.List;

/**
 * OrderService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-上午 10:19
 */
@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	OrderMapper orderMapper;
	@Autowired
	OrderItemService orderItemService;
	@Autowired
	OrderItemMapper orderItemMapper;

	/*@Autowired
	OrderItemService orderItemService;*/

	@Override
	public Order get(Integer id) {
		return orderMapper.selectByPrimaryKey(id);
	}
	@Override
	public List<Order> listAll() {
		OrderExample example = new OrderExample();
		return orderMapper.selectByExample(example);
	}
	@Override
	public void update(Order order) {
		orderMapper.updateByPrimaryKey(order);
	}

	@Override
	public List<Order> list(Integer user_id, String excludedStatus) {
		OrderExample example = new OrderExample();
		example.or().andUser_idEqualTo(user_id).andStatusNotEqualTo(excludedStatus);
		example.setOrderByClause("id desc");
		return orderMapper.selectByExample(example);
	}
	@Override
	public void add(Order c) {
		orderMapper.insertSelective(c);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public float add1(Order order, List<OrderItem> orderItems) {
		float total = 0;
		add(order);

		// 用来模拟当增加订单后出现异常，观察事务管理是否预期发生
		if (false)
			throw new RuntimeException();

		for (OrderItem oi : orderItems) {
			oi.setOrderId(order.getId());
			orderItemService.update(oi);
			total += oi.getBookNew().getPrice() * oi.getNumber();
		}
		return total;
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public float add(Order order, List<BookNew> orderItems, HttpSession session) {
		float total = 0;
		add(order);
		OrderItem orderItem=new OrderItem();

		// 用来模拟当增加订单后出现异常，观察事务管理是否预期发生
		if (false)
			throw new RuntimeException();
		User user= (User) session.getAttribute("user");

		System.out.println("欢迎来到add方法"+order.getId()+"ooooid"+orderItems+"mmmmm"+orderItems.get(0).getBookname());
		for (BookNew oi : orderItems) {
			orderItem.setOrderId(order.getId());
			orderItem.setProductId(oi.getId());
			orderItem.setUserId(user.getId());
			orderItem.setNumber(oi.getSalenumber());
			orderItemService.add(orderItem);
			total += oi.getPrice() * orderItem.getNumber();
		}
		return total;
	}


	@Override
	public Integer getStatusNum(String s) {
		OrderExample o=new OrderExample();
		o.or().andStatusEqualTo(s);
		List<Order> orders= orderMapper.selectByExample(o);

		return orders.size();
	}

	@Override
	public int deleteOrderItem(int order_id) {
		OrderItemExample orderItemExample=new OrderItemExample();
		orderItemExample.or().andOrderIdEqualTo(order_id);
		int i=orderItemMapper.deleteByExample(orderItemExample);
		return i;
	}

	@Override
	public int deleteOrder(int order_id) {
		return orderMapper.deleteByPrimaryKey(order_id);
	}
	@Override
	public 	List<Order> searchOrder(String s){
		OrderExample orderExample=new OrderExample();
		String s1="%"+s+"%";
		orderExample.or().andOrder_codeLike(s1);
		orderExample.or().andReceiverLike(s1);
		orderExample.or().andAddressLike(s1);
		orderExample.or().andMobileLike(s1);
		return orderMapper.selectByExample(orderExample);
	}






	/*@Override
	public List<Order> list(Integer user_id, String excludedStatus) {
		OrderExample example = new OrderExample();
		example.or().andUserIdEqualTo(user_id).andStatusNotEqualTo(excludedStatus);
		example.setOrderByClause("id desc");
		return orderMapper.selectByExample(example);
	}

	@Override
	public List<Order> listByUserId(Integer user_id) {
		OrderExample example = new OrderExample();
		example.or().andUserIdEqualTo(user_id);
		return orderMapper.selectByExample(example);
	}

	@Override


	@Override
	public void add(Order c) {
		orderMapper.insert(c);
	}

	@Override
	@Transactional(propagation = Propagation.REQUIRED, rollbackForClassName = "Exception")
	public float add(Order order, List<OrderItem> orderItems) {
		float total = 0;
		add(order);

		// 用来模拟当增加订单后出现异常，观察事务管理是否预期发生
		if (false)
			throw new RuntimeException();

		for (OrderItem oi : orderItems) {
			oi.setOrderId(order.getId());
			orderItemService.update(oi);
			total += oi.getBooks().getPrice() * oi.getNumber();
		}
		return total;
	}*/
}
