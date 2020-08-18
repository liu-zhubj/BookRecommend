package controller;

import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import pojo.Address;
import pojo.OrderItem;
import pojo.User;
import service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

/**
 * User 控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-上午 9:51
 */
@Controller
@RequestMapping("/admin")
public class UserController {

	@Autowired
	UserService userService;
	@RequestMapping("welcome")
	public String welcome() {
		return "admin/welcome";
	}
	@RequestMapping("/listUser")
	public String list(Model model) {
		List<User> users = userService.list();
		model.addAttribute("users", users);
		return "admin/listUser";
	}
	@RequestMapping("/searchUser")
	public String searchUser(Model model,String s) {
		if(s.equals("")||s.equals(null)){
			return "redirect:listUser";
		}else
		{
			List<User> users=userService.searchUser(s);
			model.addAttribute("users", users);
			return "admin/listUser";
		}

	}
	@RequestMapping("/listUser1")
	public String list1(Model model) {
		List<User> users = userService.list();
		model.addAttribute("users", users);
		return "admin/listUser1";
	}

	@RequestMapping("/editUserPass")
	public String editPass(Model model, String pass) {
		model.addAttribute("pass", pass);
		return "admin/editUserPass";
	}
	@RequestMapping("/editUser")
	public String edit(Model model,Integer id) {
		System.out.println("99999999999999999999999999999999999999999999"+id);
		User user=userService.get(id);
		model.addAttribute("user", user);
		return "admin/editUser";
	}

	@RequestMapping("/updateUserPass")
	public String updatePass(Integer id, String password) {
		System.out.println("这里是User控制界面，id为："+id+"pass为"+password);
		userService.updatePassword(id, password);
		return "redirect:listUser";
	}
	@RequestMapping("/updateUser")
	public String update(User user) {
		System.out.println("这里是User控制界面，user为："+user+" "+user.getId());
		int i=userService.update(user);
		System.out.println("这里是User控制界面，更新结果为："+i);
		return "redirect:listUser";
	}
	@RequestMapping("/addUser")
	public String addUser(User user) {
		userService.add(user);
		return "redirect:listUser";
	}
	@RequestMapping("/add")
	public String add1() {

		return "admin/addUser";
	}
	@RequestMapping("/deleteUser")
	public String detele(Integer id) {
		int i=userService.delete(id);
		if(i==1)
			System.out.println("****************************删除用户成功");
		return "redirect:listUser";
	}
	@ResponseBody
	@RequestMapping("deleteAllUser")
	public Integer buy(Model model, @RequestParam String[] userId, HttpSession session) {
		int i=0;
		System.out.print("用户ID的列表======"+userId+" "+userId.toString()+" "+userId.length);
		for (String strId : userId) {
			int id = Integer.parseInt(strId);
			System.out.println("ididididiididididiididiuuuuuuuuuuuuuuuuuuuuuuuuuuuuuuu"+id);
			 i=userService.delete(id);
			 if(i==0){
			 	i=0;
			 	break;
			 }

		}
		return i;

		}




}
