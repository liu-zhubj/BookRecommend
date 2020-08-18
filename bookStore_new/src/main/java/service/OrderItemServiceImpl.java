package service;

import mapper.OrderItemMapper;

import mapper.OrderMapper;
import pojo.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * OrderItemService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-上午 10:15
 */
@Service
public class OrderItemServiceImpl implements OrderItemService {

    @Autowired
    OrderItemMapper orderItemMapper;

    @Autowired
    BookService bookService;

    @Autowired
    BookNewService bookNewService;

    @Override
    public List<OrderItem> listForCart(Integer user_id) {
        OrderItemExample example = new OrderItemExample();
        example.or().andUserIdEqualTo(user_id).andOrderIdIsNull();
        List<OrderItem> result = orderItemMapper.selectByExample(example);
        setProduct(result);

        return result;
    }

    public void setProduct(List<OrderItem> ois) {
        for (OrderItem oi : ois) {
            setProduct(oi);
        }
    }

    private void setProduct(OrderItem oi) {
        BookNew bookNews=bookNewService.get(oi.getProductId());
        //Book p = bookService.get(oi.getProductId());

        oi.setBookNew(bookNews);
    }

    @Override
    public void fill(List<Order> orders) {
        for (Order o : orders) {
            fill(o);
        }
    }

	@Override
	public void fill(Order order) {
		OrderItemExample example = new OrderItemExample();
		example.or().andOrderIdEqualTo(order.getId());
		example.setOrderByClause("id desc");
		List<OrderItem> orderItems = orderItemMapper.selectByExample(example);
		setProduct(orderItems);
		float total = 0;
		int totalNumber = 0;
		System.out.println(orderItems+"orderItems---------------------------------------------------------");
		for (OrderItem oi : orderItems) {
			total += oi.getNumber() * oi.getBookNew().getPrice();
			totalNumber += oi.getNumber();
		}
		order.setTotal(total);
		order.setTotalNumber(totalNumber);
		order.setOrderItems(orderItems);
    }

    @Override
    public void update(OrderItem orderItem) {
        orderItemMapper.updateByPrimaryKey(orderItem);
    }

    @Override
    public void add(OrderItem orderItem) {
        orderItemMapper.insertSelective(orderItem);
    }
    @Override
    public OrderItem getById(Integer id) {
        OrderItem orderItem = orderItemMapper.selectByPrimaryKey(id);
        setProduct(orderItem);
        return orderItem;
    }


    @Override
    public List<OrderItem> listByUserId(Integer user_id) {
        OrderItemExample orderItemExample=new OrderItemExample();
        orderItemExample.or().andUserIdEqualTo(user_id);
        return orderItemMapper.selectByExample(orderItemExample);
    }

    @Override
    public List<OrderItem> listByAnd(Integer user_id,Integer product_id) {
        OrderItemExample orderItemExample=new OrderItemExample();
        orderItemExample.or().andUserIdEqualTo(user_id).andProductIdEqualTo(product_id);
        List<OrderItem> list=orderItemMapper.selectByExample(orderItemExample);
        System.out.println("根据用户id和书籍id获得的订单项目类表中的项目有："+list.size());
        System.out.println("获得的项目id为："+list.get(0).getId()+"  "+list.get(0).getProductId()+" "+list.get(0).getNumber());
        return list;
    }
    @Override
    public  Integer deleteCartId(Integer user_id,Integer product_id){
        OrderItemExample orderItemExample=new OrderItemExample();
        orderItemExample.or().andUserIdEqualTo(user_id).andProductIdEqualTo(product_id).andOrderIdIsNull();
        int  i=orderItemMapper.deleteByExample(orderItemExample);
        return i;
    }



}
