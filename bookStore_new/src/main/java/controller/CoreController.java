package controller;

import com.alibaba.fastjson.JSON;
import org.apache.mahout.cf.taste.common.TasteException;
import org.apache.mahout.cf.taste.recommender.RecommendedItem;
import pojo.*;
import service.*;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.Date;

/**
 * 前台控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-下午 14:45
 */
@Controller
public class CoreController {

   @Autowired
	UserService userService;
   @Autowired
   CategoryService categoryService;
   @Autowired
   CategoryClassService categoryClassService;
   @Autowired
   OrderItemService orderItemService;
  @Autowired
   CartService cartService;
   @Autowired
   BookService bookService;
   @Autowired
   OrderService orderService;
   @Autowired
   CommentService commentService;
   @Autowired
   AddressService addressService;
   @Autowired
   ScoreService scoreService;
   @Autowired
   BookNewService bookNewService;
   @Autowired
   MyUserBasedRecommender1 myUserBasedRecommender1;
   @Autowired
   MyItemBasedRecommender myItemBasedRecommender;


	@RequestMapping("/home")
	public String home(Model model,HttpSession session) {

		if(session.getAttribute("user")!=null)
		{
			User user= (User) session.getAttribute("user");
			System.out.println(user.getName());
			MyUserBasedRecommenderImpl muser=new MyUserBasedRecommenderImpl();
			List<RecommendedItem> listU=muser.userBasedRecommender(user.getId(),5);
			//List<RecommendedItem> listI=myItemBasedRecommender.myItemBasedRecommender(user.getId(),5);
			//System.out.println("wowoowowoowowowowo我我哦我我哦我我问"+listI.size()+"   "+listU.size());
			if(listU.equals(null)){
				List<BookNew> listByU = null;
				//List<BookNew> listByI = null;

				model.addAttribute("listByU",listByU);
				//model.addAttribute("listByI",listByI);
			}
			else {
				List<BookNew> listByU = getRecommend(listU);
				//List<BookNew> listByI = getRecommend(listI);
				model.addAttribute("listByU",listByU);
				//model.addAttribute("listByI",listByI);
			}




		}

		List<BookNew> listNew=bookNewService.listBookNew();
		List<BookNew> listSale=bookNewService.listBookNewSale();
		model.addAttribute("listNew",listNew);
		model.addAttribute("listSale",listSale);
		List<List<CategoryClass>> categoryClasses= new ArrayList<>();
		List<Category> categories = categoryService.list();
		for(Category c:categories)
		{
			categoryClasses.add(categoryClassService.list(c.getId()));
		}

		for(List<CategoryClass> array:categoryClasses)
		{
			 for(CategoryClass category_Class:array)
			 {
			 	System.out.println(category_Class.getCategoryClassname());
			 	System.out.println("home+++++++++++===========================================================kkkoookkoo0000000");
			 }
		}
		model.addAttribute("categories", categories);

		model.addAttribute("classes", categoryClasses);

		return "index";

	}

	public List<BookNew> getRecommend(List<RecommendedItem> list){
		List<BookNew> listBook = new ArrayList<>();
		for(RecommendedItem r:list){
			Integer id= Math.toIntExact(r.getItemID());

			//System.out.println("我想要推荐的书籍是id"+id+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			BookNew book=bookNewService.get(id);
			//System.out.println("我想要推荐的书籍是book"+book.getBookname()+"$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$");
			listBook.add(book);
		}

		return listBook;
	}


