package controller;

import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.*;
import service.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

/**
 * 专门用于前台页面跳转的控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-05-03-下午 15:03
 */
@Controller
@RequestMapping("")
public class Page_NewController {

	@Autowired
	UserService userService;

	@Autowired
	AddressService addressService;

	@Autowired
	OrderService orderService;
	@Autowired
	BookService bookService;
	@Autowired
	BookNewService bookNewService;

	@Autowired
	OrderItemService orderItemService;
	@Autowired
	CategoryClassService categoryClassService;
	@Autowired
	CategoryService categoryService;
	@Autowired
	ScoreService scoreService;
	@RequestMapping("/new")
	public String lo() {
		return "index_new";
	}
	/*验证登录*/
	@RequestMapping("/login")
	public String login(Model model,
						@RequestParam("name") String name,
						@RequestParam("password") String password,
						HttpSession session) {
		User user = userService.get(name, password);
		if (null == user) {
			model.addAttribute("msg", "账号密码错误");
			return "login";
		}
		if(name.equals("admin")){
			return "redirect:admin";
		}
		session.setAttribute("user", user);
		return "redirect:home";
	}
	/*从首页跳转到登录界面*/
	@RequestMapping("/login_new")
	public String login() {
		return "login";
	}
	/*从首页跳转到注册界面*/
	@RequestMapping("/register_new")
	public String register() {return "reg";
	}
	/*注册*/
	@RequestMapping("/register")
	public String register(Model model, User user) {
		String name = user.getName();
		boolean exist = userService.isExist(name);

		if (exist) {
			String msg = "用户名已经被占用，不能使用";
			model.addAttribute("msg", msg);
			model.addAttribute("username", user.getName());
			return "reg";
		}
		int i=userService.add(user);
		if(i==1){
			String msg = "注册成功请登录";
			model.addAttribute("msg", msg);
			model.addAttribute("username", user.getName());
			return "reg";
		}else{
			String msg = "注册失败";
			model.addAttribute("msg", msg);
			model.addAttribute("username", user.getName());
			return "reg";
		}

	}


