package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import pojo.BookNew;
import pojo.Category;
import pojo.CategoryClass;
import service.BookNewService;
import service.CategoryClassService;
import service.CategoryService;

import java.util.List;

/**
 * Category 的控制类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-下午 16:37
 */
@Controller
@RequestMapping("/admin")
public class CategoryController {

	@Autowired
	CategoryService categoryService;
	@Autowired
	BookNewService bookNewService;
	@Autowired
	CategoryClassService categoryClassService;

	@RequestMapping("/listCategory")
	public String list(Model model) {
		List<Category> categories = categoryService.list();
		model.addAttribute("categories", categories);
		return "admin/listCategory";
	}

@RequestMapping("/editCategory")
	public String edit(Category category,Model model) {
		model.addAttribute("category", category);
		return "admin/editCategory";
	}

	@RequestMapping("/updateCategory")
	public String update(Category category) {
		categoryService.update(category);
		return "redirect:listCategory";
	}
	@RequestMapping("/addCategory")
	public String addCategory(Category category) {
		System.out.println("UUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU"+category+" "+category.getName());
		int i=categoryService.add(category);
		System.out.println("添加分类成功了吗+++++++++++++++++++++++"+i);
		return "redirect:listCategory";
	}
	@RequestMapping("/deleteCategory")
	public String deleteCategory(Integer id) {
		int i=categoryService.delete(id);
		System.out.println("删除分类成功了吗+++++++++++++++++++++++"+i);
		return "redirect:listCategory";
	}
///添加子栏目跳转到想要界面
	@RequestMapping("/addCategoryredirt")
	public String addCategory1(Model model,Integer id) {
		model.addAttribute("id",id);
		return "admin/addCategory_class";
	}
	//编辑子栏目跳转到相应界面

	@RequestMapping("/adminBookInfo")
	public String adminBookInfo(Model model, Integer product_id) {
		BookNew bookNew=bookNewService.get(product_id);
		model.addAttribute("product",bookNew);

		return  "admin/book_info";

	}

	@RequestMapping("/editProduct")
	public String editProduct(Model model, Integer id,Integer category_id) {
		BookNew bookNew=bookNewService.get(id);
		if(category_id!=null) {
			CategoryClass categoryClass = categoryClassService.get(category_id);
			model.addAttribute("category",categoryClass);

		}
		else{
			List<CategoryClass> categoryClasses=categoryClassService.selectAll();
			model.addAttribute("categoryClasses",categoryClasses);

		}

		model.addAttribute("product",bookNew);

		return  "admin/editProduct";

	}
	@RequestMapping("/updateProduct")
	public String updateProduct(Model model,BookNew bookNew,Integer category_classId) {
		bookNewService.update(bookNew);

		return "redirect:listProduct_class?id=" +category_classId;

	}
	@RequestMapping("/addProductByCategory")
	public String addProductByCategory(Model model,BookNew bookNew,Integer category_id) {
		int i=bookNewService.add(bookNew);
		System.out.println("----------------------------------------------------------+"+i);

		return "redirect:listProduct_class?id=" +category_id;

	}

	@RequestMapping("/addProductRdirtByC")
	public String addProductRdirtByC(Model model,Integer categoryClass_id) {
		if(categoryClass_id!=null) {
			model.addAttribute("categoryClass_id", categoryClass_id);
		}
		else{
			List<CategoryClass> categoryClasses=categoryClassService.selectAll();
			model.addAttribute("categoryClasses",categoryClasses);
		}
		return "admin/addBookByCategory";

	}
	@RequestMapping("/deleteProduct")
	public String deleteProduct(Model model,Integer id,Integer category_id) {
		int i=bookNewService.delete(id);
		System.out.println("-delete---------------------------------------------------------+"+i);

		return  "redirect:listProduct_class?id=" +category_id;

	}
	@RequestMapping("/editProductImage")
	public String editProductImage(Model model, Integer product_id) {
		BookNew bookNew=bookNewService.get(product_id);
		model.addAttribute("products",bookNew);

		return  "admin/editProductImage";

	}
	@RequestMapping("/image")
	public String editProductImage(Model model, String url) {
		model.addAttribute("url",url);
		return "image";

	}
}
