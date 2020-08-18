package service;

import mapper.UserMapper;
import pojo.User;
import pojo.UserExample;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * UserService 实现类
 *
 * @author: @我没有三颗心脏
 * @create: 2018-04-29-上午 9:47
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserMapper userMapper;

	@Override
	public List<User> list() {
		UserExample example = new UserExample();
		return userMapper.selectByExample(example);
	}

	@Override
	public void updatePassword(int id, String password) {
		User user = get(id);
		user.setPassword(password);
		userMapper.updateByPrimaryKey(user);
	}

	@Override
	public User get(Integer id) {
		return userMapper.selectByPrimaryKey(id);
	}

	@Override
	public User get(String name, String password) {
		UserExample example = new UserExample();
		example.or().andNameEqualTo(name).andPasswordEqualTo(password);
		List<User> result = userMapper.selectByExample(example);
		if (result.isEmpty())
			return null;
		return result.get(0);
	}

	@Override
	public boolean isExist(String name) {
		UserExample example =new UserExample();
		example.or().andNameEqualTo(name);
		List<User> result= userMapper.selectByExample(example);
		if(!result.isEmpty())
			return true;
		return false;
	}

	@Override
	public int add(User user) {

		return userMapper.insertSelective(user);
	}

	@Override
	public int delete(Integer id) {

		return userMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int update(User user) {

		return userMapper.updateByPrimaryKeySelective(user);
	}
	@Override
	public List<User> searchUser(String s){
		UserExample  userExample=new UserExample();
		String s1="%"+s+"%";
		userExample.or().andNameLike(s1);
		userExample.or().andGenderLike(s1);
		userExample.or().andEmailLike(s1);
		userExample.or().andPhoneLike(s1);
		return userMapper.selectByExample(userExample);
	}

}