	@RequestMapping("buy")
	public String buy(Model model, String[] orderItemId, HttpSession session,Integer bb) {
		User user= (User) session.getAttribute("user");
		List<Address> addresses=addressService.getByuserId(user.getId());
		List<OrderItem> orderItems = new ArrayList<>();
		float total = 0;

		for (String strId : orderItemId) {
			int id = Integer.parseInt(strId);
			System.out.println("ididididiididididiididiuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"+id);
			OrderItem oi = orderItemService.getById(id);
			total += oi.getBookNew().getPrice() * oi.getNumber();

				orderItems.add(oi);

		}

		session.setAttribute("orderItems", orderItems);
		model.addAttribute("addressList",addresses);
		model.addAttribute("total", total);
		return "buyPage1";
		/*List<Book> orderItems = new ArrayList<>();
		float total = 0;
System.out.println(orderItemId+"cart返回的值zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz");
		for (String strId : orderItemId) {
			int id = Integer.parseInt(strId);
			Book oi = bookService.get(id);
			*//*if(oi.getPrice().equals(null)) oi.setPrice((long) 0);
			if(oi.getSalenumber().equals(null)) oi.setSalenumber(0);*//*
			total += oi.getPrice() * oi.getSalenumber();
			orderItems.add(oi);
		}



		model.addAttribute("bookItems", orderItems);
		model.addAttribute("total", total);
		return "buyPage1";*/
	}

	@RequestMapping("buyCopy")
	public String buyCopy(Model model, List<OrderItem> list, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Address> addresses = addressService.getByuserId(user.getId());
		List<OrderItem> orderItems = new ArrayList<>();
		float total = 0;

		for (OrderItem oi : list) {

			total += oi.getBookNew().getPrice() * oi.getNumber();
			orderItems.add(oi);
		}

		session.setAttribute("orderItems", orderItems);
		model.addAttribute("addressList", addresses);
		model.addAttribute("total", total);
		return "buyPage1";
	}



	@RequestMapping("deleteCartBook")
	public String deleteCartBook(Model model, Integer book_id,HttpSession session) {
		User user = (User) session.getAttribute("user");
		int i=orderItemService.deleteCartId(user.getId(),book_id);
			return "redirect:cart";
	}

	/*我的订单*/
	@RequestMapping("bought")
	public String bought(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<Order> orders = orderService.list(user.getId(), "delete");
		orderItemService.fill(orders);
		model.addAttribute("orders", orders);

		return "bought";
	}

	/*确认收货*/
	@RequestMapping("confirmPay")
	public String confirmPay(Model model, Integer order_id) {
		Order order = orderService.get(order_id);
		System.out.println("order=============================================="+order);
		orderItemService.fill(order);
		model.addAttribute("order", order);
		return "confirmPay";
	}
	/*确认收货*/
	@RequestMapping("orderConfirmed")
	public String orderConfirmed(Model model, Integer order_id) {
		Order o = orderService.get(order_id);
		o.setStatus(OrderService.waitReview);
		o.setConfirm_date(new Date());
		orderService.update(o);
		return "orderConfirmedPage";
	}

	/*确认支付*/
	@RequestMapping("payed")
	public String payed(int order_id, float total, Model model,HttpServletRequest request) throws IOException, TasteException {
		Order order = orderService.get(order_id);
		order.setStatus(OrderService.waitDelivery);
		order.setPay_date(new Date());
		orderService.update(order);
		model.addAttribute("o", order);

		//获取cookie
		List<BookNew> historyList=new ArrayList<BookNew>();
		List<Integer> historyListid=new ArrayList<Integer>();
		Cookie [] cookies=request.getCookies();//从cookie中获取用户最近浏览过的书籍
		System.out.println("浏览过的商品数为："+cookies.length+"--- "+cookies.toString());
		if(cookies!=null){
			for(Cookie cookie : cookies){
				if("pids".equals(cookie.getName())){
					String pids=cookie.getValue();
					String [] splits=pids.split("-");
					for (int i = 0; i < splits.length; i++) {//遍历得到的书籍
						String pid=splits[i];
						int mm=scoreService.getNumByBookId(Integer.valueOf(pid));
						if(mm==1) {
							long[] bookIdList = myItemBasedRecommender.myItem(Long.valueOf(pid));//计算其相似书籍
							System.out.println("书籍 " + pid + "的相似书籍有：" + bookIdList.length + " " + bookIdList.toString());
							for (long l : bookIdList) {
								historyListid.add((int) l);
							}
						}
						else{
							continue;
						}
					}
				}
			}
		}
		System.out.println("未清除重复前的值"+historyListid.size());
		HashSet set = new HashSet(historyListid);
		// 清空list集合
		historyListid.clear();
// 将去重后的元素重新添加到list中
		historyListid.addAll(set);
		System.out.println("清除重复hou的值"+historyListid.size());
		int cc=0;
		for(Integer in:historyListid){
			if(cc>99)
			{
				break;
			}
            BookNew bookNewe=bookNewService.get(in);
            historyList.add(bookNewe);
            cc++;
		}
		model.addAttribute("historyList",historyList);

		return "payed";
	}
	@RequestMapping("alipay")
	public String alipay(int order_id, float total, Model model) {
		model.addAttribute("order_id", order_id);
		model.addAttribute("total",total);
		return "alipay";
	}
/*评价*/
@RequestMapping("review")
public String review(Model model, Integer book_id,Integer order_id) {
	BookNew bookNew=bookNewService.get(book_id);
	//Book book=bookService.get(book_id);
	Order order = orderService.get(order_id);
	orderItemService.fill(order);
	List<Comment> comments=commentService.listByBookId(book_id);
	/*bookNewService.set
	bookService.setCommentCount(book);*/
	System.out.println(bookNew.getBookname()+"000000000"+order.getAddress()+"0000000"+comments.size());
	model.addAttribute("product", bookNew);
	model.addAttribute("order", order);
	model.addAttribute("reviews", comments);
	return "reviewPage";
}