	/*从首页跳转到个人界面*/
	@RequestMapping("/mine")
	public String mine(Model model,HttpSession session) {
		System.out.println("tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
		User user= (User) session.getAttribute("user");
		System.out.println("我成功获取到了user"+user.getName());
		int deliver=orderService.getStatusNum("waitDelivery");
		int pay=orderService.getStatusNum("waitPay");
		int review=orderService.getStatusNum("waitReview");
		int confirm=orderService.getStatusNum("waitConfirm");

		model.addAttribute("user",user);
		model.addAttribute("deliver",deliver);
		model.addAttribute("pay",pay);
		model.addAttribute("review",review);
		model.addAttribute("confirm",confirm);

		return "mine";
	}
	/*个人信息界面*/
	@RequestMapping("/mine_message")
	public  String message(Model model,HttpSession session) {
	//	System.out.println("tttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttttt");
		User user= (User) session.getAttribute("user");
	//	System.out.println("我成功获取到了user"+user.getName());
		model.addAttribute("user",user);

		return "mine_message";
	}
	/*个人信息右边界面首页*/
	@RequestMapping("/min_1")
	public  String min_1()
	{
		return "min_1";
	}
	/*修改密码*/
	@RequestMapping(value="/update_p",produces = "text/plain;charset=UTF-8")
	public  String min_2(Model model,String message)
	{
		model.addAttribute("msg",message);
		return "updatepassword";
	}
	@RequestMapping("/update_mymessage")
	public  String update_mymessage(Model model,HttpSession session,User user)
	{
		System.out.println("来自更新页面----------------------------------------------");
		System.out.println(user.getName());
		model.addAttribute("user",user);
		return "mine_message";
	}

	/*更新密码*/
	@RequestMapping(value="/updatemyP",produces = "text/plain;charset=UTF-8")
	public  String update_myP(Model model, HttpSession session, HttpServletRequest request) throws UnsupportedEncodingException {
		request.setCharacterEncoding("UTF-8");
		String msg="";
		System.out.println("来自更密码----------------------------------------------");
		User user= (User) session.getAttribute("user");
		String oldP=request.getParameter("oldpass");
		String newP=request.getParameter("newpass");
		String newP1=request.getParameter("newpass1");
		String mpass=user.getPassword();
		if(!newP.equals(newP1)){
			System.out.println("密码时不一致+++++++++++++++++++++++++++++++++++++++++++++++++++=");
			msg+="Two password entries are inconsistent";
			return "redirect:update_p?message="+msg;
		}
		if(!mpass.equals(oldP))
		{
			System.out.println("原密码不正确+++++++++++++++++++++++++++++++++++++++++++++++++++=");
			msg+="Original password error";
			return "redirect:update_p?message="+msg;
		}
		userService.updatePassword(user.getId(),newP);
		System.out.println("更新密码成功"+"---------------------------------------------------------------");
		msg+="Update successful";
		return "redirect:update_p?message="+msg;
	}
	/*地址界面*/
	@RequestMapping("/adress")
	public  String min_3(Model model,HttpSession session)
	{
		User user= (User) session.getAttribute("user");
		List<Address> listAd=addressService.getByuserId(user.getId());
		model.addAttribute("listAd",listAd);
		return "adress";
	}
	/*新增地址*/
	@RequestMapping("/add_address")
	public  String add_address(Model model, Address address,HttpSession session,HttpServletRequest request)
	{

		System.out.println("新增地址啦，成功了吗ppppppppppppppppp"+address.getDistrict());

		User user= (User) session.getAttribute("user");

		address.setUserid(user.getId());
		int i=addressService.addAddress(address);
		if(i==0){
			System.out.println("增加地址失败");
		}
		else{
			System.out.println("增加地址成功");
		}


		return  "redirect:adress";
	}

	 /*跳转到更新界面*/
	@RequestMapping("/update_add-new")
	public  String update_(Model model,Integer adr_id){
		Address address=addressService.getById(adr_id);
		model.addAttribute("addre",address);
		return "update_address";
	}

	/*删除地址*/
	@RequestMapping("/delete_address")
			public  String delete_address(Model model,Integer adr_id){
			int i=addressService.deleteById(adr_id);
		return  "redirect:adress";
}

	/*更新地址*/
	@RequestMapping("/update_address")
	public  String update_address(Model model, Address address,HttpSession session,HttpServletRequest request)
	{

		System.out.println("更新地址啦，成功了吗ppppppppppppppppp"+address.getId()+address.getDistrict()+address.getProvince()+address.getCity()+address.getAddress()
		+address.getName()+address.getPhone()+address.getUserid());

		User user= (User) session.getAttribute("user");

		address.setUserid(user.getId());
		System.out.println("更新地址啦，成功了吗ppppppppppppppppp"+address.getDistrict()+address.getProvince()+address.getCity()+address.getAddress()
				+address.getName()+address.getPhone()+address.getUserid());
		int i=addressService.update_add(address);
		if(i==0){
			System.out.println("更新地址失败");
		}
		else{
			System.out.println("跟新地址成功");
		}


		return  "redirect:adress";
	}
	/*我的订单*/
	@RequestMapping("/myorder")
	public  String min_4(Model model,HttpSession session)
	{
		User user = (User) session.getAttribute("user");
		List<Order> orders = orderService.list(user.getId(), "delete");
		orderItemService.fill(orders);
		model.addAttribute("orders", orders);

		return "myorder";
	}

	@RequestMapping("/order_info")
	public  String order_info(Model model,Integer order_id,Integer book_id)
	{
		Order order=orderService.get(order_id);
		BookNew bookNew=bookNewService.get(book_id);
		User user=userService.get(order.getUser_id());

		model.addAttribute("book",bookNew);
		model.addAttribute("user",user);


		model.addAttribute("order",order);
		return "order_info";
	}

	/*购物车*/

	@RequestMapping("/cart")
	public String cart(Model model, HttpSession session) {


		User user = (User) session.getAttribute("user");
		List<OrderItem> orderItems = orderItemService.listForCart(user.getId());
		model.addAttribute("orderItems", orderItems);

		return "cart";

	}


	/*@RequestMapping("/order_new")
	public String oder_new(Model model, HttpSession session) {

		return "order_new";

	}*/
	@RequestMapping("category_detail")
	public String oder_new(Model model,Integer category_id,Integer i,Integer limit) {

		CategoryClass categoryClass=categoryClassService.get(category_id);
		System.out.println("分类名：      --------------------------------------------"+categoryClass.getCategoryClassname());
		String name=categoryClass.getCategoryClassname();
		List<BookNew> bookNewList=scoreService.getListBook(name,i,limit);
		//Integer num=scoreService.getListBook(name);
		model.addAttribute("bookNewList",bookNewList);
		model.addAttribute("category",categoryClass);
		//model.addAttribute("num",num);

		return "category_detail";

	}
	@ResponseBody
	@RequestMapping(value = "category_detailn",produces = "text/html;charset=UTF-8")
	public String oder_new1(Model model,@RequestParam(value="category_id") Integer category_id,@RequestParam(value="limit") Integer limit) {
		System.out.println("进入ajax方法了"+category_id+"   "+limit+"   ");
        int i=0;
		CategoryClass categoryClass=categoryClassService.get(category_id);
		System.out.println("分类名：      --------------------------------------------"+categoryClass.getCategoryClassname());
		String name=categoryClass.getCategoryClassname();
		List<BookNew> bookNewList=scoreService.getListBook(name,i,limit*20);
		model.addAttribute("bookNewList",bookNewList);
		model.addAttribute("category",categoryClass);
		String jsonList = JSON.toJSONString(bookNewList);
		System.out.println("lzjlzjlzjzlzjlzjlzjlzjzlzzj锦"+bookNewList.size());
		return jsonList;

	}





	@RequestMapping("delete_orer")
	public String oder_delete(Model model,Integer order_id,Integer i) {
		int b=orderService.deleteOrderItem(order_id);
		int a=orderService.deleteOrder(order_id);



		 return  "redirect:myorder";

	}
	//买过该书的用户还喜欢
	@RequestMapping("UserPassLike")
	public String UserPassLike(Model model,Integer book_id,HttpSession session) {
		User user= (User) session.getAttribute("user");
		MyUserBasedRecommenderImpl myUserBasedRecommender=new MyUserBasedRecommenderImpl();
		List<Integer> userPassLike=myUserBasedRecommender.buyByUser(user.getId(),book_id);
		List<BookNew> bookNewList=new ArrayList<>();
		for(Integer id:userPassLike){
			BookNew bookNew=bookNewService.get(id);
			bookNewList.add(bookNew);
		}
		model.addAttribute("userPassLike",bookNewList);
		return  "book_detail";

	}




}
