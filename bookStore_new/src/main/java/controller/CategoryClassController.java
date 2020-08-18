package controller;

import pojo.BookNew;
import pojo.Category;
import pojo.CategoryClass;
import service.BookNewService;
import service.CategoryClassService;
import service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * Property 控制器
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-下午 19:00
 */
@Controller
@RequestMapping("/admin")
public class CategoryClassController {

	@Autowired
	CategoryService categoryService;

	@Autowired
	CategoryClassService categoryClassService;
	@Autowired
	BookNewService bookNewService;


	@RequestMapping("/editCategoryredirt")
	public String editCategory1(Model model,Integer id) {
		List<Category> categories=categoryService.list();
		CategoryClass categoryClass=categoryClassService.get(id);
		model.addAttribute("categoryclass",categoryClass);
		model.addAttribute("categories",categories);
		return "admin/editCategory_class";
	}

	@RequestMapping("/listCategoryClass")
	public String list(Model model, Integer category_id) {
		List<CategoryClass> categoryClasses=categoryClassService.list(category_id);
		model.addAttribute("categoryClasses", categoryClasses);
		Category category = categoryService.get(category_id);
		model.addAttribute("category", category);
		return "admin/listCategoryClass";
	}

	@RequestMapping("/editCategoryClass")
	public String edit(Integer id, Model model) {
		CategoryClass  categoryClass=categoryClassService.get(id);
		//Property property = propertyService.get(id);
		model.addAttribute("categoryClass", categoryClass);
		Category category = categoryService.get(categoryClass.getCategoryId());
		model.addAttribute("category", category);
		return "admin/editCategoryClass";
	}

	@RequestMapping("/updateCategoryClass")
	public String update(CategoryClass categoryClass) {
		System.out.println(categoryClass.getCategoryClassname()+"---------------------------------------------lalalalalalaal----------------------------------------------");
		System.out.println(categoryClass.getCategoryClassname()+"更新子类啦，得到的分类是"+categoryClass.getCategoryClassname()+" "+categoryClass.getCategoryId());
		categoryClassService.update(categoryClass);

		return "redirect:listCategory";
	}

	@RequestMapping("/addCategoryClass")
	public String add(CategoryClass categoryClass) {
		categoryClassService.add(categoryClass);
		return "redirect:listCategory" ;
	}

	@RequestMapping("/deleteCategory_class")
	public String deleteCategory(Integer id,Integer categoryId) {
		int i=categoryClassService.delete(id);
		System.out.println("删除子类成功了吗"+i);
		return "redirect:listCategory";
	}
	@RequestMapping("/searchBook")
	public String searchBook(Model m ,String s){
		if(s.equals("")||s.equals(null)){
			return  "redirect:listProduct_class?id=0";
		}else
		{
			List<BookNew> bookNewList=bookNewService.search(s);
			m.addAttribute("products",bookNewList);
			return "admin/listProduct";

		}
	}

	@RequestMapping("/listProduct_class")
	public String listProduct_class(Model model, Integer id) {
		if(id==null||id==0) {



			List<BookNew> bookNewList = bookNewService.listBookNewAll();
			model.addAttribute("products", bookNewList);

		}
		else{
			CategoryClass categoryClass = categoryClassService.get(id);
			System.out.println("Categoryclass))))))))))))))))))))))" + categoryClass.getCategoryClassname());
			List<BookNew> bookNewList = bookNewService.listBookNew(categoryClass.getCategoryClassname());
			model.addAttribute("products", bookNewList);
			model.addAttribute("categoryClass", categoryClass);
		}
		return "admin/listProduct";

	}

	/*@RequestMapping("/addProperty")
	public String add(Property property) {
		propertyService.add(property);
		return "redirect:listProperty?category_id=" + property.getCategory_id();
	}

	@RequestMapping("/deleteProperty")
	public String delete(Integer id) {
		int category_id = propertyService.get(id).getCategory_id();
		propertyService.delete(id);
		return "redirect:listProperty?category_id=" + category_id;
	}

	@RequestMapping("/editProperty")
	public String edit(Integer id, Model model) {
		Property property = propertyService.get(id);
		model.addAttribute("property", property);
		Category category = categoryService.get(property.getCategory_id());
		model.addAttribute("category", category);
		return "admin/editProperty";
	}

	@RequestMapping("/updateProperty")
	public String update(Property property) {
		propertyService.update(property);
		return "redirect:listProperty?category_id=" + property.getCategory_id();
	}*/
}