	public void review1(Model model, Integer order_id) {
			Order order = orderService.get(order_id);
			orderItemService.fill(order);
			BookNew bookNew=order.getOrderItems().get(0).getBookNew();
		//Book book1 = order.getOrderItems().get(0).getBooks();
		List<Comment> comments=commentService.listByBookId(bookNew.getId());
		bookNewService.setCommentCount(bookNew);
		System.out.println(bookNew.getBookname()+"1111111111111111111111"+order.getAddress()+"0000000"+comments.size());
		model.addAttribute("product", bookNew);
		model.addAttribute("order", order);
		model.addAttribute("reviews", comments);
	}

	/*书籍详情*/
	@RequestMapping("/showProduct")
	public String showProduct(Model model, Integer product_id, HttpSession session, HttpServletRequest request, HttpServletResponse response) throws IOException, TasteException {
		BookNew bookNew=bookNewService.get(product_id);
		if(scoreService.getNumByBookId(product_id)==1) {
			long[] bookIdList = myItemBasedRecommender.myItem(product_id);
			List<BookNew> bookNewList = listBookId(bookIdList);
			model.addAttribute("booksByxiangsi",bookNewList);
		}
		else{
			model.addAttribute("booksByxiangsi",null);
		}

		/*if(bookIdList.length==0)
		{
			model.addAttribute("booksByxiangsi",n);
		}
		else {*/
		//}



		if(session.getAttribute("user")!=null)
		{
			User user= (User) session.getAttribute("user");
			//MyUserBasedRecommenderImpl muser=new MyUserBasedRecommenderImpl();
			//MyItemBasedRecommender mItem=new MyItemBasedRecommender();
			List<RecommendedItem> listI=myUserBasedRecommender1.userBasedRecommender(user.getId(),5);
			//List<RecommendedItem> listI=mItem.myItemBasedRecommender(user.getId(),5);
			List<BookNew> listByI=getRecommend(listI);
			//List<BookNew> listByI=getRecommend(listI);
			System.out.println("得到的已经购买过该书的用户的集合：-------------------");
			List<Integer> userPassLike=myUserBasedRecommender1.buyByUser(user.getId(),product_id);
			System.out.println("得到的已经购买过该书的用户的集合："+userPassLike.size());
			List<BookNew> bookNewList1=new ArrayList<>();
			for(Integer id:userPassLike){
				BookNew bookNew1=bookNewService.get(id);
				bookNewList1.add(bookNew1);
			}
			model.addAttribute("listByI",listByI);
			model.addAttribute("userPassLike",bookNewList1);
		}


		model.addAttribute("product", bookNew);
		List<Comment> comments=commentService.listByBookId(product_id);
		model.addAttribute("reviews", comments);


		long couts[]=new long[5];
		couts=scoreService.getNumByBook(product_id);
		model.addAttribute("couts",couts);

		/*long c1=scoreService.getPeopleByScore(1);
		long c2=scoreService.getPeopleByScore(2);
		long c3=scoreService.getPeopleByScore(3);
		long c4=scoreService.getPeopleByScore(4);
		long c5=scoreService.getPeopleByScore(5);
		model.addAttribute("c1",c1);
		model.addAttribute("c2",c2);
		model.addAttribute("c3",c3);
		model.addAttribute("c4",c4);
		model.addAttribute("c5",c5);*/

//ccokie
		String pids= String.valueOf(product_id);
		Cookie[] cookies=  request.getCookies();
		if(cookies!=null){
			for(Cookie cookie: cookies){
				if("pids".equals(cookie.getName())){
					//将值 3-2-8存放
					pids=cookie.getValue();
					String [] split= pids.split("-");
					List<String> aslist=Arrays.asList(split);
					LinkedList<String> list=new LinkedList<String>(aslist);
					if(list.contains(String.valueOf(product_id))){
						list.remove(String.valueOf(product_id));
						list.addFirst(String.valueOf(product_id));
					}else{
						list.addFirst(String.valueOf(product_id));
					}
					StringBuffer sb=new StringBuffer();
					for(int i=0;i<list.size();i++){
						sb.append(list.get(i)).append("-");
					}
					sb.deleteCharAt(sb.length()-1);
					pids=sb.toString();
				}

			}
		}

		Cookie  cookie=new Cookie("pids", pids);
		response.addCookie(cookie);


		return "book_detail";
	}

