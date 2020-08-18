package mapper;

import java.util.List;
import org.apache.ibatis.annotations.Param;
import pojo.CategoryClass;
import pojo.CategoryClassExample;

public interface CategoryClassMapper {
    long countByExample(CategoryClassExample example);

    int deleteByExample(CategoryClassExample example);

    int insert(CategoryClass record);

    int insertSelective(CategoryClass record);

    CategoryClass selectByPrimaryKey(Integer id);

    int updateByPrimaryKey(CategoryClass record);

    List<CategoryClass> selectByCategoryId(Integer id);

    List<CategoryClass> selectByExample(CategoryClassExample example);

    int updateByExampleSelective(@Param("record") CategoryClass record, @Param("example") CategoryClassExample example);

    int updateByExample(@Param("record") CategoryClass record, @Param("example") CategoryClassExample example);
}