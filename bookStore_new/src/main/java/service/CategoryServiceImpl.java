package service;

import mapper.CategoryMapper;
import pojo.Category;
import pojo.CategoryExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * CategoryService 的实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-27-下午 16:35
 */
@Service
public class CategoryServiceImpl implements CategoryService {

	@Autowired
	CategoryMapper categoryMapper;

	public List<Category> list() {
		CategoryExample example = new CategoryExample();
		List<Category> categories = categoryMapper.selectByExample(example);
		return categories;
	}

	public Category get(Integer id) {
		return categoryMapper.selectByPrimaryKey(id);
	}

	public void update(Category category) {
		categoryMapper.updateByPrimaryKey(category);
	}

@Override
	public int add(Category category){
		int i=categoryMapper.insertSelective(category);
		return i;
}
@Override
public int delete(Integer id){
		int i=categoryMapper.deleteByPrimaryKey(id);
		return id;
}


}