	public List<BookNew> listBookId(long[] b){
		List<BookNew> list=new ArrayList<>();
		int i=0;
		for(long l:b){
			if(i>=4)
			{
				break;
			}
			BookNew book=bookNewService.get(Math.toIntExact(l));
			list.add(book);
			i++;
		}
		return list;
	}
	@RequestMapping("/showProduct1")
	public String showProduct1(Model model, Integer product_id) {
		Book book=bookService.get(product_id);
		CategoryClass c=categoryClassService.get(book.getClassId());
		bookService.setCommentCount(book);
		model.addAttribute("product", book);
		List<Comment> comments=commentService.listByBookId(product_id);
		model.addAttribute("caregoryclass",c);
		model.addAttribute("reviews", comments);
		return "book_detail";
	}
	@RequestMapping("createOrder")
	public String createOrder(Model model, Order order, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		order.setOrder_code(orderCode);
		order.setCreate_date(new Date());
		order.setUser_id(user.getId());
		order.setStatus(OrderService.waitPay);
		List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
		float total = orderService.add1(order, orderItems);
		return "redirect:payPage?order_id=" + order.getId() + "&total=" + total;
	}

/*
	@RequestMapping("createOrder1")
	public String createOrder1(Model model, Order order, HttpSession session) {
		System.out.println("WELCOME TO CREAToRDER@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@");

		User user = (User) session.getAttribute("user");
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		order.setOrder_code(orderCode);
		order.setCreate_date(new Date());
		order.setUser_id(user.getId());
		order.setStatus(OrderService.waitPay);
		List<BookNew> orderItems = (List<BookNew>) session.getAttribute("orderItems");
		System.out.println("orderItems from cartjsp*8888888888888888888888888888888888888888888888888888");
		System.out.println(orderItems);
		float total = orderService.add(order, orderItems,session);
		return "redirect:payPage?order_id=" + order.getId() + "&total=" + total;
	}
*/


