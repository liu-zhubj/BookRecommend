package service;


import mapper.BookMapper;
import mapper.CategoryClassMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pojo.Book;
import pojo.BookExample;
import pojo.CategoryClass;
import pojo.CategoryClassExample;

import java.util.List;

/**
 * PropertyService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-下午 19:07
 */
@Service
public class CategoryClassServiceImpl implements CategoryClassService {

	@Autowired
	CategoryClassMapper categoryClassMapper;
	@Autowired
	BookMapper bookMapper;



	//public void add(Property property) {propertyMapper.insert(property);}

	//public void delete(Integer id) { propertyMapper.deleteByPrimaryKey(id); }

	//public void update(Property property) {propertyMapper.updateByPrimaryKey(property);}

	public List<CategoryClass> list(Integer category_id) {
		CategoryClassExample example = new CategoryClassExample();
		/*PropertyExample.Criteria criteria=example.createCriteria();
		criteria.andCategory_idEqualTo(category_id);*/
		example.or().andCategoryIdEqualTo(category_id);
		List<CategoryClass> CategoryClasses = categoryClassMapper.selectByExample(example);
		//System.out.println(CategoryClasses.get(0).getCategoryClassname()+"[[[[");
		System.out.println(CategoryClasses);
		return CategoryClasses;
	}

   public	List<CategoryClass> selectByCategoryId(Integer category_id)

   {
   	//System.out.println("SelectBy方法"+"可行————————————————————————————————————————");
   //System.out.println(categoryClassMapper+"categoryMapper----------------------------------------------------------------");
   	List<CategoryClass> classList=categoryClassMapper.selectByCategoryId(category_id);
   	return classList;
   }

	@Override


	public CategoryClass get(Integer id){
		return categoryClassMapper.selectByPrimaryKey(id);
	}
	public void update(CategoryClass categoryClass){
		categoryClassMapper.updateByPrimaryKey(categoryClass);
	}

	public  void add(CategoryClass categoryClass)
	{
		categoryClassMapper.insertSelective(categoryClass);
	}
	//public Property get(Integer id) {return propertyMapper.selectByPrimaryKey(id);}

	public List<Book> getListBookByClass(Integer category_id)
	{
		List<Book> books=bookMapper.getListBookByClass(category_id);
		return books;
	}

	public void put(Integer id)
	{
		System.out.println("lalalaallal------------------------------"+id);
	}

	@Override
	public int  delete(Integer id){
		CategoryClassExample categoryClassExample=new CategoryClassExample();
		categoryClassExample.or().andIdEqualTo(id);
		int i=categoryClassMapper.deleteByExample(categoryClassExample);
		return i;
	}
	@Override
	public List<CategoryClass> selectAll(){
		CategoryClassExample categoryClassExample=new CategoryClassExample();
		return categoryClassMapper.selectByExample(categoryClassExample);
	}
}