	/**
	 * 加入购物车方法，跟buyone()方法有些类似，但返回不同
	 * 仍然需要新增订单项OrderItem，考虑两个情况：
	 * 1.如果这个产品已经存在于购物车中，那么只需要相应的调整数量就可以了
	 * 2.如果不存在对应的OrderItem项，那么就新增一个订单项（OrderItem）
	 * - 前提条件：已经登录
	 *
	 * @param product_id
	 * @param num
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("addCart")
	public String addCart(int product_id, int num, Model model, HttpSession session) {
		BookNew bookNew=bookNewService.get(product_id);
		//Book  book=bookService.get(product_id);
		User user = (User) session.getAttribute("user");
		boolean found = false;

		List<OrderItem> ois = orderItemService.listByUserId(user.getId());

		for (OrderItem oi : ois) {
			BookNew b1=bookNewService.get(oi.getProductId());
			if (b1.getId().intValue() == bookNew.getId().intValue()) {
				oi.setNumber(num);
				oi.setOrderId(null);
				orderItemService.update(oi);
				found = true;
				break;
			}
		}

		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setUserId(user.getId());
			oi.setNumber(num);
			oi.setProductId(product_id);
			orderItemService.add(oi);
		}
        model.addAttribute("msg","添加成功");
		return "redirect:showProduct?product_id="+product_id;
	}



	@RequestMapping("/buyone")
	public String buyone(Integer product_id, Integer number, HttpSession session) {
		System.out.println("number"+product_id+"nnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnnn"+number);
		BookNew bookNew=bookNewService.get(product_id);
		//Book book=bookService.get(product_id);
		int orderItemId = 0;

		User user = (User) session.getAttribute("user");
		boolean found = false;
		List<OrderItem> orderItems = orderItemService.listByUserId(user.getId());
		System.out.println("number"+product_id+"00000000000000000000000000000000"+orderItems.size());
		for (OrderItem orderItem : orderItems) {


			if (orderItem.getProductId().intValue() == bookNew.getId().intValue()) {
				System.out.println("number"+product_id+"00000000000000000000000000000000数据库中有");
				found=true;
				orderItem.setNumber( number);
				orderItemService.update(orderItem);
				orderItemId = orderItem.getId();
				break;
			}
		}

		if (!found) {
			System.out.println("number"+product_id+"00000000000000000000000000000000数据库中没有"+number);

			OrderItem orderItem = new OrderItem();
			orderItem.setUserId(user.getId());
			orderItem.setNumber(number);
			orderItem.setProductId(product_id);
			orderItemService.add(orderItem);
			System.out.println("该订单的id是1："+orderItem.getId()+" "+orderItem.getNumber());
			List<OrderItem> list11=orderItemService.listByAnd(user.getId(),product_id);
			orderItemId=list11.get(0).getId();
			System.out.println("该订单的id是2："+orderItemId);
			/*orderItemService.update(orderItem);
			int i=orderItem.getNumber();
			if(orderItem.getId()==null){
				orderItemId = orderItem.getId();
				System.out.println("该订单的id是2："+orderItem.getId());
			}
			System.out.println("该订单的id是3："+orderItem.getId());
			orderItemId = orderItem.getId();*/
		}


		return "redirect:buy?orderItemId="+orderItemId;
		/*return "redirect:buyCopy?orderItemId=" + orderItemId+"&number="+number;*/
	}

	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("user");
		return "redirect:home";
	}


	@RequestMapping("/searchProduct")
	public String searchProduct(Model model, String keyword) {
		List<BookNew> products = bookNewService.search(keyword,0);
		model.addAttribute("products", products);
		model.addAttribute("keywords", keyword);
		return "searchResult";
	}
	@ResponseBody
	@RequestMapping(value = "/searchProduct1",produces = "text/html;charset=UTF-8")
	public String searchProduct1(Model model,@RequestParam(value="keyword") String keyword,@RequestParam(value="limit") Integer limit) {
		System.out.println("进入ajax方法了"+keyword+"   "+limit+"   ");
		List<BookNew> products = bookNewService.search(keyword,limit*20);
		/*for (BookNew product : products) {
			product.setReviewCount(reviewService.getCount(product.getId()));
		}*/
		model.addAttribute("products", products);
		model.addAttribute("keywords", keyword);
		String jsonList = JSON.toJSONString(products);
		return jsonList;
	}


	@RequestMapping("doreview")
	public String doreview(Model model, HttpSession session,
						   @RequestParam("order_id") Integer order_id,
						   @RequestParam("product_id") Integer product_id,
						   @RequestParam("score") Integer score1,
						   String content,HttpServletRequest request) throws IOException {
System.out.println("SCORE1----------------------------------------------------------------------"+score1);

		Integer  score = Integer.valueOf(request.getParameter("score"));
		System.out.println("SCORE----------------------------------------------------------------------"+score);
		Order order = orderService.get(order_id);
		order.setStatus(OrderService.finish);
		orderService.update(order);

		User user = (User) session.getAttribute("user");
		Comment comment=new Comment();
		comment.setContent(content);
		comment.setBookid(product_id);
		comment.setPublicDate(String.valueOf(new Date()));
		comment.setUserid(user.getId());
		comment.setCommentScore(String.valueOf(score));

		int i=commentService.add(comment);
		if(i==1)
		{
			System.out.println("添加成功+++++++++++++++++++++++++++++++++++++++++++++++");

		}else
		{
			System.out.println("添加失败+++++++++++++++++++++++++++++++++++++++++++++++");
		}

		review1(model,order_id);

		//更新数据库
		int j=scoreService.addScore(user.getId(),product_id,score);
		System.out.println("添加数据库+++++++++++++++++++++++++++++++++++++++++++++++"+j);
		//更新文件
		scoreService.ddui(user.getId(),product_id,score);
		model.addAttribute("showonly",true);
		return "reviewPage.jsp?showonly=true";
	}

	/*

	@RequestMapping("/searchProduct")
	public String searchProduct(Model model, String keyword) {

		PageHelper.offsetPage(0, 20);
		List<Product> products = productService.search(keyword);
		for (Product product : products) {
			product.setReviewCount(reviewService.getCount(product.getId()));
		}
		model.addAttribute("products", products);
		return "searchResult";
	}

	@RequestMapping("sortProduct")
	public String sortProduct(Model model, String sort, String keyword) {
		List<Product> products = productService.search(keyword);
		for (Product product : products) {
			product.setReviewCount(reviewService.getCount(product.getId()));
		}
		if (null != sort) {
			switch (sort) {
				case "all":
					Collections.sort(products, Comparator.comparing(Product::getSaleXReviewCount));
					break;
				case "reviewCount":
					Collections.sort(products, Comparator.comparing(Product::getReviewCount));
					break;
				case "date":
//					Collections.sort(products, comparing(Product::get));
					break;
				case "sale":
					Collections.sort(products, Comparator.comparing(Product::getSale));
					break;
				case "price":
					Collections.sort(products, Comparator.comparing(Product::getPrice));
					break;
			}
		}
		model.addAttribute("products", products);

		return "searchResult";
	}

	*//**
	 * 立即购买（即新增OrderItem项）需要考虑以下两种情况：
	 * 1.如果这个产品已经存在于购物车中，那么只需要相应的调整数量就可以了
	 * 2.如果不存在对应的OrderItem项，那么就新增一个订单项（OrderItem）
	 * - 前提条件：已经登录
	 *
	 * @param product_id 产品的ID
	 * @param number     购买的数量
	 * @param session    session用于获取user信息
	 * @return
	 *//*
	@RequestMapping("/buyone")
	public String buyone(Integer product_id, Integer number, HttpSession session) {
		Product product = productService.get(product_id);
		int orderItemId = 0;

		User user = (User) session.getAttribute("user");
		boolean found = false;
		List<OrderItem> orderItems = orderItemService.listByUserId(user.getId());
		for (OrderItem orderItem : orderItems) {
			if (orderItem.getProduct_id().intValue() == product.getId().intValue()) {
				orderItem.setNumber(orderItem.getNumber() + number);
				orderItemService.update(orderItem);
				orderItemId = orderItem.getId();
				break;
			}
		}

		if (!found) {
			OrderItem orderItem = new OrderItem();
			orderItem.setUser_id(user.getId());
			orderItem.setNumber(number);
			orderItem.setProduct_id(product_id);
			orderItemService.add(orderItem);
			orderItemId = orderItem.getId();
		}

		return "redirect:buy?orderItemId=" + orderItemId;
	}


	@RequestMapping("createOrder")
	public String createOrder(Model model, Order order, HttpSession session) {
		User user = (User) session.getAttribute("user");
		String orderCode = new SimpleDateFormat("yyyyMMddHHmmssSSS").format(new Date());
		order.setOrder_code(orderCode);
		order.setCreate_date(new Date());
		order.setUser_id(user.getId());
		order.setStatus(OrderService.waitPay);
		List<OrderItem> orderItems = (List<OrderItem>) session.getAttribute("orderItems");
		float total = orderService.add(order, orderItems);
		return "redirect:payPage?order_id=" + order.getId() + "&total=" + total;
	}

	@RequestMapping("payed")
	public String payed(int order_id, float total, Model model) {
		Order order = orderService.get(order_id);
		order.setStatus(OrderService.waitDelivery);
		order.setPay_date(new Date());
		orderService.update(order);
		model.addAttribute("o", order);
		return "payed";
	}

	*//**
	 * 加入购物车方法，跟buyone()方法有些类似，但返回不同
	 * 仍然需要新增订单项OrderItem，考虑两个情况：
	 * 1.如果这个产品已经存在于购物车中，那么只需要相应的调整数量就可以了
	 * 2.如果不存在对应的OrderItem项，那么就新增一个订单项（OrderItem）
	 * - 前提条件：已经登录
	 *
	 * @param product_id
	 * @param num
	 * @param model
	 * @param session
	 * @return
	 *//*
	@RequestMapping("addCart")
	@ResponseBody
	public String addCart(int product_id, int num, Model model, HttpSession session) {
		Product p = productService.get(product_id);
		User user = (User) session.getAttribute("user");
		boolean found = false;

		List<OrderItem> ois = orderItemService.listByUserId(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == p.getId().intValue()) {
				oi.setNumber(oi.getNumber() + num);
				orderItemService.update(oi);
				found = true;
				break;
			}
		}

		if (!found) {
			OrderItem oi = new OrderItem();
			oi.setUser_id(user.getId());
			oi.setNumber(num);
			oi.setProduct_id(product_id);
			orderItemService.add(oi);
		}

		return "success";
	}

	*//**
	 * 查看购物车方法：
	 * 1.首先通过session获取到当前的用户
	 * 2.获取这个用户关联的订单项的集合
	 *
	 * @param model
	 * @param session
	 * @return
	 *//*
	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {
		User user = (User) session.getAttribute("user");
		List<OrderItem> orderItems = orderItemService.listForCart(user.getId());
		model.addAttribute("orderItems", orderItems);
		return "cart";
	}

	@RequestMapping("/checkLogin")
	@ResponseBody
	public String checkLogin(HttpSession session) {
		User user = (User) session.getAttribute("user");
		if (null != user)
			return "success";
		return "fail";
	}

	@RequestMapping("changeOrderItem")
	@ResponseBody
	public String changeOrderItem(Model model, HttpSession session, int product_id, int number) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";

		List<OrderItem> ois = orderItemService.listByUserId(user.getId());
		for (OrderItem oi : ois) {
			if (oi.getProduct().getId().intValue() == product_id) {
				oi.setNumber(number);
				orderItemService.update(oi);
				break;
			}
		}
		return "success";
	}

	@RequestMapping("deleteOrderItem")
	@ResponseBody
	public String deleteOrderItem(Model model, HttpSession session, Integer orderItemId) {
		User user = (User) session.getAttribute("user");
		if (null == user)
			return "fail";
		orderItemService.delete(orderItemId);
		return "success";
	}





	@RequestMapping("deleteOrder")
	@ResponseBody
	public String deleteOrder(Model model, Integer order_id) {
		Order o = orderService.get(order_id);
		o.setStatus(OrderService.delete);
		orderService.update(o);
		return "success";
	}

	@RequestMapping("review")
	public String review(Model model, Integer order_id) {
		Order order = orderService.get(order_id);
		orderItemService.fill(order);
		Product product = order.getOrderItems().get(0).getProduct();
		List<Review> reviews = reviewService.listByProductId(product.getId());
		productService.setReviewCount(product);
		model.addAttribute("product", product);
		model.addAttribute("order", order);
		model.addAttribute("reviews", reviews);
		return "reviewPage";
	}


*/
}
